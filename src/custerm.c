#include <stdio.h>
//#include "Driver\DrvUART.h"
//#include "Driver\DrvGPIO.h"
//#include "Driver\DrvSYS.h"
//#include "Driver\DrvADC.h"
#include "lib.h"
#include "misc.h"
#include "module.h"
//#include "LcdDisplay.h"
#include "Ext_var.h"
#include "interrupt.h"
//#include "lcd.h"
#include "udp.h"
#include "string.h"
#include "custerm.h"
//#include "Driver\DrvFmc.h"

#define	NV_VERSION			0xabcd0007

#define	NV_VERSION_BASE		0x1f000

#define	PARAM_BASE			0x1f200
#define	PARAM_BASE2			0x1f400

#define	OFFSET_VALID		  0	// 4
#define	OFFSET_TRANSFER		4	// 4
#define	OFFSET_DATA			  8

#define	VALID		0x00ff1240
#define	TRANSFER	0xabcdffff

#define	LOG_BASE		0x1f600;	// 0x1f000+1024

#define SECT_SIZE		128
#define PAGE_SIZE		512

enum
{
	TYPE_APN=0,
	TYPE_APN2,	
	TYPE_IP1,
	TYPE_IP2,
	TYPE_PHONE1,
	TYPE_PHONE2,
	TYPE_LOCALPORT,
	TYPE_DELAY,
	TYPE_DEFAULT,
	TYPE_SIA,
	TYPE_FIBRO,
	TYPE_IMEI,
	TYPE_DEBUG,
	TYPE_AGPS,
	TYPE_USER_PW,
	TYPE_USER_PW2,
	TYPE_URL,
	TYPE_SMS_PW,
	TYPE_CSQ,
	TYPE_GPSINFO,
	TYPE_NUM,
	TYPE_BATTLOWLEV,  	///-------
	TYPE_BATTEMPTYLEV,	///-------
	TYPE_BATTREPLACELEV,///-------
	TYPE_BATTDISCHARGELEV		///-------
};



CustermParam custermParam;
uint8_t	nvramIndex = 0;
uint8_t gSia[11] = {0};

uint8_t LogNextWrite = 0;
uint8_t LogRead = 0;
uint8_t LogCnt = 0;
#define	MAX_LOG	16
u8	gLogPowerDownExpect = FALSE;

void ReadFromNv(CustermParam *param);
void WritePage(CustermParam *param, uint32_t addr);
void ReadPage(CustermParam *param, uint32_t addr);
void WriteToNv(CustermParam *param);
static void Custerm_String(char *param, uint8_t type);
static void Custerm_Switch(char *param, uint8_t type);
uint8_t IsEmptyPage(uint32_t addr);
void ParamInit(void);
void LogInit(void);
void LogClean(void);
void ErasePage(uint32_t addr);

uint8_t NvVersionCheck(void)
{
	uint8_t	i;
	uint32_t	temp;
	
	for(i=0; i<4; i++)
	{
		temp = FMC_Read(NV_VERSION_BASE);
		if( temp == NV_VERSION )
			return TRUE;
	}

	debug("NV Vers bad");
	return FALSE;
}

void NvVersionWrite(void)
{
	if( IsEmptyPage(NV_VERSION_BASE)== FALSE )
		ErasePage(NV_VERSION_BASE);
	
	FMC_Write(NV_VERSION_BASE, NV_VERSION);
}


void InitDefault()
{
	memset(&custermParam, 0xff, sizeof(custermParam));
	strcpy((char *)custermParam.param.apn, "\"mpers.lifealert.com\"");
	strcpy((char *)custermParam.param.apn2, "\"apn2.apn2.com\"");
	memset((char *)custermParam.param.user_pw, 0, sizeof(custermParam.param.user_pw));
	strcpy((char *)custermParam.param.phone1, "18004300869");
	strcpy((char *)custermParam.param.phone2, "18004500969");
	//strcpy((char *)custermParam.param.phone1, "0585575953");
	//strcpy((char *)custermParam.param.phone2, "0585575953");
	
	strcpy((char *)custermParam.param.server1,"\"208.49.84.31\",3061");
	strcpy((char *)custermParam.param.server2,"\"208.49.84.31\",3061");
	strcpy((char *)custermParam.param.local_port,"3060");
//	strcpy((char *)custermParam.param.fibro,"\x98\x76\x54\x32\x10");
//	strcpy(custermParam.param.sia,"9876543210");
	strcpy((char *)custermParam.param.pin_origin, "1111");
	strcpy((char *)custermParam.param.pin_use, "1028");
	strcpy((char *)custermParam.param.gps_url, "\"12.167.62.11:7276\"");
	strcpy(custermParam.param.sms_pw, "9999");
	
	custermParam.param.debug = '1';
	custermParam.param.agps = '0';
	custermParam.param.delay = 300;
	///-----------------------------My Added strings----------------///
	custermParam.param.battLowLev       = 3000;//3100*6.6/4096  5.00V
	custermParam.param.battEmptyLev     = 2900;//3000*6.6/4096  4.83V
	custermParam.param.battReplaceLev   = 2800;//2900*6.6/4096  4.67V
	custermParam.param.battDischargeLev = 2700;//2800*6.6/4096  4.11V
	custermParam.param.lockState = FALSE;
	///-------------------------------------------------------------///
	nvramIndex = 0;

//	Hex2String(custermParam.param.fibro, 5, gSia);
	
	ErasePage(OFFSET_VALID+PARAM_BASE);
	WritePage(&custermParam, OFFSET_DATA+PARAM_BASE);
	FMC_Write(OFFSET_VALID+PARAM_BASE, VALID);
	ErasePage(OFFSET_VALID+PARAM_BASE2);
	return;
}

void NvInit()
{
	SYS_UnlockReg();
	/* Enable ISP function */
	_FMC_ENABLE_ISP();

//*******************************************************
	if( NvVersionCheck() == FALSE )
	{	
		InitDefault();
		LogClean();
#if 1		
		NvVersionWrite();
#endif		
		return;
	}
	
//*******************************************************
	ParamInit();
	LogInit();
}

void ParamInit(void)
{
	uint32_t	temp;
	uint8_t		error = FALSE;

//	debug("ParamInit");
	
	temp = FMC_Read(OFFSET_VALID+PARAM_BASE);
	if(temp == VALID)
	{
		if(FMC_Read(OFFSET_TRANSFER+PARAM_BASE) != TRANSFER)
		{
			nvramIndex = 0;
		}
		else
		{
			if(FMC_Read(OFFSET_VALID+PARAM_BASE2) == VALID)
			{
				if(FMC_Read(OFFSET_TRANSFER+PARAM_BASE2) != TRANSFER)
					nvramIndex = 1;
				else
				{
					error = TRUE;
					debug("par err 1");
				}
			}
			else
			{
				nvramIndex = 0;
			}
		}
	}
	else if((temp=FMC_Read(OFFSET_VALID+PARAM_BASE2))==VALID)
	{
		nvramIndex = 1;
	}
	else
	{
		error = TRUE;
		debug("par err 1");
	}

	if( error == TRUE )	
	{
		InitDefault();
	}
	else
	{
		ReadFromNv(&custermParam);
//		Hex2String(custermParam.param.fibro, 5, gSia);
		
		if(nvramIndex == 0)
			temp = PARAM_BASE2;
		else
			temp = PARAM_BASE;
	
		if( IsEmptyPage(temp) == FALSE )
			ErasePage(temp);
	}

}

void ReadPage(CustermParam *param, uint32_t addr)
{
	uint8_t		i, length;
	
	length = sizeof(CustermParam) >> 2;

	for(i=0; i<length; addr+=4,i++)
	{
		param->params[i] = FMC_Read(addr);
	}

}

uint8_t IsEmptySect(uint32_t addr)
{
	uint8_t		i;
	uint32_t	temp;

//	debug_32("IsEmptySect", addr);
	for(i=0; i<32; addr+=4, i++)
	{
		temp = FMC_Read(addr);
		if( 0xffffffff != temp )
			return FALSE;
	}

	return TRUE;
}

uint8_t	IsEmptyPage(uint32_t addr)
{
	uint8_t i;
	
	for(i=0; i<4; i++)
	{
		if( IsEmptySect(addr) == FALSE )
			return FALSE;
		addr += SECT_SIZE;
	}

	return TRUE;
}


void WritePage(CustermParam *param, uint32_t addr)
{
	uint8_t		i, length;
	
	length = sizeof(CustermParam) >> 2;
	
	for(i=0; i<length; addr+=4,i++)
	{
		FMC_Write(addr, param->params[i]);
	}
}


	
void ReadFromNv(CustermParam *param)
{
	uint32_t	addr;
	
	if(nvramIndex == 0)
		addr = OFFSET_DATA+PARAM_BASE;
	else
		addr = OFFSET_DATA+PARAM_BASE2;
	
	ReadPage(param, addr);

}

void WriteToNv(CustermParam *param)
{
	uint32_t	addr;
	
	if(nvramIndex == 0)
	{
		addr = OFFSET_DATA+PARAM_BASE2;
		FMC_Write(OFFSET_TRANSFER+PARAM_BASE, TRANSFER);
	}
	else
	{
		addr = OFFSET_DATA+PARAM_BASE;
		FMC_Write(OFFSET_TRANSFER+PARAM_BASE2, TRANSFER);
	}

	WritePage(param, addr);
	
	if(nvramIndex == 0)
	{
		FMC_Write(OFFSET_VALID+PARAM_BASE2, VALID);
		ErasePage(OFFSET_VALID+PARAM_BASE);
		nvramIndex = 1;
	}
	else
	{
		FMC_Write(OFFSET_VALID+PARAM_BASE, VALID);
		ErasePage(OFFSET_VALID+PARAM_BASE2);
		nvramIndex = 0;
	}
	
}

void ErasePage(uint32_t addr)
{
	//debug("**ErasePage***");
	FMC_Erase(addr+4);
	delay_ms(20);
}

//*********************************************************************************
uint8_t	IsEmptyLog(uint8_t index)
{
	uint32_t addr;	// = LOG_BASE + (index << 7);	// index * 128
	addr = index<<7;
	addr += LOG_BASE;
	
	return IsEmptySect(addr);
		
}

uint8_t IsEmptyLogPage(uint8_t page)
{
	uint32_t	addr;
	
	addr = page;
	addr <<= 9;
	addr += LOG_BASE;
	
	return IsEmptyPage(addr);
}


uint8_t GetEmptyLogIndex(uint8_t index)
{
	int8_t  i;
	uint8_t	j = 4;
	
	for(i=3; i>=0; i--)
	{
		if( IsEmptyLog(index+i) )
			j = i;
		else
			break;
	}
	
	return j;
}


void LogInit(void)
{
	uint8_t		i;
	uint8_t		index;

//	debug("LogInit");
	
	for(i=0; i<4; i++)
	{
		if( IsEmptyLogPage(i) )
			break;
	}

//	debug_8("LogInit 1", i, TRUE);
	if( i==0 )
	{
		if( IsEmptyLogPage(1) )
		{
			LogNextWrite = 0;
		}
		else
		{
			LogNextWrite = 3;
		}
	}
	else
	{
		LogNextWrite = i;
	}

	i = (LogNextWrite>0) ? LogNextWrite-1 : 3;

//	debug_8("LogInit 2", i, TRUE);
	
	index = GetEmptyLogIndex( i<<2 );
	LogNextWrite = (i<<2) + index;

//	debug_8("LogInit 3", LogNextWrite, TRUE);	

	if( LogNextWrite >= MAX_LOG)
		LogNextWrite = 0;	
}

void LogClean(void)
{
	uint8_t		i;
	uint32_t 	addr;
	
	addr = LOG_BASE;
	
	for(i=0; i<4; i++)
	{
		if( IsEmptyLogPage(i) == FALSE )
		{
			ErasePage(addr);
		}
		addr = addr + PAGE_SIZE;
	}

}

void ReadStringLog(uint32_t addr, char *buf, uint8_t wordLength)
{
	uint8_t	i;
	uint32_t *str = (uint32_t *)buf;
	
	for(i=0; i<wordLength; addr+=4,i++)
	{
		str[i] = FMC_Read(addr);
		if( str[i] < 0x1000000 )
			break;
	}

}

void WriteStringLog(uint32_t addr, char *buf, uint8_t maxWords)
{
	uint8_t		i;
	uint32_t 	*str = (uint32_t *)buf;
	uint32_t	temp;
	
	for(i=0; i<maxWords; addr+=4,i++)
	{
		temp = str[i];
		FMC_Write(addr, temp);
		if( temp < 0x1000000 )
			break;
	}

}

uint8_t ReadOneLog(uint8_t index, char *buf)
{
	uint32_t addr;

	if( IsEmptyLog(index) == TRUE )
		return LOG_EMPTY;
	
	//addr = LOG_BASE + (index << 7);	// index * 128		
	addr = index << 7;
	addr += LOG_BASE;

	if(FMC_Read(addr+OFFSET_VALID) == VALID)
	{
		ReadStringLog(addr+OFFSET_DATA, buf, 32);
		return LOG_VALID;
	}
	else
		return LOG_DIRTY;
	
}

void WriteOneLog(uint8_t index, char *buf)
{
	uint32_t addr;
	
	//addr = LOG_BASE +(index << 7);	// index * 128	
	addr = index << 7;
	debug_16("WriteOneLog", (addr&0xffff), TRUE);
	addr += LOG_BASE;
	
	FMC_Write(addr+OFFSET_TRANSFER, TRANSFER);
	WriteStringLog(addr+OFFSET_DATA, buf, 32);
	FMC_Write(addr+OFFSET_VALID, VALID);	
}

void WriteLog(char *buf)
{
	uint8_t i;	
	uint32_t addr;
	char logbuf[SECT_SIZE];

	i = LogNextWrite;
	debug_8("WriteLog 1", i, TRUE);

	if((i&3) == 0)
	{
		i = (i+4) % MAX_LOG;	// ÏÂÒ»Ò³
		
		if( IsEmptyLog(i) == FALSE )
		{
			addr = i << 7;
			addr += LOG_BASE;	// index * 128
			ErasePage(addr);
		}
	}

	if( GetDateTime(logbuf, 18) == FALSE )
		return;

	strcat(logbuf, " ");
	strcat(logbuf, (char *)gSia);
	strcat(logbuf, " ");

	if(strlen(logbuf) + strlen(buf) >= SECT_SIZE)
		return;
	
	strcat(logbuf, buf);
	WriteOneLog(LogNextWrite, logbuf);

	i = LogNextWrite + 1;
	if(i >= MAX_LOG)
	{
		i = 0;
	}
	LogNextWrite = i;

	debug_8("WriteLog 2", i, TRUE);
	
	debug("****LOG:");
	debug((u8 *)logbuf);
	
}

uint8_t ReadLog(char *buf)
{
	uint8_t ret = LOG_DIRTY;

	while(ret == LOG_DIRTY)
	{
		debug_8("ReadLog: logRead", LogRead, TRUE);
		ret = ReadOneLog(LogRead, buf);
		if( ret == LOG_EMPTY )
		{
			debug("ReadLog: LOG_EMPTY");
			LogCnt = 0;
		}
		else
		{ 
			LogRead = LogRead ? (LogRead-1) : (MAX_LOG-1);
			if( ret == LOG_VALID )
			{
				debug("ReadLog: LOG_VALID");
				LogCnt--;
			}
		}
	}
	
	return ret;
}


void LogOnOff(u8 off)
{

	char	logBuf[35] = "Nri1/";
	u8		i = 0;

	if( off )
		debug("*** log: power down ****");
	else
		debug("*** log: first call ****");

	if( Flag_ObtainGps == FALSE )
		SignalIntensity = signal_quality();
	
	i = 5; //strlen("Nri1/");
	
	if( off )
	{	
		if(Flag_ObtainGps == FALSE)
		{
			gLogPowerDownExpect = FALSE;
			strcpy(&logBuf[i], "OC00");
			i += strlen("OC00");
			i += AddVoltageInfo(&logBuf[i]);
			Dec2Txt(SignalIntensity, (u8 *)&logBuf[i], 3);
			i += 3;
			
			logBuf[i] = '\"';
			i++;
			
			logBuf[i] = 0;			
		}
		else
		{
			strcpy(&logBuf[i], "OC99");
			i += strlen("OC99");
			i += AddVoltageInfo(&logBuf[i]);
			strcpy(&logBuf[i], gMnc);
			i += strlen(gMnc);
			strcpy(&logBuf[i], "\"");	
			i += 1;
		}	
	}
	else
	{
		gLogPowerDownExpect = TRUE;
		strcpy(&logBuf[i], "UA");
		i += 2;	//strlen("UA");

		if(Flag_ObtainGps == FALSE)
		{
			strcpy(&logBuf[i], "00");
			i += 2;	//strlen("00");
		}
		else
		{
			strcpy(&logBuf[i], "99");
			i += 2;	//strlen("99");
		}	

		if( Flag_LowBat )
		{
			strcpy(&logBuf[i], "/XT00");
			i += 5;	//strlen("/XT00");
		}


		if( Flag_ObtainGps == FALSE )
		{
			i += AddVoltageInfo(&logBuf[i]);
			Dec2Txt(SignalIntensity, (u8 *)&logBuf[i], 3);
			i += 3;
			
			logBuf[i] = '\"';
			i++;
			
			logBuf[i] = 0;			
		}
		else
		{
			i += AddVoltageInfo(&logBuf[i]);
			strcpy(&logBuf[i], gMnc);
			i += strlen(gMnc);
			strcpy(&logBuf[i], "\"");
			i += 1;
		}
	}
		
	strcpy(&logBuf[i], gpsInfo);
	i += strlen(gpsInfo);
	strcpy(&logBuf[i], "\"*");
	i += 2;	//strlen("\"*");

	logBuf[i] = 0;

	WriteLog(logBuf);
}

//*********************************************************************************
static void CustomError(char *tip)
{
	if( Flag_SmsConfig )
	{
		SmsRsqAdd( tip );
		SmsRsqAdd( "=ERROR" );
		SmsRsqAdd(SPLIT_STR);
	}
	SendDebugString("ERROR\r\n");
}


void Custerm_Apn(char *param)
{
	Custerm_String(param, TYPE_APN);	
}

void Custerm_Apn2(char *param)
{
	Custerm_String(param, TYPE_APN2);	
}


void Custerm_UserPw(char *param)
{
	Custerm_String(param, TYPE_USER_PW);
}	

void Custerm_UserPw2(char *param)
{
	Custerm_String(param, TYPE_USER_PW2);
}	

void Custerm_Ip1(char *param)
{
	Custerm_String(param, TYPE_IP1);			
}

void Custerm_Ip2(char *param)
{
	Custerm_String(param, TYPE_IP2);			
}

void Custerm_Url(char *param)
{
	Custerm_String(param, TYPE_URL);			
}

void Custerm_Phone1(char *param)
{
	Custerm_String(param, TYPE_PHONE1);	
}

void Custerm_Phone2(char *param)
{
	Custerm_String(param, TYPE_PHONE2);	
}

void Custerm_LocalPort(char *param)
{
	Custerm_String(param, TYPE_LOCALPORT);
}

#if 1
void Custerm_Sia(char *param)
{
	Custerm_String(param, TYPE_SIA);
}
#endif

void Custerm_SmsPw(char *param)
{
	Custerm_String(param, TYPE_SMS_PW);
}


void Custerm_Csq(char *param)
{
	uint8_t	txt[4];
	uint8_t signal;
	uint8_t	db;
	
	if( param[0]=='\r' || param[0]=='?' )
	{
		signal = signal_quality();
		if(signal==SIGNAL_STRENGTH_INVAILD)
		{
			SendDebugString("Not Known");
		}
		else
		{
			db = 113 - (signal << 1); 
			Dec2Txt(db, txt, 0);
			SendDebugString("-");
			SendDebugString(txt);
			SendDebugString(" dBm");
		}
	
		SendDebugString("\r\n");
		SendDebugString("OK\r\n");
		
		if( Flag_SmsConfig )
		{
			SmsRsqAdd( "+CCSQ=" );
			if(signal == SIGNAL_STRENGTH_INVAILD)
			{
				SmsRsqAdd("Not Known");
			}
			else
			{
				SmsRsqAdd("-");
				SmsRsqAdd((char *)txt);
				SmsRsqAdd(" dBm");
			}
			SmsRsqAdd(SPLIT_STR);
		}
	}
	else
	{
		SendDebugString("ERROR\r\n");
	}
}

void Custerm_Default(char *param)
{
	if(param[0] == '\r')
	{
		InitDefault();
		SendDebugString( "OK\r\n" );
		if( Flag_SmsConfig )
		{
			SmsRsqAdd("Load Default Configuration");
			SmsRsqAdd(SPLIT_STR);
		}
	}
	else
	{
		SendDebugString("ERROR\r\n");
	}
}
///-------------------------My added strings---------------------------------------///
void Custerm_BattLowLev(char *param)
{
	char		*p;
	uint8_t			txt[4];
	uint32_t	i;
	
	if(param[0] == '?')
	{
		SendDebugString( "+BATTLOW=" );	
	  
		DEC2Txt(custermParam.param.battLowLev, txt,0);
		
		//DEC2Txt(3123, txt, 3);
		SendDebugString(txt);	
		if( Flag_SmsConfig )
		{
			SmsRsqAdd("+BATTLOW=");
			SmsRsqAdd((char *)txt);
			SmsRsqAdd(SPLIT_STR);
		}
		SendDebugString("\r\n");
		return;
	}
	else if(param[0] != '=')
	{
		SendDebugString( "ERROR\r\n" );
		return;
	}

	p = strchr((char *)param, '\r');
	if( p )
	{
		*p = 0;
		i = StrToInt(&param[1], p - &param[1]);
		
		if(i > 4000)
		{
			SendDebugString("ERROR\r\n");
			return;
		}
		
		custermParam.param.battLowLev = (uint16_t)(i);
		WriteToNv( &custermParam );
		if( Flag_SmsConfig )
		{
			SmsRsqAdd( "+BATTLOW=" );
			SmsRsqAdd( &param[1] );
			SmsRsqAdd(SPLIT_STR);
		}
		SendDebugString("OK\r\n");
	}
	else
	{
		SendDebugString("ERROR\r\n");
	}
}
//****************
void Custerm_BattEmptyLev    (char *param){
char		*p;
	u8		txt[4]="0000";
	uint32_t	i;
	
	if(param[0] == '?')
	{
		SendDebugString( "+BATTEMPTY=" );	
	   
		DEC2Txt(custermParam.param.battEmptyLev,txt,0);
		//Dec2Txt(custermParam.param.battEmptyLev, txt,0);
		//DEC2Txt(3123, txt, 3);
		SendDebugString(txt);	
		if( Flag_SmsConfig )
		{
			SmsRsqAdd("+BATTEMPTY=");
			SmsRsqAdd((char *)txt);
			SmsRsqAdd(SPLIT_STR);
		}
		SendDebugString("\r\n");
		return;
	}
	else if(param[0] != '=')
	{
		SendDebugString( "ERROR\r\n" );
		return;
	}

	p = strchr((char *)param, '\r');
	if( p )
	{
		*p = 0;
		i = StrToInt(&param[1], p - &param[1]);
		
		if(i > 4000)
		{
			SendDebugString("ERROR\r\n");
			return;
		}
		
		custermParam.param.battEmptyLev = (uint16_t)(i);
		WriteToNv( &custermParam );
		if( Flag_SmsConfig )
		{
			SmsRsqAdd( "+BATTEMPTY=" );
			SmsRsqAdd( &param[1] );
			SmsRsqAdd(SPLIT_STR);
		}
		SendDebugString("OK\r\n");
	}
	else
	{
		SendDebugString("ERROR\r\n");
	}
}

//****************
void Custerm_BattReplaceLev  (char *param){
char		*p;
	u8			txt[4];
	uint32_t	i;
	
	if(param[0] == '?')
	{
		SendDebugString( "+LOWBATREP=" );	
	  
		DEC2Txt(custermParam.param.battReplaceLev, txt,0);
		//DEC2Txt(3123, txt, 3);
		SendDebugString(txt);	
		if( Flag_SmsConfig )
		{
			SmsRsqAdd("+LOWBATREP=");
			SmsRsqAdd((char *)txt);
			SmsRsqAdd(SPLIT_STR);
		}
		SendDebugString("\r\n");
		return;
	}
	else if(param[0] != '=')
	{
		SendDebugString( "ERROR\r\n" );
		return;
	}

	p = strchr((char *)param, '\r');
	if( p )
	{
		*p = 0;
		i = StrToInt(&param[1], p - &param[1]);
		
		if(i > 4000)
		{
			SendDebugString("ERROR\r\n");
			return;
		}
		
		custermParam.param.battReplaceLev = (uint16_t)(i);
		WriteToNv( &custermParam );
		if( Flag_SmsConfig )
		{
			SmsRsqAdd( "+LOWBATREP=" );
			SmsRsqAdd( &param[1] );
			SmsRsqAdd(SPLIT_STR);
		}
		SendDebugString("OK\r\n");
	}
	else
	{
		SendDebugString("ERROR\r\n");
	}
}

//****************
void Custerm_BattDischargeLev(char *param){
char		*p;
	u8			txt[4];
	uint32_t	i;
	
	if(param[0] == '?')
	{
		SendDebugString( "+LOWBATDISC=" );	
	  
		DEC2Txt(custermParam.param.battDischargeLev, txt,0);
		//DEC2Txt(3123, txt, 3);
		SendDebugString(txt);	
		if( Flag_SmsConfig )
		{
			SmsRsqAdd("+LOWBATDISC=");
			SmsRsqAdd((char *)txt);
			SmsRsqAdd(SPLIT_STR);
		}
		SendDebugString("\r\n");
		return;
	}
	else if(param[0] != '=')
	{
		SendDebugString( "ERROR\r\n" );
		return;
	}

	p = strchr((char *)param, '\r');
	if( p )
	{
		*p = 0;
		i = StrToInt(&param[1], p - &param[1]);
		
		if(i > 4000)
		{
			SendDebugString("ERROR\r\n");
			return;
		}
		
		custermParam.param.battDischargeLev = (uint16_t)(i);
		WriteToNv( &custermParam );
		if( Flag_SmsConfig )
		{
			SmsRsqAdd( "+LOWBATDISC=" );
			SmsRsqAdd( &param[1] );
			SmsRsqAdd(SPLIT_STR);
		}
		SendDebugString("OK\r\n");
	}
	else
	{
		SendDebugString("ERROR\r\n");
	}
}

///-------------------------------------------------------------------------///
void Custerm_Delay(char *param)
{
	char		*p;
	u8			txt[4];
	uint32_t	i;
	
	if(param[0] == '?')
	{
		SendDebugString( "+DELAY=" );	
		Dec2Txt(custermParam.param.delay/60, txt, 0);
		
		SendDebugString(txt);	
		if( Flag_SmsConfig )
		{
			SmsRsqAdd("+DELAY=");
			SmsRsqAdd((char *)txt);
			SmsRsqAdd(SPLIT_STR);
		}
		SendDebugString("\r\n");
		return;
	}
	else if(param[0] != '=')
	{
		SendDebugString( "ERROR\r\n" );
		return;
	}

	p = strchr((char *)param, '\r');
	if( p )
	{
		*p = 0;
		i = StrToInt(&param[1], p - &param[1]);
		
		if(i > 99)
		{
			SendDebugString("ERROR\r\n");
			return;
		}
		TimerStandby = custermParam.param.delay = (uint16_t)(i*60);
		WriteToNv( &custermParam );
		if( Flag_SmsConfig )
		{
			SmsRsqAdd( "+DELAY=" );
			SmsRsqAdd( &param[1] );
			SmsRsqAdd(SPLIT_STR);
		}
		SendDebugString("OK\r\n");
	}
	else
	{
		SendDebugString("ERROR\r\n");
	}
}


void Custerm_Fibro(char *param)
{
	char		*p;
	//u8			txt[3]={0,0,0};
	uint8_t		i, j;
	
	if(param[0] == '?')
	{
		SendDebugString("+FIBRO=");	
		SendDebugString(gSia);
		SendDebugString("\r\n");

		if( Flag_SmsConfig )
		{
			SmsRsqAdd( "+FIBRO=" );
			SmsRsqAdd((char *)gSia);
			SmsRsqAdd(SPLIT_STR);
		}
		return;
	}
	else if(param[0] != '=')
	{
		SendDebugString( "ERROR\r\n" );
		return;
	}

	p = strchr((char *)param, '\r');
	if( p && p-param==11 )
	{
		*p = 0;
		p = &param[1];
		for(i=0; i<10; i++)
		{
			j = p[i++];
			if (!( (j>='0' && j <='9') || (j>='A' && j<='F') ))
			{
				CustomError("+FIBRO");
				return;
			}
		}

		if( PhoneNumberSet(&param[1]) == TRUE )
		{
			memcpy(gSia, &param[1], 10);
			SendDebugString("OK\r\n");
			
			if( Flag_SmsConfig )
			{
				SmsRsqAdd( "+FIBRO=" );
				SmsRsqAdd( (char *)gSia );
				SmsRsqAdd(SPLIT_STR);
			}
		}
		else
		{
			CustomError("+FIBRO");
		}
	}
	else
	{
		CustomError("+FIBRO");
	}
}

void Custerm_Imei(char *param)
{
	uint8_t	temp[21];
	
	if( (param[0]=='\r' || param[0]=='?') && GetModuleIMEI(temp, 21) )
	{
		SendDebugString(temp);
		SendDebugString("\r\n");
		SendDebugString("OK\r\n");
		if( Flag_SmsConfig )
		{
			SmsRsqAdd( "+IMEI=" );
			SmsRsqAdd( (char *)temp );
			SmsRsqAdd(SPLIT_STR);
			debug("temp");
			debug(temp);
		}
	}
	else
	{
		SendDebugString("ERROR\r\n");
	}
}

void Cutterm_Iccid(char *param)
{
	uint8_t temp[21];
		
	if( (param[0]=='\r' || param[0]=='?') && GetIccid((char *)temp, 20) )
	{
		SendDebugString(temp);
		SendDebugString("\r\n");
		SendDebugString("OK\r\n");
		if( Flag_SmsConfig )
		{
			SmsRsqAdd( "+ICCID=" );
			SmsRsqAdd( (char *)temp );
			SmsRsqAdd(SPLIT_STR);
			debug("temp");
			debug(temp);
		}
	}
	else
	{
		SendDebugString("ERROR\r\n");
	}
}

static void Custerm_Switch(char *param, uint8_t type)
{
	uint8_t	txt[2];
	uint8_t	*string=NULL, *rsp=NULL;

	switch( type )
	{
		case TYPE_DEBUG:
			string = &custermParam.param.debug;
			rsp = "+DEBUG=";
			break;

		case TYPE_AGPS:
			string = &custermParam.param.agps;
			rsp = "+AGPS=";
			break;
	}
	
	if(param[0] == '?')
	{
		SendDebugString(rsp);
		txt[0] = *string;
		txt[1] = 0;
		SendDebugString(txt);	
		SendDebugString("\r\n");
		if( Flag_SmsConfig )
		{
			SmsRsqAdd((char *)rsp);
			SmsRsqAdd((char *)txt);
			SmsRsqAdd(SPLIT_STR);
		}
		return;
	}
	else if((param[0] == '=') && (param[2] == '\r') && (param[1]>= '0' && param[1] <= '2' ) )
	{
		param[2] = 0;
		*string = param[1];
		WriteToNv( &custermParam );
		SendDebugString("OK\r\n");
		if(TYPE_DEBUG == type)
			InitMsgDebug();
		
		if( Flag_SmsConfig )
		{
			SmsRsqAdd( (char *)rsp );
			SmsRsqAdd( &param[1] );
			SmsRsqAdd(SPLIT_STR);
		}
	}
	else
	{
		SendDebugString("ERROR\r\n");
	}
}

void Custerm_Debug(char *param)
{
	Custerm_Switch(param, TYPE_DEBUG);	
}

void Custerm_Agps(char *param)
{
	Custerm_Switch(param, TYPE_AGPS);
}

void Custerm_Version(char *param)
{
	SendDebugString(VERSION);
	if( Flag_SmsConfig )
	{
		SmsRsqAdd("+VERSION=");
		SmsRsqAdd(VERSION);
		SmsRsqAdd(SPLIT_STR);
	}
}

void Custerm_Log(char *param)	
{
	char buf[SECT_SIZE];
	
	if( param[0]!='\r' && param[0]!='?' )
	{
		SendDebugString( "ERROR\r\n" );
	}

	LogCnt = 8;
	LogRead = (LogNextWrite==0) ? (MAX_LOG-1) : (LogNextWrite-1);		
	if( Flag_SmsConfig == FALSE )
	{
		while( LogCnt )
		{
			if( ReadLog(buf) == LOG_VALID )
			{
				SendDebugString("+LOG=");
				SendDebugString((u8 *)buf);
				SendDebugString("\r\n");
			}
		}
	}
	else
	{
		if( ReadLog(buf) == LOG_VALID )
		{
			SmsRsqAdd("+LOG=");
			SmsRsqAdd(buf);
			SmsRsqAdd(SPLIT_STR);
			TimerSms = 20;	// 2s
		}
		else
		{
			LogCnt = 0;
			SmsRsqAdd("+LOG=");
			SmsRsqAdd("LOG EMPTY");
			SmsRsqAdd(SPLIT_STR);
		}
	}
	
}

void Custerm_GpsInfo(char *param)
{
	if( param[0]=='\r' || param[0]=='?' )
	{
		SendDebugString((uint8_t *)gpsInfo);
		SendDebugString("\r\n");
		
		if( Flag_SmsConfig )
		{
			SmsRsqAdd( "http://maps.google.com/maps?q=");
			SmsRsqAdd(gpsInfo);
			//SmsRsqAdd(SPLIT_STR);
		}
	}
	else
	{
		SendDebugString("ERROR\r\n");
	}
}

static void Custerm_String(char *param, uint8_t type)
{
	char	*p=NULL; 
	uint8_t	*string=NULL, *rsp=NULL;
	uint8_t	length=0;
	
	switch( type )
	{
		case TYPE_APN:
			string = custermParam.param.apn;
			length = sizeof(custermParam.param.apn);
			rsp = "+APN=";
			break;

		case TYPE_APN2:
			string = custermParam.param.apn2;
			length = sizeof(custermParam.param.apn2);
			rsp = "+APN2=";
			break;
			
		case TYPE_PHONE1:
			string = custermParam.param.phone1;
			length = sizeof(custermParam.param.phone1);
			rsp = "+PHONE1=";
			break;

		case TYPE_PHONE2:
			string = custermParam.param.phone2;
			length = sizeof(custermParam.param.phone2);
			rsp = "+PHONE2=";
			break;
			
		case TYPE_IP1:
			string = custermParam.param.server1;
			length = sizeof(custermParam.param.server1);
			rsp = "+IP1=";
			break;
			
		case TYPE_IP2:
			string = custermParam.param.server2;
			length = sizeof(custermParam.param.server2);
			rsp = "+IP2=";
			break;	

		case TYPE_URL:
			string = custermParam.param.gps_url;
			length = sizeof(custermParam.param.gps_url);
			rsp = "+GPSURL=";
			break;	
			
		case TYPE_LOCALPORT:
			string = custermParam.param.local_port;
			length = sizeof(custermParam.param.local_port);
			rsp = "+LOCALPORT=";
			break;

#if 1			
		case TYPE_SIA:
			string = (uint8_t *)gSia;
			length = sizeof(gSia);
			rsp = "+SIA=";
			break;
#endif

		case TYPE_USER_PW:
			string = custermParam.param.user_pw;
			length = sizeof(custermParam.param.user_pw);
			rsp = "+USERPW=";
			break;

		case TYPE_USER_PW2:
			string = custermParam.param.user_pw2;
			length = sizeof(custermParam.param.user_pw2);
			rsp = "+USERPW2=";
			break;	

		case TYPE_SMS_PW:
			string = (uint8_t *)custermParam.param.sms_pw;
			length = sizeof(custermParam.param.sms_pw);
			rsp = "+SMSPW=";
			break;
		
	}
	
	if(param[0] == '?')
	{
		SendDebugString(rsp);
		SendDebugString(string);
		SendDebugString("\r\n");
		if( Flag_SmsConfig )
		{
			SmsRsqAdd((char *)rsp);
			SmsRsqAdd((char *)string);
			SmsRsqAdd(SPLIT_STR);
		}
		return;
	}
	else if(param[0] != '=')
	{
		SendDebugString( "ERROR\r\n" );
		return;
	}
	
	p = strchr((char *)param, '\r');
	if( p )
	{
		if(TYPE_SIA != type)
		{
			*p = 0;
			strncpy((char *)string, (char *)&param[1], length);
			string[length-1] = 0;
			
			WriteToNv( &custermParam );
			SendDebugString( "OK\r\n" );
			if( Flag_SmsConfig )
			{
				SmsRsqAdd((char *)rsp);
				SmsRsqAdd((char *)string);
				SmsRsqAdd(SPLIT_STR);
			}
		}
		else
		{
			SendDebugString( "OK\r\n" );
		}
	}
	else
	{
		SendDebugString( "ERROR\r\n" );
	}	
}


void Custerm_Call(char *param)
{

	if( param[0]=='\r' || param[0]=='?' )
	{
		if(state == STATE_TEST || state == STATE_STANDBY)
		{
			if( Flag_SmsConfig )
			{
				SmsRsqAdd("Initiate Call");
				SmsRsqAdd(SPLIT_STR);
			}

			if( progress == TEST_LOOP )
			{
				SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CLOOPBACK=3,0\r\n");
				delay_50ms(40);
				ModemAudioInit();
			}
			
			progress = TEST_NULL;
			ModemSleep(FALSE);
			TimerStandby = 0;
			callTimes = 0;
			logSet = 0;
			delay_50ms(40);
			udpParamInit();
			EnterCall();
			if(sockState >= SOCKSTATE_CONNECT_OK)
				sockState = SOCKSTATE_CONNECT_OK;
		}
	}
	else
	{
		SendDebugString("ERROR\r\n");
	}

}

void Custerm_End(char *param)
{
	if( param[0]=='\r' || param[0]=='?' )
	{	
		SendDebugString("OK\r\n");
		if( Flag_SmsConfig )
		{
			SmsRsqAdd("Power Down");
			SmsRsqAdd(SPLIT_STR);
		}

		SmsAck( (u8 *)SmsResponse );
		Flag_Power_Down = TRUE;
		Flag_async_Power_Down = TRUE;
		SmsResponse[0] = 0;
	}
}

void Custerm_LogClean(char *param)
{
	if( param[0]=='\r' || param[0]=='?' )
	{
		SendDebugString("OK\r\n");
		
		if( Flag_SmsConfig )
		{
			SmsRsqAdd("LOG CLEAN");
			SmsRsqAdd(SPLIT_STR);
		}

		LogClean();
	}

}

void Custerm_Bat(char *param)
{
	char adcStr[5];
	
	if( param[0]=='\r' || param[0]=='?' )
	{	
		MeasurePower(4);
		BatteryVoltage(adc_result, adcStr);
		SendDebugString("+BAT=");
		SendDebugString((uint8_t *)adcStr);
		SendDebugString("\r\n");
		
		if( Flag_SmsConfig )
		{
			SmsRsqAdd("BAT=");
			SmsRsqAdd(adcStr);
			SmsRsqAdd(SPLIT_STR);
		}
	}
}




extern const Custerm_Item CustermTable[];
uint8_t CustermHandle(char *param)
{
	uint8_t	i, len;

	for(i=0; CustermTable[i].cmdName!=0; i++)
	{
		len = strlen(CustermTable[i].cmdName);
		if(strncmp((char *)param, CustermTable[i].cmdName, len)==0)
		{
			CustermTable[i].func( param+len );
				break;
		}
	}

	if(CustermTable[i].cmdName==0)
	{
		return 0;
	}
	else if( isCheckingBattery && state!=STATE_SETTING )
	{
		state = STATE_SETTING;
		//LcdClear(0, 0, 128, 48);
		//LcdDisplayStr(20, 15, FONT_TYPE_BIG, "Setting");
	}
	
	return 1;
}

