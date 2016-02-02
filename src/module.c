#include "ext_var.h"
#include "lib.h"
#include <string.h>			//字符串函数
#include "misc.h"
#include "module.h"
#include <stdio.h>
#include "udp.h"
#include "custerm.h"
#include "stdarg.h"

static char	atBuff[81];

/*
*********************************************************************************************
功能：
描述：
(1)数据格式：xxxx\r [xxx\r] \0

*********************************************************************************************
*/
#if 0
void Serial1_recevie(void)
{
	uint8_t	 i;

	if( TI )
	{
		TI = 0;
	}
	
	if( RI )
	{
		if(TimerUart == 0)
			Count_SL = 0;
		TimerUart = 3;
		
		RI = 0;
		i = SBUF;
		if(i>=0x20)	//屏掉\r、\n
		{	
			Flag_EndWithCr = 0;
			if(Count_SL < 200)
			{
				tc35data[Count_SL++] = i;
				tc35data[Count_SL] = 0;
			}
			else
			{
//				Count_SL = 0;
			}
		}
		else if(i=='\r')
		{	
			if(Count_SL != 0)
			{
				i = Count_SL - 1;
				if( (tc35data[i]=='3' || tc35data[i]=='2' || tc35data[i]=='7' || tc35data[i]=='8')
					&& (Count_SL==1 || tc35data[Count_SL-2]=='\r') )
				{
					if(tc35data[Count_SL-1]=='2')
						Flag_Incomming = 1;
					else
						Flag_End_call = 1;
				}
				
				tc35data[Count_SL++] = '\r';
				tc35data[Count_SL] = '\0';
				Flag_EndWithCr = 1;
			}	 	
		}			
	}
}

#endif
/*
*********************************************************************************************

*********************************************************************************************
*/
void ResetUartFlag(void)
{
	NVIC_DisableIRQ(UART1_IRQn); 
	Count_SL = 0;
	Flag_EndWithCr=0;
	Flag_FindCr = 0;
	tc35data[0] = 0;
	NVIC_EnableIRQ(UART1_IRQn); 
}

void SendData(uint8_t *cmd, uint8_t length)
{ 
	uint8_t 	i;
	
	if(Flag_Power_Down)
		return;

	if( Flag_MsgDebug == FALSE)
	{
		while(length--)
		{
			while( _UART_IS_TX_FULL(UART1) == 1 );
			UART1->DATA = *cmd++;;
		}
	}
	else
	{
		while(length--)
		{
			i = *cmd++;

			while( _UART_IS_TX_FULL(UART1) == 1 );
			UART1->DATA = i;
			while( _UART_IS_TX_FULL(UART0) == 1 );
			UART0->DATA = i;
		}
	}

#if 1
	g_rsq = Count_SL;
#else
	Count_SL = 0;
#endif
	Flag_EndWithCr=0;
} 

void SendAtCommand2(uint8_t * atcmd, u8 index)
{
	u8	temp[4];

	Dec2Txt(index, temp, 0);
	SendAtCommand(atcmd);
	SendAtCommand(temp);
	SendAtCommand("\r\n");
}

/*
********************************************************************************
功能：发送AT指令到TC35模块
参数：
描述：'\0'字符串的结束标志，ASSII码值为0，
********************************************************************************
*/
void SendAtCommand(uint8_t *atcmd)
{ 
	uint8_t 	i;

	if( Flag_MsgDebug == FALSE)
	{
		while(*atcmd != '\0')
		{
			while( _UART_IS_TX_FULL(UART1) == 1 );
			UART1->DATA = *atcmd++;
		}
	}
	else
	{
		while(*atcmd != '\0')
		{
			i = *atcmd++;

			while( _UART_IS_TX_FULL(UART1) == 1 );
			UART1->DATA = i;
			while( _UART_IS_TX_FULL(UART0) == 1 );
			UART0->DATA = i;
		}
	}
	
#if 1
	g_rsq = Count_SL;
#else
	Count_SL = 0;
	tc35data[0] = 0;
#endif	
	Flag_EndWithCr=0;
	Flag_FindCr = 0;
} 


uint8_t SendAtCmdRsq(char *string, char *rsq)
{
	uint8_t		i = 3;
	uint8_t		result = TRUE;

	while(i-- && !Flag_Power_Down)
	{	
		SendAtCommand((uint8_t *)string);

		sdly = 250;
		while(sdly && !Flag_Power_Down)
		{
			FeedWatchdog();
			switch(tc35data[g_rsq])
			{
			case '0':
			case 'O':
				goto exit;
				
			case '2':
			case '4':
				result = FALSE;
				goto exit;

			default:
				if( strstr((char *)&tc35data[g_rsq], rsq) )
				{
					goto exit;
				}
				else if(CheckTc35Respond("+CME ERROR: ", g_rsq))
				{
					result = FALSE;
					goto exit;
				}
				else if(CheckTc35Respond("+CMS ERROR: ", g_rsq))
				{
					result = FALSE;
					goto exit;
				}
				
				break;
			}

		}

		delay_50ms(60);
	}

exit:
	delay_ms(5);
	return result;
}


u8	WaitRsp(u8 ms, char *rsq)
{
	sdly = ms;
	while(sdly && !Flag_Power_Down)
	{
		FeedWatchdog();
		if( strstr((char *)&tc35data[g_rsq], rsq) )
			return TRUE;
	}

	return FALSE;
}


void SendAtWaitRsq(u8 delay, u8 retry, u8 reset, char *fmt, ...)
{
	uint8_t 	ct=0;
	va_list 	arg;
		
	va_start(arg, fmt);
	vsnprintf(atBuff, 80, fmt, arg);
	
	while( !Flag_Power_Down )
	{
		FeedWatchdog();
		SendAtCommand((u8 *)atBuff);
		module_WaitResponse(delay);

		if(tc35data[g_rsq]=='0' || tc35data[g_rsq]=='4' 
			|| tc35data[g_rsq]=='O' || CheckTc35Respond("+CME", g_rsq)==1
			|| CheckTc35Respond("+CMS", g_rsq)==1 
			|| (ct>=2 && tc35data[g_rsq]!=0) )
			
		{
			break;
		}
		
		ct++;
		if(ct == retry)
		{
			if( reset )
				SoftReset();
			break;
		}
		
		delay_50ms(60);
	}
	
	delay_ms(1);
	va_end(arg);
}

/*
*********************************************************************************************

*********************************************************************************************
*/
void module_WaitResponse(uint8_t time)
{

	dlyct2 = time; 
	while(!Flag_Power_Down)
	{
		if(Flag_EndWithCr==1)
		{
			break;
		}
		else if(dlyct2==0)
		{
//			tc35data[0]=0;
			break;
		}
				
		FeedWatchdog();
	}

	if(!Flag_Power_Down)
		delay_ms(10);
}


/*
*******************************************************************************
功能：检测TC35模块响应的数据
参数：*respond AT指令返回值有二种格式，数字形式与字符串形式(都是ASCII码)
描述：
*******************************************************************************
*/
uint8_t CheckTc35Respond(uint8_t *respond, uint16_t offset)
{ 
  uint16_t i=0, j=offset;
  
  while(*(respond+i)!='\0')
  {
    if(*(respond+i)==tc35data[j++])
      i++;
    else
      return(0);   
  }
  return(1); 
}


void module_PowerOn(void)
{  
	ModulePowerOn(TRUE); 
	delay_50ms(5);
	ModulePowerOn(FALSE); 
}	

void module_Init()
{	
#if 0	
	while(!Flag_Power_Down)
	{
		SendAtCommand("ATE0V0\r\n");
		module_WaitResponse(40);
		if(tc35data[g_rsq]=='0')
		{
			break;
		}
		else
		{
			ct++;
			if(ct==10)SoftReset(); //相当于30秒
		}

		dlyct1 = 20;while(dlyct1)FeedWatchdog();
	}

	SendAtCommand("AT&F1\r");
	module_WaitResponse(20);
#endif

//	SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CFUN=0\r\n");
#if 0
	MoudleWait(100);
#endif

	SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CMEE=1;+CFUN=1;+CGFUNC=18,1\r\n");
	SendAtCmdRsq("AT+CGMR\r\n", "+CGMR");
}

//------------------------------------------------------------------------------------------
//
//------------------------------------------------------------------------------------------
uint8_t Module_CheckRegister(void)
{	
	uint8_t	*p;
	
	FeedWatchdog();
	SendAtCommand("AT+CREG?\r\n");
	module_WaitResponse(20);
	p= &tc35data[g_rsq];
	
	if((CheckTc35Respond("+CREG", g_rsq)==1) && (p[9]=='1'||p[9]=='5') )
		return TRUE; 
	else 
		return FALSE;
}

/*
*********************************************************************************************
AT+ECHO=?
	+ECHO: (0-32767),(0-32767),(0-32767),(0,1)
	OK
AT+CLVL=?
	+CLVL: (0-100)
	OK
AT+CLIP=?
	+CLIP: (0,1)
	OK
AT+COLP=?
	+COLP: (0,1)
	OK
AT+COPS=?
	+COPS: ,,(0-4),(0-2)
	OK
AT+COLP=?
	+COLP: (0,1)	//0立即返回,1接通后返回
	OK
AT+COLP=1
	OK	
*********************************************************************************************
*/
void ModemNetworkInit()
{	
	if( Flag_Power_Down )
		return;
	
	SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CNAOP=2\r\n");
	
	SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CNMP=2\r\n");		//auto
	//SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CNMP=13\r\n");	//gsm
	//SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CNMP=14\r\n");	//wcdma

#if 0
	SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CNBP=0x000000000CA80380\r\n");
#endif

#if 0
	SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CNSDP=2;+CLIP=1;+COPS=0\r");
#else
	SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CNSDP=2\r\n");

	SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CLIP=1\r\n");
	SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+COPS=0\r\n");	
	
	SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CTZU=1\r\n");	//Automatic time and time zone update
#endif
}

void ModemVolumeInit()
{
	if( Flag_Power_Down )
		return;
	
	SwitchVoiceChannel(SPEAKER);	
	SendAtCommand("AT+CVLVL=1,-1200;+CVLVL=2,-600;+CVLVL=3,-200;+CVLVL=4,100;+CVLVL=5,400;+CVLVL=6,800;+CVLVL=7,1000\r\n");
	module_WaitResponse(20);
	AdjustVolume(curVolume);

}

void ModemAudioInit(void)
{
	SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CTXGAIN=13000;+CTXVOL=10000;+CRXGAIN=10000;+CRXVOL=50\r\n");		
  SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+SIDET=0;+CMICAMP1=1;+CECM=0\r\n");
}

/*
*********************************************************************************************
功能：挂断来电
*********************************************************************************************
*/
void HuangupCall(void)
{	
	SendAtCommand("AT+CHUP\r\n");
	module_WaitResponse(50);
	delay_ms(500);
//	debug("HuangupCall");
}

void HuangupAllCall(void)
{	
	SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CHUP\r\n");
	delay_ms(500);
//	debug("HuangupAllCall");
}
/*
*********************************************************************************************
功能：获取SIM卡PIN当前的状态
描述：
AT+CPIN?
	+CME ERROR: 10	//无卡
AT+CPIN?
	+CPIN: READY
	OK	
*********************************************************************************************
*/
#if 1
uint8_t GetSimPinStatus(void)
{
	uint8_t i, *p;	

	i = 8;		
	while(!Flag_Power_Down && i--)
	{		
		delay_50ms(20);
			
		SendAtCommand("AT+CPIN?\r\n");	
		module_WaitResponse(100);
		p = &tc35data[g_rsq];
		
		if(p[0]=='4' && i--)
		{
			return(NO_SIM);
		}
		else if(CheckTc35Respond("+CME ERROR: 1", g_rsq)==1)
		{
			if(p[13]=='4' && (i==0))
			{	// busy
				return(SIM_UNKNOW);
			}
			else if(p[13]=='3')
			{	//sim fail
				return(NO_SIM);
			}
			else if(p[13]=='1')
			{	// pin
				return(SIM_PIN);
			}
			else if(p[13]=='2')
			{	// puk
				return(SIM_PUK);
			}
			else if(i == 0)
			{
				return(SIM_UNKNOW);
			}
			
		}
		else if(CheckTc35Respond("+CPIN: READY", g_rsq)==1)
		{
			return(SIM_READY);
		}
		else if(CheckTc35Respond("+CPIN: SIM PIN", g_rsq)==1)
		{
			return(SIM_PIN);
		}
		else if(CheckTc35Respond("+CPIN: SIM PUK", g_rsq)==1)
		{
			return(SIM_PUK);
		}
		else if(p[0] == '0')
		{
			return(SIM_READY);
		}
	}

	return(SIM_UNKNOW);
}

#endif
/*
*********************************************************************************************
//查字符串*ptr2在*ptr1中的位置
//本函数是用来检查字符串*ptr2是否完全包含在*ptr1中
//返回:  0  没有找到
//       1-255 从第N个字符开始相同
*********************************************************************************************
*/
#if 0
uint8_t strsearch(uint8_t *ptr,uint8_t *ptr2)
{
	uint8_t max_length,flag,i,j,k;
	
	if(ptr2[0]==0) return(0);
	max_length=strlen(ptr)+1;
	flag=0;
	for(i=0,j=0;i<max_length;i++)
	{
        if(ptr[i]==ptr2[j])
        {//第一个字符相同
        	for(k=i;k<max_length;k++,j++)
        	{
        		if(ptr2[j]==0)//比较正确
        			return(i+1);
        		if(ptr[k]!=ptr2[j]) break;
        	}
        	j=0;
        }
	}
	return(0);
}
#endif

/*
*********************************************************************************************
//这AT是查询呼叫等待业务有无激活
AT+CCWA=1,2
+CCWA: 1,1
+CCWA: 0,2
+CCWA: 0,4
OK
*********************************************************************************************
*/
/*
void CHECK_CCWA(void)
{
	debug("CHECK_CCWA()");
	while(1)
	{
		sdly=10;while(sdly)FeedWatchdog();
		SendAtCommand("AT+CCWA=1,2\r\n");
		module_WaitResponse(100);
		if(CheckTc35Respond("+CCWA:")==1)
		{
			if(tc35data[7]=='1')
				Flag_Call_Wait = 1;
			else	
				Flag_Call_Wait = 0;
			break;
		}
		else if(CheckTc35Respond("+CME ERROR: 30")==1)
		{
			Flag_Call_Wait = 0;
		}
	}
}
*/
/*
*********************************************************************************************
信号强度检测
AT+CSQ
+CSQ: 10,0
OK
*********************************************************************************************
*/
uint8_t signal_quality(void)
{	
	uint8_t signal = SIGNAL_STRENGTH_INVAILD;	

	FeedWatchdog();
	SendAtCommand("AT+CSQ\r\n");
	module_WaitResponse(10);
	if(CheckTc35Respond("+CSQ:", g_rsq)==1)
	{
		signal=tc35data[6+g_rsq]-0x30;
		if(tc35data[7+g_rsq]!=',')
			signal=signal*10+(tc35data[7+g_rsq]-0x30);
		ModuleNoAck = 0;
	}
	else
	{
		ModuleNoAck++;
	}
	
	return signal;
}

// 1: handset  3:speaker 4: PCM
void SwitchVoiceChannel(uint8_t ch)
{
	if( ch == SPEAKER)
	{
		if(progress == TEST_LOOP)
			SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CSDVC=3;+CLOOPBACK=3,1\r\n");
		else
			SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CSDVC=3;+CNSM=0\r\n");
	}
	else
	{
		if(progress == TEST_LOOP)
			SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CSDVC=1;+CLOOPBACK=1,1\r\n");
		else
			SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CSDVC=1\r\n");
	}
}

/*
*********************************************************************************************
功能：
描述：用这个指令显示来电时，一定要先显示来电再振铃，不然用户提机会听到号码的音。
   	RING
ATA
	OK
AT+CLDTMF=1,"1,2,3,4,5,6"
	OK
*********************************************************************************************
*/
/*
void DisplayCallId(uint8_t *num)
{
	uint8_t num_buf[32];
	uint8_t i,j; 
	if(num[0]=='\0')return; 	
	j=0;
	for(i=0;num[i]!='\0';i++)
	{
		num_buf[j++]=num[i];
		num_buf[j++]=',';
	}
	num_buf[j-1]='\0';
	sdly=10;while(sdly)FeedWatchdog();
	SendAtCommand("AT+CLDTMF=2,\"");
	SendAtCommand(num_buf);
	SendAtCommand("\"\r\n");	
	module_WaitResponse(100);
	sdly=j*2;while(sdly)FeedWatchdog();		//等待把号码全部送到出去,1个号码100ms	
}
*/

/*
*********************************************************************************************
功能：
描述：
ATI SIMCOM_Ltd
SIMCOM_SIM300
Revision:1604B03SIM300M32_SST34HF3284_(070802TEST)
OK 
*********************************************************************************************
*/ 



#if 0
void GpsStart(void)
{
	if( Flag_Power_Down )
		return;
#if 1
	SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CGPSAUTO=1\r\n");
#else
	if(custermParam.param.agps == 0)
	{
		//SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT+CGPS=0\r\n");
		SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT+CGPSMD=0\r\n");	// CONTROL PLANE
		SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT+CGPS=1,2\r\n");
	}
	else
	{

	}
	
#endif
}
#endif

void GpsStop(void)
{
	if( Flag_Power_Down )
		return;
	
	SendAtWaitRsq(40, MAX_RETRY, FALSE, "AT+CGPS=0\r\n");	// stop gps session
}

void GpsStart_2(void)
{
	if( Flag_Power_Down || Flag_SimExist==FALSE || custermParam.param.agps == '1')
		return;

	if(custermParam.param.agps == '2')
	{
		SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT+CGPSMD=0\r\n");	// CONTROL PLANE
		SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT+CGPS=1,2\r\n");
	}
	else
	{
		SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CGPS=1\r\n"); 
	}
		

	Flag_GpsStart = TRUE;
	if( state != STATE_TEST || progress==TEST_GPS)
		TimerGps = 15;
}

//打开socket，同时激活socket PDP 上下文；
void SockOpen()
{
	if( isCheckingBattery || (state==STATE_TEST && progress==TEST_VERSION) )
		return;
	
	if(sockState == SOCKSTATE_NULL)
	{
#ifdef USER	
		if( witchApn == 1 )
		{
			SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT+CGSOCKCONT=3,\"IP\",%s\r\n",custermParam.param.apn);
			if( custermParam.param.user_pw[0] )
				SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT+CSOCKAUTH=3,1,%s\r\n", custermParam.param.user_pw);
			else
				SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT+CSOCKAUTH=3,0\r\n");
		}
		else
		{
			SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT+CGSOCKCONT=2,\"IP\",%s\r\n",custermParam.param.apn2);
			if( custermParam.param.user_pw2[0] )
				SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT+CSOCKAUTH=2,1,%s\r\n", custermParam.param.user_pw2);
			else
				SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT+CSOCKAUTH=2,0\r\n");
		}
#else		
		SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT+CGSOCKCONT=3,\"IP\",\"3gnet\",\r\n");
		SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT+CSOCKAUTH=3,0\r\n");
#endif

		if( witchApn == 1 )
			SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT+CSOCKSETPN=3\r\n");
		else
			SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT+CSOCKSETPN=2\r\n");
		
//		if((custermParam.param.agps == '1') && (witchApn == 0))
		if(custermParam.param.agps == '1')
		{
		//	SendAtCommand("AT+CPSI?\r\n");
		//	delay_50ms(2);
				
			SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT+CGPSURL=%s\r\n", custermParam.param.gps_url);
			SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT+CGPSSSL=0\r\n");
		//	SendAtWaitRsq("AT+CGPS=0\r", 100);
			SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT+CGPSMD=1\r\n");	// USER PLANE
			SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT+CGPS=1,2\r\n");

			Flag_GpsStart = TRUE;
			if( state != STATE_TEST || progress==TEST_GPS)
				TimerGps = 10;
		}

		sockState = SOCKSTATE_CONFIG;
		TimerSock = 40;	// 2s
	}
	else
	{
		sockState = SOCKSTATE_OPENNING;
#if 1
		if( custermParam.param.agps == '1' || Flag_GpsStart == TRUE )
#endif
		{
			SendAtCommand("AT+NETOPEN=,,1\r\n");
			module_WaitResponse(60);
			TimerSock = 255;
		}
		else
		{
			TimerSock = 20;
		}
		
	}
}

//关闭socket
void SockClose()
{
	sockState = SOCKSTATE_CLOSING;
	SendAtCommand("AT+NETCLOSE\r\n");
	module_WaitResponse(20);
}

//与服务器建立TCP 连接；
void SockConnect()
{
//	SendAtCmdRsq("AT+IPADDR\r\n", "+IPADDR");

	SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CIPHEAD=1\r\n");
	SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CIPSRIP=1\r\n");
	SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CIPCCFG=3,0,0,1,1\r\n");
	SendAtWaitRsq(50, 1, FALSE, "AT+CIPOPEN=0,\"UDP\",,,%s\r\n", custermParam.param.local_port);
	TimerSock = 80;
#if 0
	delay_ms(20);
	sockState = SOCKSTATE_CONNECT_OK;

	if( witchApn == 1)
		ClientInit();
#endif	
}




const uint8_t *VOLUME_VOL[] = 
{
	"1\r\n",
	"2\r\n",
	"3\r\n",
	"4\r\n",
	"5\r\n",
	"6\r\n",
	"7\r\n",
	"8\r\n",
};

void AdjustVolume(uint8_t volume)
{
	SendAtCommand("AT+CLVL=");
	SendAtCommand((uint8_t *)VOLUME_VOL[volume]);
	module_WaitResponse(2);
}

/*
*********************************************************************************************
功能：
描述：
AT+GSN
355689018035684
OK
*********************************************************************************************
*/ 
uint8_t GetModuleIMEI(unsigned char *imei, uint8_t length)
{	
	uint8_t  	i, retry = 3;
	uint16_t	j;
	
	while(retry--)
	{
		SendAtCommand("AT+GSN\r\n");
		module_WaitResponse(100);
		if(Flag_EndWithCr==1)
		{
			length--;
			for(i=0,j=g_rsq; tc35data[j]!='\r' && i<length; i++,j++)
				imei[i]=tc35data[j];		
			imei[i]='\0';
			
			return i;
		}
		
		delay_50ms(40);
	} 

	return 0;
}


/*
AT+CICCID
+ICCID: 898600700907A6019125
OK
*/
uint8_t GetIccid(char *iccid, uint8_t length)
{	
	if( SendAtCmdRsq("AT+CICCID\r\n", "+ICCID:") == TRUE 
		&& GetString((char *)&tc35data[g_rsq], " ", "\r", iccid, length) )
	{
		return TRUE;
	}
	
	return FALSE;
}


uint8_t ChgPinCode(uint8_t *oldPin, uint8_t *newPin)
{	
	SendAtCommand("AT+CPWD=\"SC\",\"");
	SendAtCommand(oldPin);
	SendAtCommand("\",\"");
	SendAtCommand(newPin);
	SendAtCommand("\"\r\n");	
	module_WaitResponse(250);
	
	if(tc35data[g_rsq]=='0' || tc35data[g_rsq]=='O')
		return SIM_READY;
	else if(CheckTc35Respond("+CME ERROR: 1", g_rsq)==1)
	{
#if 0	
		if(tc35data[13]=='8')	// pin
		{
			return SIM_PIN;
		}
		else
#endif			
		if(tc35data[13+g_rsq]=='2')	//puk
		{
			return SIM_PUK;
		}
		else if(tc35data[13+g_rsq]=='6')	// Incorrect password
		{
			return SIM_PIN;
		}
	}
	else if(tc35data[g_rsq]=='4')
	{
		return SIM_PIN;
	}
	
	return SIM_INVALID;
}

uint8_t LockPinCode(uint8_t lock, uint8_t *pin)
{	
	SendAtCommand("AT+CLCK=\"SC\",");
	if( lock )
		SendAtCommand("1,\"");
	else
		SendAtCommand("0,\"");
		
	SendAtCommand(pin);
	SendAtCommand("\"\r\n");	
	module_WaitResponse(250);
	if(tc35data[g_rsq]=='0' || tc35data[g_rsq]=='O')
		return SIM_READY;
	else if(CheckTc35Respond("+CME ERROR: 1", g_rsq)==1)
	{
#if 0	
		if(tc35data[13]=='8')	// pin
		{
			return SIM_PIN;
		}
		else
#endif			
		if(tc35data[13+g_rsq]=='2')	//puk
		{
			return SIM_PUK;
		}
		else if(tc35data[13+g_rsq]=='6')	// Incorrect password
		{
			return SIM_PIN;
		}
	}
	else if(tc35data[g_rsq]=='4')
	{
		return SIM_PIN;
	}
	
	return SIM_INVALID;
}

uint8_t ActiveSimLock(uint8_t *puk, uint8_t *newPin)
{	
	SendAtCommand("AT+CPIN=\"");
	SendAtCommand(puk);
	if( newPin && (newPin[0]!=0) )
	{
		SendAtCommand("\",\"");
		SendAtCommand(newPin);
	}
	SendAtCommand("\"\r\n");	
	module_WaitResponse(250);
	if(tc35data[g_rsq]=='0' || tc35data[g_rsq]=='O')
		return SIM_READY;
	else if(CheckTc35Respond("+CME ERROR: 1", g_rsq)==1)
	{
#if 0	
		if(tc35data[13]=='8')	// pin
		{
			return SIM_PIN;
		}
		else
#endif			
		if(tc35data[13+g_rsq]=='2')	//puk
		{
			return SIM_PUK;
		}
		else if(tc35data[13+g_rsq]=='6')	// Incorrect password
		{
			return SIM_PIN;
		}
	}
	else if(tc35data[g_rsq]=='4')
	{
		return SIM_PIN;
	}
	
	return SIM_INVALID;
}


uint8_t Communication(uint8_t max)
{	
	while(!Flag_Power_Down)
	{
		SendAtCommand("ATE0V0\r\n");
		module_WaitResponse(40);
		if(tc35data[g_rsq]=='0')
		{
			break;
		}
		else
		{
			if( --max == 0) //SoftReset(); //相当于30秒
				return FALSE;
		}

		dlyct1 = 20;
		while(dlyct1)FeedWatchdog();
	}

	return TRUE;
}

#if 0
void MoudleWait(uint8_t ms)
{
	sdly = ms;
	while(sdly && !Flag_Power_Down)
	{
		if( (sdly & 0x7) == 0 )
			BackLightOn(TRUE, 0);
		else if( (sdly & 0x7) == 4 )
			BackLightOn(FALSE, 0);
	}

	BackLightOn(FALSE, 0);
}
#endif

void AccountGet()
{
	static	u8	empty = 0;
	char	*p, *p2;
	u8		j;
	
	if ((gPhoneNumOk != PHONE_NUM_BUSY) || (Flag_SimExist==FALSE))
		return;

	// +CNUM: ,"13697252277",129
	SendAtCommand("AT+CNUM\r\n");
	module_WaitResponse(40);
	p = strstr((char *)&tc35data[g_rsq], "+CNUM");

	if ( p )
	{
		empty = 0;
		p = strstr((char *)&tc35data[g_rsq],",\"");
		if( !p ) return;
		
		p2 = strstr(p+2, "\"");
		if( !p2 ) return;
		
		j = p2 - p - 2;
		if (j > 10)
		{
			p += (j - 10);  // 后 10 位
			j = 10;		
		}
		
		memcpy(&gSia[10-j], p+2, j);
		gPhoneNumOk = PHONE_NUM_READY;
	}
	else if(tc35data[g_rsq]=='0' || tc35data[g_rsq]=='O')
	{
		if( ++empty > 2)
		{
			gPhoneNumOk = PHONE_NUM_EMPTY;
			//debug("No Ph num in sim");
		}
	}
	else
	{
		empty = 0;
	}
}

u8 PhoneNumberSet(char *ph )
{
#if 1
	u8		temp = Flag_MsgDebug;
	Flag_MsgDebug = FALSE;

	SendAtWaitRsq(60, MAX_RETRY, FALSE, "AT+CPBS=\"ON\"\r\n");
	if(tc35data[g_rsq]=='0' || tc35data[g_rsq]=='O')
	{
		delay_ms(10);
		SendAtWaitRsq(150, MAX_RETRY, FALSE, "AT+CPBW=1,\"%s\"\r\n", ph);
		Flag_MsgDebug = temp;
		return (tc35data[g_rsq]=='0' || tc35data[g_rsq]=='O');
	}
#endif
	Flag_MsgDebug = temp;
	return FALSE;
}


