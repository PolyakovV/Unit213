#include <stdio.h>
//#include "Driver\DrvUART.h"
//#include "Driver\DrvGPIO.h"
//#include "Driver\DrvSYS.h"
#include "misc.h"
#include "module.h"
//#include "lcd.h"
//#include "lcddisplay.h"
#include "stdio.h"
#include "string.h"
#include "udp.h"
#include "ext_var.h"
#include "custerm.h"


#define	UDP_SERVER1	"\"183.25.253.238\",3061\r"
#define	UDP_SERVER2	"\"192.168.1.100\",3061\r"

#define	HEAD_ACC	0
#define	HEAD_STX	5
#define	HEAD_LEN 	6
#define	HEAD_CMD 	8
#define	HEAD_SEQ	10
#define	HEAD_TIME	14
#define	HEAD_SRC	18
#define	HEAD_CHK	19

#define	DATA_MAC	0
#define	DATA_VER	6
#define	DATA_TEST	8
#define	DATA_SUPER	10
#define	DATA_DATA	11

#define	GPSINTERVAL	5
#define	GPSINTERVAL_VALID	300
enum
{
	PACKET_NULL = 0,
	PACKET_TXINIT =(1<<1),
	PACKET_SIGNAL_1 =(1<<2),	// Alarm with GPS
	PACKET_SIGNAL_2 =(1<<3),	// Alarm with no GPS
	PACKET_SIGNAL_3 =(1<<4),	// Cancel Alarm with GPS
	PACKET_SIGNAL_4 =(1<<5),	// Cancel Alarm no GPS
	PACKET_SIGNAL_5 =(1<<6),	// Alarm with GPS and low battery
	PACKET_SIGNAL_6 =(1<<7)		//  Alarm without GPS and low battery
};

#define	VER_MARJOR		0x01
#define	VER_MINOR		0x50;
#define	VER_TEST_MARJOR	0x01;
#define	VER_TEST_MINOR	0x10;

uint8_t	Flag_TxInitOk;
uint8_t	Flag_RecvUdp = FALSE;
uint8_t	TimerUdp;
uint8_t	udp_head[21];
Packet  packet;

uint8_t	udp_buff[UDP_BUFF_MAX];
uint8_t	udp_buff_index;
uint8_t	udp_recv[50];
uint8_t	udp_recv_length;	

uint8_t	signalIndex;
uint8_t	usedIpServer = 0;
uint16_t	logSet = 0;

// TRUE: 该消息已经发送过了
typedef struct 
{
	uint8_t  txInit:1;
	uint8_t  alarm:1;	
	uint8_t  gps:1;
	uint8_t  lowBat:1;
	uint8_t  cancel:1;
	uint8_t  RESERVE:3;
} SendSigalFlag;

SendSigalFlag sendSigalFlag;
const char *NOGPSINFO = "00.000000,-00.000000";
char gpsInfo[23];
char gMnc[4];
//char CspiInfo[23];

uint8_t	TXInitPacketCreate(void);


uint8_t checkPacketFormat(void)
{
	if( udp_recv_length>=14
		&& udp_recv[HEAD_SEQ+2]==udp_head[HEAD_SEQ+2] 
		&& udp_recv[HEAD_SEQ+3]==udp_head[HEAD_SEQ+3] )
		return TRUE;
	else
		return FALSE;
}

void XorCalcurate(uint8_t *data, uint8_t length, uint8_t *result)
{
	uint8_t	i, j=0;

	for(i=0; i<length; i++)
		j ^= data[i];
	
	*result = 0xff ^ j;

	return;
}

void CrcCalcurate(void)
{
	uint16_t	crc = 0;
	uint8_t	i;
	
	udp_head[HEAD_CHK] = 0;
	udp_head[HEAD_CHK+1] = 0;	

	for(i=HEAD_STX; i<21; i++)
	{
		crc += udp_head[i];
	}

	for(i=0; i<packet.dataLen; i++)
	{
		crc += packet.packetData[i];
	}	

	udp_head[HEAD_CHK] = crc >> 8;	
	udp_head[HEAD_CHK+1] = crc & 0xff;
}

void SetSendSigalFlag(void)
{
//	debug_8("SetSendSigalFlag()", signalIndex, TRUE);
	switch(signalIndex)
	{
	case PACKET_TXINIT:
		sendSigalFlag.txInit = 1;	
		break;
				
	case PACKET_SIGNAL_1:
		sendSigalFlag.alarm = 1;
		sendSigalFlag.gps = 1;
#ifdef GPS_AUTO		
		if( gpsSendCnt >= 1)
		{
			TimerGpsPeriod = GPSINTERVAL_VALID;
		}	
		else
		{
			TimerGpsPeriod = GPSINTERVAL;
			gpsSendCnt++;
		}
#endif		
		break;
		
	case PACKET_SIGNAL_2:
		sendSigalFlag.alarm = 1;	
		break;
				
	case PACKET_SIGNAL_3:
		sendSigalFlag.alarm = 1;
		sendSigalFlag.gps = 1;
#ifdef GPS_AUTO		
		if( gpsSendCnt >= 1)
		{
			TimerGpsPeriod = GPSINTERVAL_VALID;
		}	
		else
		{
			TimerGpsPeriod = GPSINTERVAL;
			gpsSendCnt++;
		}
#endif		
		sendSigalFlag.cancel = 1;	
		break;
				
	case PACKET_SIGNAL_4:
		sendSigalFlag.alarm = 1;
		sendSigalFlag.cancel = 1;	
		break;
				
	case PACKET_SIGNAL_5:
		sendSigalFlag.alarm = 1;
		sendSigalFlag.gps = 1;
#ifdef GPS_AUTO		
		if( gpsSendCnt >= 1)
		{
			TimerGpsPeriod = GPSINTERVAL_VALID;
		}	
		else
		{
			TimerGpsPeriod = GPSINTERVAL;
			gpsSendCnt++;
		}
#endif		
		sendSigalFlag.lowBat = 1;	
		break;

	case PACKET_SIGNAL_6:
		sendSigalFlag.alarm = 1;
		sendSigalFlag.lowBat = 1;	
		break;	
				
	default:
		break;	
	}
}


void CmdSet(uint16_t cmd)
{
	udp_head[HEAD_CMD] = cmd >> 8;
	udp_head[HEAD_CMD+1] = cmd & 0xff;
}

void SeqInc(void)
{
	if( (++udp_head[HEAD_SEQ+3]) == 0)
		udp_head[HEAD_SEQ+2]++;
}

uint8_t AccSet(void)
{
	u8	acc[5];
	
#if 1
	AccountGet();
	if( gPhoneNumOk==PHONE_NUM_READY && Str2Hexs(gSia, 5,  acc) )
	{
		memcpy(&udp_head[HEAD_ACC], acc, 5);
		return TRUE;
	}
	
	return FALSE;
#else
	uint8_t	temp[21];
	uint8_t	cnt = 3;
	uint8_t	i, j;	
	
	do
	{
		j = GetModuleIMEI(temp, 21);
		if( j >= 10 )
		{
			j -= 10;
			for(i=0; i<10; i++)
			{
				udp_head[HEAD_ACC+i] = (temp[j++] - '0') << 4;
				udp_head[HEAD_ACC+i] += (temp[j++] - '0');								
			}
			
			return TRUE;
		}
	} while(cnt--);

	return FALSE;
#endif	

}

uint8_t MacSet(void)
{
	strcpy((char *)&packet.packetData[DATA_MAC+1], "\x03\x4F\x01\x23\x45");
	return TRUE;
}

void SuperSet(uint8_t super)
{
	packet.packetData[DATA_SUPER] = super;
}


void SiaAcountSet(uint8_t *position)
{
	uint8_t	i = *position;
#if 0
	uint8_t length;

	length = strlen(custermParam.param.sia);
	i = DATA_DATA + i;
	packet.packetData[i] = length;	// 数据长度
	packet.packetData[i+1] = 0x23;	// 类型
	memcpy(&packet.packetData[i+2], custermParam.param.sia, length); // SIA Account
	XorCalcurate(&packet.packetData[i], length+2, &packet.packetData[i+length+2]); // checkout
	*position = *position + length + 3;	// 3: 长度 类型 checkout 
#else

	i = DATA_DATA + i;
	packet.packetData[i] = 10;	// 数据长度
	packet.packetData[i+1] = 0x23;	// 类型
	memcpy(&packet.packetData[i+2], gSia, 10); // SIA Account
	XorCalcurate(&packet.packetData[i], 10+2, &packet.packetData[i+10+2]); // checkout
	*position = *position + 10 + 3;	// 3: 长度 类型 checkout 

#endif
}


u8 AddVoltageInfo(char *event)
{
	MeasurePower(2);
	event[0] = '/';
	BatteryVoltage(adc_result, event+1);
	event[5] = 'V';
	event[6] = '*';
	return 7;	
}

// true: 成功
uint8_t UdpHeadInit(void)
{
	static uint8_t headInit = FALSE;

	if(headInit != FALSE)
		return TRUE;
	
	memset(udp_head, 0, sizeof(udp_head));
	if( AccSet() == FALSE )
		return FALSE;

	udp_head[HEAD_STX] = 0x7E;
#if 0	
	udp_head[HEAD_TIME] = 0x4E;
	udp_head[HEAD_TIME+1] = 0x72; 
	udp_head[HEAD_TIME+2] = 0x1C;
	udp_head[HEAD_TIME+3] = 0x80; 
#endif
	headInit = TRUE;

	return TRUE;
}

// true: 成功
uint8_t UdpDataInit()
{
	static uint8_t dataInit = FALSE;

	if(dataInit != FALSE)
		return TRUE;
	
	memset(&packet, 0, sizeof(packet));
	if( MacSet() == FALSE )
		return FALSE;

	packet.packetData[DATA_VER] = VER_MARJOR;
	packet.packetData[DATA_VER+1] = VER_MINOR;

	packet.packetData[DATA_TEST] = VER_TEST_MARJOR;
	packet.packetData[DATA_TEST+1] = VER_TEST_MINOR;
 
	dataInit = TRUE;

	return TRUE;
}
	

void UdpPacketInit(void)
{
	if( Flag_Power_Down )
		return;
	
	memset(&sendSigalFlag, 0, sizeof(sendSigalFlag));
	UdpHeadInit();
	UdpDataInit();
}


void ClientInit(void)
{
	Flag_TxInitOk = FALSE;
#if 1
	if( TXInitPacketCreate() == FALSE )
	{
		TimerSock = 80;
		return;
	}
	
	UdpSend();
#else
	if( TXInitPacketCreate() != FALSE )
	{
		TimerSock = 60;
		return;
	}

	SIAEventPacketCreate(Flag_ObtainGps, Flag_LowBat, Flag_Power_Down);
	UdpSend();
#endif


	TimerUdp = UDP_DELAY;
}

uint8_t	TXInitPacketCreate(void)
{	
	if( UdpHeadInit()==FALSE || UdpDataInit()==FALSE)
		return FALSE;
//	debug("TXInitPacketCreate()");

#if 0	
	SuperSet(0x01);
#else
	SuperSet(0x00);
#endif
	packet.dataLen = DATA_DATA;
	packet.tryTime = 0;
	packet.valid = TRUE;
	udp_head[HEAD_LEN] = 0;
	udp_head[HEAD_LEN+1] = packet.dataLen + 16;

	memset(&udp_head[HEAD_TIME], 0, 4);
	memset(&udp_head[HEAD_SEQ], 0, 4);
			
	CmdSet(0);
	
	CrcCalcurate();
	signalIndex = PACKET_TXINIT;
	return TRUE;
}

void SIAEventPacketCreate(uint8_t gps, uint8_t lowBat, uint8_t shutdown)
{
	uint8_t	i, j;
	uint8_t log;
	
#if 0	
	delay_50ms(10);
	SendAtCommand("at+");
	SendAtCommand(gps);
	SendAtCommand("\r\n");
	delay_50ms(10);	

	if( lowBat )
		debug("at+need lowBat");
	else
		debug("at+neednot lowBat");
	delay_50ms(10);	
	
	if( shutdown )
		debug("at+need shutdown");
	else
		debug("at+neednot shutdown");
	delay_50ms(10);	
	
	if( sendSigalFlag.txInit )
		debug("at+info: txInit ok");
	else
		debug("at+info: txInit nok");		
	delay_50ms(10);
		
	if( sendSigalFlag.alarm )
		debug("at+info: alarm ok");
	else
		debug("at+info: alarm nok");		
	delay_50ms(10);
		
	if( sendSigalFlag.gps )
		debug("at+info: gps ok");
	else
		debug("at+info: gps nok");		
	delay_50ms(10);	

	if( sendSigalFlag.lowBat )
		debug("at+info: lowBat ok");
	else
		debug("at+info: lowBat nok");		
	delay_50ms(10);	
#endif

	//if(gps == FALSE)
		SignalIntensity = signal_quality();

	SuperSet(0x00);
	i = 0;
	SiaAcountSet( &i );	// SIA Account

	j = i;	// SIA Event length 的位置
	debug_8("length position:", j, TRUE);

#if 0	
	packet.packetData[DATA_DATA+i] = 0x28 + strlen(gpsInfo) - 20;	// SIA Event length
	if(gps == TRUE)
		packet.packetData[DATA_DATA+i] += strlen(gMnc);
	debug_8("length 1:", packet.packetData[DATA_DATA+j], TRUE);
#endif

	i++;
	log = i;
	strcpy((char *)&packet.packetData[DATA_DATA+i], "Nri1/");
	i += strlen("Nri1/");
	
	if( shutdown )
	{	
		gLogPowerDownExpect = FALSE;
		
		if(gps == FALSE)
		{
			strcpy((char *)&packet.packetData[DATA_DATA+i], "OC00");
			i += strlen("OC00");

			i += AddVoltageInfo((char *)&packet.packetData[DATA_DATA+i]);
			
			Dec2Txt(SignalIntensity, &packet.packetData[DATA_DATA+i], 3);
			i += 3;
			
			packet.packetData[DATA_DATA+i] = '\"';
			i++;
			
			packet.packetData[DATA_DATA+i] = 0;			
			signalIndex = PACKET_SIGNAL_4;
		}
		else
		{
			strcpy((char *)&packet.packetData[DATA_DATA+i], "OC99");
			i += strlen("OC99");
			
			i += AddVoltageInfo((char *)&packet.packetData[DATA_DATA+i]);	// voltage

			Dec2Txt(SignalIntensity, &packet.packetData[DATA_DATA+i], 3); // csq
			i += 3;
			
			packet.packetData[DATA_DATA+i] = '\"';
			i += 1;
			
			strcpy((char *)&packet.packetData[DATA_DATA+i], gMnc);	// mnc
			i += strlen(gMnc);
			
			strcpy((char *)&packet.packetData[DATA_DATA+i], "\"");	
			i += 1;
			signalIndex = PACKET_SIGNAL_3;
		}	
	}
	else
	{
		if(state != STATE_TEST)
		{
			strcpy((char *)&packet.packetData[DATA_DATA+i], "UA");
			i += strlen("UA");
		}
		else
		{
			strcpy((char *)&packet.packetData[DATA_DATA+i], "RX");
			i += strlen("RX");
		}
		
		if(gps == FALSE)
		{
			strcpy((char *)&packet.packetData[DATA_DATA+i], "00");
			i += strlen("00");
		}
		else
		{
			strcpy((char *)&packet.packetData[DATA_DATA+i], "99");
			i += strlen("99");
		}	

		if( lowBat )
		{
			//delay_50ms(10);
			strcpy((char *)&packet.packetData[DATA_DATA+i], "/XT00");
			i += strlen("/XT00");
			packet.packetData[DATA_DATA+j] += 5;// 修改 SIA Event length
			debug_8("length 2:", packet.packetData[DATA_DATA+j], TRUE);
			signalIndex = (gps==FALSE) ? PACKET_SIGNAL_6 : PACKET_SIGNAL_5;
		}
		else if( gps == TRUE )
		{
			signalIndex = PACKET_SIGNAL_1;
			//packet.packetData[DATA_DATA+j] = 0x09;// 修改 SIA Event length
			SuperSet(0xD4);
		}
		else
		{
			signalIndex = PACKET_SIGNAL_2;
		}

		if( gps == FALSE )
		{
			i += AddVoltageInfo((char *)&packet.packetData[DATA_DATA+i]);
			
			Dec2Txt(SignalIntensity, &packet.packetData[DATA_DATA+i], 3);
			i += 3;
			
			packet.packetData[DATA_DATA+i] = '\"';
			i++;
			
			packet.packetData[DATA_DATA+i] = 0;			
			//signalIndex = PACKET_SIGNAL_4;
		}
		else
		{
			i += AddVoltageInfo((char *)&packet.packetData[DATA_DATA+i]);

			Dec2Txt(SignalIntensity, &packet.packetData[DATA_DATA+i], 3);
			i += 3;

			packet.packetData[DATA_DATA+i] = '\"';
			i += 1;
			
			strcpy((char *)&packet.packetData[DATA_DATA+i], gMnc);
			i += strlen(gMnc);
			
			strcpy((char *)&packet.packetData[DATA_DATA+i], "\"");	
			i += 1;
		}
	}
		
	strcpy((char *)&packet.packetData[DATA_DATA+i], gpsInfo);
	i += strlen(gpsInfo);
	strcpy((char *)&packet.packetData[DATA_DATA+i], "\"*");
	i += strlen("\"*");

//*******************************************************
	if((logSet&signalIndex) == 0)
	{		
		packet.packetData[DATA_DATA+i] = 0;
		WriteLog( (char *)&packet.packetData[DATA_DATA+log] );
		logSet |= signalIndex;
	}
	
//*******************************************************
	debug_8("length 2:", i-j-2, TRUE);
	packet.packetData[DATA_DATA+j] = i - j - 2;
	
	XorCalcurate(&packet.packetData[DATA_DATA+j], i-j, &packet.packetData[DATA_DATA+(i++)]); // checkout
	
	packet.packetData[DATA_DATA+(i++)] = 0x40; 
	packet.packetData[DATA_DATA+(i++)] = 0x30; 
	packet.packetData[DATA_DATA+(i++)] = 0x8F;
		
	packet.dataLen = i + DATA_DATA;
	packet.tryTime = 0;
	
	udp_head[HEAD_LEN] = 0;
	udp_head[HEAD_LEN+1] = packet.dataLen + 16;
	SeqInc();
	CmdSet(0x04);
	CrcCalcurate();

//	debug_8("SIAEventPacketCreate()", signalIndex, TRUE);
	
	return;
}

uint8_t TypeNextUdp(uint8_t gps, uint8_t lowBat, uint8_t shutdown)
{
	uint8_t	type = PACKET_SIGNAL_1;

	if( shutdown )
	{	
		if(gps == FALSE)
		{
			type = PACKET_SIGNAL_4;
		}
		else
		{
			type = PACKET_SIGNAL_3;
		}	
	}
	else
	{
		if( lowBat )
		{
			type = (gps==FALSE) ? PACKET_SIGNAL_6 : PACKET_SIGNAL_5;
		}
		else if( gps == TRUE )
		{
			type = PACKET_SIGNAL_1;
		}
		else
		{
			type = PACKET_SIGNAL_2;
		}
	}
	
	return type;
}


void UdpSend(void)
{
	uint8_t	length[4];

	sockState = SOCKSTATE_SENDDING;
	SendAtCommand("AT+CIPSEND=0,");
	Dec2Txt(packet.dataLen+21, length, 0);
	SendAtCommand(length);
	SendAtCommand(",");
//	SendAtCommand(UDP_SERVER);

	if( usedIpServer == 0)
		SendAtCommand(custermParam.param.server1);
	else
		SendAtCommand(custermParam.param.server2);

	SendAtCommand("\r\n");
	
	sdly = 100;
	while(sdly && !strchr((char *)(&tc35data[g_rsq]), '>'))
	{
		FeedWatchdog();
	}
	
	if( sdly )
	{
		delay_ms(10);
		SendData(udp_head, 21);
		SendData(packet.packetData, packet.dataLen);
//		debug_8("last", packet.packetData[packet.dataLen-1], TRUE);
		
		module_WaitResponse(20);
//		ResetUartFlag();
	}

	TimerUdp = UDP_DELAY;	// 5s	
}

void UdpHandle(void)
{
	if((STATE_STANDBY==state) || Flag_SimExist==FALSE)
		return;
	
	if( Flag_RecvUdp )
	{
		Flag_RecvUdp = FALSE;

		if( checkPacketFormat() )
		{
			if(udp_head[HEAD_TIME]==0 && udp_head[HEAD_TIME+1]==0 && udp_head[HEAD_TIME+2]==0 
				&& udp_head[HEAD_TIME+3]==0 && udp_recv_length == 18)
			{
				memcpy(&udp_head[HEAD_TIME], &udp_recv[HEAD_TIME], 4);
				//SetDateTime(&udp_head[HEAD_TIME]);
			}
		
			SetSendSigalFlag();
			if( sendSigalFlag.txInit )
				Flag_TxInitOk = TRUE;

			if(state == STATE_BYE)
				EnterStandby();
			else
				sockState = SOCKSTATE_SEND;
		}	
	}
	
	if( sockState==SOCKSTATE_SENDDING && TimerUdp==0 )
	{
		if( packet.tryTime < UDP_TRY_MAX )
		{
			++packet.tryTime;
			if(  Flag_TxInitOk == TRUE
				&& signalIndex != TypeNextUdp(Flag_ObtainGps,  Flag_LowBat,  Flag_Power_Down) )
				SIAEventPacketCreate(Flag_ObtainGps, Flag_LowBat, Flag_Power_Down);
			UdpSend();
		}
	#if 1	
		else if( Flag_TxInitOk==FALSE && (packet.tryTime < UDP_INIT_TRY_MAX) )
		{
			++packet.tryTime;
			UdpSend();
		}
	#endif		
		else if(state == STATE_BYE)
		{
			EnterStandby();
		}
		else 
		{
			Flag_TxInitOk = FALSE;
			memset(&sendSigalFlag, 0, sizeof(sendSigalFlag));
			usedIpServer = (usedIpServer==1) ? 0 : 1;
	#if 1		
			if( TXInitPacketCreate() )
				UdpSend();
	#else
			if( TXInitPacketCreate() != FALSE )
			{
				SIAEventPacketCreate(Flag_ObtainGps, Flag_LowBat, Flag_Power_Down);
				UdpSend();
			}
	#endif
		}
	}
	
	if( sockState == SOCKSTATE_SEND )
	{
		if( (sendSigalFlag.alarm==0)
			|| ((sendSigalFlag.lowBat==0) && Flag_LowBat)
			|| ((sendSigalFlag.gps==0) && Flag_ObtainGps) )
		{
			SIAEventPacketCreate(Flag_ObtainGps, Flag_LowBat, Flag_Power_Down);
			UdpSend();
		}
	}
}


#if 0
void udpTest(void)
{
	strcpy(gpsInfo, "38.889722,-77.008889");

	Flag_LowBat = TRUE;
	Flag_Power_Down = TRUE;
	SIAEventPacketCreate(Flag_ObtainGps, Flag_LowBat, Flag_Power_Down);
}
#endif

void udpParamInit()
{
	Flag_TxInitOk = FALSE;
	memset(&sendSigalFlag, 0, sizeof(sendSigalFlag));
	usedIpServer = 0;
}


void ResendGpsSig(void)
{
	sendSigalFlag.gps = 0;
}

#ifdef GPS_AUTO
uint8_t GetGpsSig(void)
{
	return sendSigalFlag.gps;
}
#endif

