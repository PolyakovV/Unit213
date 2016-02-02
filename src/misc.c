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
#include "udp.h"
#include <time.h>

#define	SMS_HEAD_SET_LENGTH		3
#define	SMS_HEAD_SET			"SET"

#define	SMS_HEAD_GET_LENGTH		3
#define	SMS_HEAD_GET			"GET"

#define	SMS_HEAD_PW_LENGTH		4
#define	SMS_HEAD_PW				"9999"

#define	SMSINDEX_NULL		0xff

#define	MODEM_SLEEP_DELAY	40

enum SmsTypeEnum
{
	SMSTYPE_GET,
	SMSTYPE_SET,
	
	SMSTYPE_NULL
};

u8	ModuleNoAck = 0;

static u8	SmsIndex;
static char	SmsContent[221];
char	SmsResponse[141];
u8	Flag_SmsConfig = FALSE;
u8	Flag_SmsHave = FALSE;
u8	TimerSms = 60;
u8	smsMax = 0;

u8  sms_index[SMS_INDEX_MAX];
u8 smsc[20];

uint8_t Flag_ObtainCpsi = FALSE;
uint8_t SignalIntensity = SIGNAL_STRENGTH_INVAILD;


typedef struct ThresHoldTag
{
	uint16_t		downValue;
	uint16_t		upValue;
} ThresHold;


#define  SIGNAL_STRENGTH_NONE          0
#define  SIGNAL_STRENGTH_LEVEL1        6
#define  SIGNAL_STRENGTH_LEVEL2        9
#define  SIGNAL_STRENGTH_LEVEL3        12
#define  SIGNAL_STRENGTH_LEVEL4        15


uint8_t Flag_Custerm;
uint8_t Custerm_Set[90+1];
uint8_t count_custerm;
uint8_t	Flag_DisabeDoubleButton = FALSE;
uint8_t	Flag_SmsInit = FALSE;

uint8_t	TimerModemSleep = 0;
uint8_t	IsModemSleep;

uint8_t	SecondPoll = 0;
	
void Str2Speech(char *str);
void LogSendBySms(void);


///#if 0
///#define BATTERY_VOTLAGE_LOW  	1614 // 2600*4096/66
///#define BATTERY_VOTLAGE_EMPTY  	1583 // 2550*4096/66
///#else
//#define BATTERY_VOTLAGE_LOW  	3227 // 5200*4096/66
//#define BATTERY_VOTLAGE_EMPTY  	3165 // 5100*4096/66
///#define BATTERY_VOTLAGE_LOW  	2900 // 5100*4096/66
///#define BATTERY_VOTLAGE_EMPTY  	2800 // 5000*4096/66
///#endif


#if 1
const ThresHold  BATTERY_GAUGE[] =
{
	{0,				2410}, // [0.000,		   3.884*4096/66]
	{2404,			2504}, // [3.874*4096/66,   4.034*4096/66]
	{2497,			2559}, // [4.024*4096/66,   4.123*4096/66]
	{2553,			2597}, // [4.113*4096/66,   4.184*4096/66]
	{2590,			2630}, // [4.174*4096/66,   4.237*4096/66]
	{2626,			2855}, // [4.227*4096/66,   4600*4096/66 ]
};

#else
#if 0
const ThresHold  BATTERY_GAUGE[] =
{
	{0,				2497}, // {0,		4024*4096/66},      //  0 
	{2472,			2553}, // {3984*4096/66,	4114*4096/66},      // 20%
	{2535,			2615}, // {4084*4096/66,	4214*4096/66},      // 40%
	{2597,			2677}, // {4184*4096/66, 	4314*4096/66},      // 60% 
	{2659,			2793}, // {4284*4096/66,	4414*4096/66},      // 80%
	{2721,			2855}, // {4384*4096/66,	4600*4096/66}      // 100%
};
#else
const ThresHold  BATTERY_GAUGE[] =
{
	{0,				2194}, // {0,			3536*4096/66},      //  0 
	{2173,			2257}, // {3502*4096/66,	3636*4096/66},      // 20%
	{2225,			2319}, // {3586*4096/66,	3736*4096/66},      // 40%
	{2288,			2350}, // {3686*4096/66, 	3786*4096/66},      // 60% 
	{2335,			2443}, // {3762*4096/66,	3936*4096/66},      // 80%
	{2430,			2855}, // {3916*4096/66,	4600*4096/66}       // 100%
};
#endif

#endif

const Custerm_Item  CustermTable[] =
{
		///--------------------------My added ------------------
	{"BATTLOW",		  Custerm_BattLowLev	      },
	{"BATTEMPTY",		Custerm_BattEmptyLev	 		},
	{"LOWBATREP",		Custerm_BattReplaceLev	  },
	{"LOWBATDISC",	Custerm_BattDischargeLev	},
	///-----------------------------------------------------
	{"APN", 		Custerm_Apn			},
	{"USERPW", 		Custerm_UserPw		},		
	{"IP1", 		Custerm_Ip1			},
	{"IP2", 		Custerm_Ip2			},	
	{"PHONE1", 		Custerm_Phone1 		},
	{"PHONE2", 		Custerm_Phone2 		},
	{"LOCALPORT", 	Custerm_LocalPort	},	
	{"DEFAULT",		Custerm_Default		},
	{"DELAY",		Custerm_Delay		},
	{"SIA",			Custerm_Sia			},
	{"FIBRO", 		Custerm_Fibro  		}, 
	{"CGSN",		Custerm_Imei		},
	{"DEBUG",		Custerm_Debug		},
	{"AGPS",		Custerm_Agps		},	
	{"VERSION",		Custerm_Version		},
	{"GPSURL", 		Custerm_Url			},	
	{"SMSPW", 		Custerm_SmsPw		},
	{"CCSQ", 		Custerm_Csq			},
	{"LOG",			Custerm_Log 		},
	{"GPSINFO",		Custerm_GpsInfo		},
	{"CALL",		Custerm_Call		},
	{"END",			Custerm_End			},
	{"CLEANLOG",	Custerm_LogClean	},
	{"BAT",			Custerm_Bat			},
	{"ICCID",		Cutterm_Iccid		},

	
	{0, 0}
};

static void DelayUntil(uint8_t delay, char * rsq);
static void PhoneInit(void);
void findUdp(void);
double StrToDouble(char* Str, uint8_t Len);
static void saveSmsIndex(u8 * str);
static void BatteryIndicate(uint16_t adc);
static uint8_t StandbyTimerHandle(uint8_t	s);
static void CallActive(void);
static uint8_t EndCall(void);
static u8 GetGsmSigal(void);
static void CsqPlay(u8 level);


void WatchdogInit(void)
{
	WDT->WTCR = WDT_WTCR_INT_RESET_2POW16;
}


void FeedWatchdog(void)
{
	_WDT_RESET();
}

void SoftReset(void)
{
#if 0
	return;
#else	
	debug("SoftReset");

//	LcdDisplayPic(19, 0, PIC_ID_NO_RESPONSE, EXT_FULL_CLEAR);
	//LcdClear(0, 0, X_PIXELS, Y_PIXELS);
//	LcdDisplayStr(19, 0, FONT_TYPE_BIG, "Modem No");
//	LcdDisplayStr(19, 24, FONT_TYPE_BIG, "Response");
	Flag_Power_Down = TRUE;
	TimerPowerDown = 100;
	TimerStandby = 0;
#endif
}

void delay_ms(uint16_t ms)
{
	volatile uint16_t 	i;
	volatile uint16_t	j;
	
	for(i=0; i<ms; i++)
	{
#ifdef CLK_IRC
		for(j=0; j<800; j++)
#else
		for(j=0; j<430; j++)  
#endif			
		{
			__NOP();__NOP();__NOP();__NOP();__NOP();
			__NOP();__NOP();__NOP();__NOP();__NOP();
			__NOP();__NOP();__NOP();__NOP();__NOP();
			__NOP();__NOP();__NOP();
		}
	}
}

#ifdef DELAY_TEST
void DelayTest(void)
{
	u8	i = 0;
	
	//debug("delay_ms() test");
	do
	{
		debug_8("S: ",i, TRUE);
		delay_ms(250);
		delay_ms(250);
		delay_ms(250);
		delay_ms(250);
	}while(++i <= 5);

	//debug("delay_50ms() test");
	i = 0;
	do
	{
		debug_8("S: ",i, TRUE);
		delay_50ms(20);
	} while(++i <= 5);		
}
#endif

void delay_50ms(uint8_t ms)
{
	sdly = ms;
	while(sdly && !Flag_Power_Down)
	{
		FeedWatchdog();
	}
}


#if 1//DEBUG
void SendDebug(uint8_t *atcmd, uint8_t length)
{ 
	while(length--)
	{
	    while( _UART_IS_TX_FULL(UART0) == 1 );
		UART0->DATA = *atcmd++;
	}
} 

void SendDebugString(uint8_t *atcmd)
{ 
	while(*atcmd!='\0')
	{
	    while( _UART_IS_TX_FULL(UART0) == 1 );
		UART0->DATA = *atcmd++;
	}
} 

void debug(unsigned char *string)
{ 	
	SendDebugString(string);
	SendDebugString("\r\n");
}

#if 0
void debug_32(u8 *string, u32 value)
{ 	
	u8	i, i1, i2, i3;
	u8	txt[3]={0};
	
	SendDebugString(string);
	SendDebugString(":");

	i = (u8)(value & 0xff);

	value = value >> 8;
	i1 = (u8)(value & 0xff);

	value = value >> 8;
	i2 = (u8)(value & 0xff);

	value = value >> 8;
	i3 = (u8)(value & 0xff);
		
	Hex2Txt(i3, txt);
	SendDebugString(txt);

	Hex2Txt(i2, txt);
	SendDebugString(txt);

	Hex2Txt(i1, txt);
	SendDebugString(txt);

	Hex2Txt(i, txt);
	SendDebugString(txt);
	
	SendDebugString("\r\n");
}
#endif

void debug_16(u8 *string, u16 value, u8	lf)
{ 	
	u8	i;
	u8	txt[3]={0};
	
	SendDebugString(string);
	SendDebugString(":");
	i = value >> 8;
	Hex2Txt(i, txt);
	SendDebugString(txt);
	i = (u8)(value & 0xff);
	Hex2Txt(i, txt);
	SendDebugString(txt);
	if( lf )
		SendDebugString("\r\n");
}

void debug_8(unsigned char *string, u8 value, u8	lf)
{ 	
	u8	txt[3] = {0,0,0};
	
	SendDebugString(string);
	SendDebugString(":0x");
	Hex2Txt(value, txt);
	SendDebugString(txt);
	if( lf )
		SendDebugString("\r\n");
}

#if 0
void debug_Hex(u8 *string, u8 length)
{ 	
	u8	txt[4], i;
	txt[2] = ' ';
	txt[3] = 0;
	
	for(i=0; i<length; i++)
	{
		Hex2Txt(string[i], txt);
		SendDebugString(txt);
	}
	
	SendDebugString("\r\n");
}
#endif

const u8  table[16]=
{	'0','1','2','3','4','5','6','7',
		'8','9','A','B','C','D','E','F'	
};	

void Hex2Txt(u8 hex, u8 *txt)
{
	txt[0] = table[hex>>4];
	txt[1] = table[hex&0x0f];
}

void Hex2String(u8 *hexStr, u8 hexLen, u8 *str)
{
	u8	hex, j=0;
	u8 	i;
	
	for(i=0; i<hexLen; i++)
	{
		hex = hexStr[i];
		str[j++] = table[hex>>4];
		str[j++] = table[hex&0x0f];
	}
	str[j] = 0;
}
#endif

#if 0 
void Dec2Txt2(u8 dec, u8 *txt)
{	
	txt[0] = table[dec/10];
	txt[1] = table[dec%10];
}
#endif

u8 Str2Hexs(u8 *str, u8 hexMax, u8 *hexs)
{ 	
	u8	i, j, k=0;
	u8 	len = strlen((char *)str);
	
	hexMax <<= 1;
	len = (len > hexMax) ? hexMax : len;
	
	for(i=0; i<len; i++)
	{
		j = str[i];
		if ( j >= '0' && j <= '9' )
			j = j - '0';
		else if( j >= 'A' && j <= 'F' )

			j =  j - 'A' + 10;
		else if( j >= 'a' && j <= 'f' )
			j = j - 'a' + 10;
		else
			return FALSE;
		if( i & 1)
			hexs[k++] += j;
		else
			hexs[k] = j << 4;
	}

	
	return TRUE;
}

void Dec2Txt(u8 dec, u8 *txt, u8 fill)
{	
	u8	i = 0;
	///--------------------------------------My code------------///

	if(dec >= 100)
	{
		txt[0] = table[dec/100];
		dec %= 100;
		txt[1] = table[dec/10];
		txt[2] = table[dec%10];
		txt[3] = 0;
	}
	else if(dec>=10)
	{
		if( fill  >= 3)
			txt[i++]= '0';
		txt[i++] = table[dec/10];
		txt[i++] = table[dec%10];
		txt[i] = 0;
	}
	else
	{
		if( fill >= 2 )
		{
			txt[i++]= '0';
			if( fill >= 3 )
				txt[i++]= '0';
		}
		txt[i++] = table[dec];
		txt[i] = 0;
	}
}

void DEC2Txt(u16 dec, u8 *txt, u8 fill)
{	
	///--------------------------------------My code------------///
	u8	i = 0;
	///--------------------------------------My code------------///
		if(dec >= 1000)
	{
		txt[0] = table[dec/1000];
		dec %= 1000;
		txt[1] = table[dec/100];
		dec %= 100;
		txt[2] = table[dec/10];
		txt[3] =  table[dec%10];
		txt[4] = 0;
	} else
	if(dec >= 100)
	{
		txt[0] = table[dec/100];
		dec %= 100;
		txt[1] = table[dec/10];
		txt[2] = table[dec%10];
		txt[3] = 0;
	}
	else if(dec>=10)
	{
		if( fill  >= 3)
			txt[i++]= '0';
		txt[i++] = table[dec/10];
		txt[i++] = table[dec%10];
		txt[i] = 0;
	}
	else
	{
		if( fill >= 2 )
		{
			txt[i++]= '0';
			if( fill >= 3 )
				txt[i++]= '0';
		}
		txt[i++] = table[dec];
		txt[i] = 0;
	}

}

void ClkInit(void)
{
	 SYS_UnlockReg();
	 
#ifdef CLK_IRC
	/* Enable Internal RC clock */
	SYSCLK->PWRCON |= SYSCLK_PWRCON_IRC22M_EN_Msk;

	/* Waiting for IRC22M clock ready */
	SYS_WaitingForClockReady(SYSCLK_CLKSTATUS_IRC22M_STB_Msk);

	/* Switch HCLK clock source to internal RC */
	SYSCLK->CLKSEL0 = SYSCLK_CLKSEL0_HCLK_IRC22M;

	/* Set PLL to power down mode and PLL_STB bit in CLKSTATUS register will be cleared by hardware.*/
	SYSCLK->PLLCON |= SYSCLK_PLLCON_PD_Msk;

	/* Enable IP clock */		 
	SYSCLK->APBCLK =  SYSCLK_APBCLK_ADC_EN_Msk |  SYSCLK_APBCLK_WDT_EN_Pos |
						SYSCLK_APBCLK_UART1_EN_Msk | SYSCLK_APBCLK_UART0_EN_Msk | 
						SYSCLK_APBCLK_FDIV_EN_Msk |	SYSCLK_APBCLK_WDT_EN_Msk; 

	/* Select IP clock source */
	SYSCLK->CLKSEL1 =  SYSCLK_CLKSEL1_UART_IRC22M |
						 SYSCLK_CLKSEL1_ADC_HCLK | SYSCLK_CLKSEL1_WDT_IRC10K;

	SYSCLK->CLKSEL2 = SYSCLK_CLKSEL2_FRQDIV_HCLK;

		
	/* IP clock divider */
	SYSCLK->CLKDIV = SYSCLK_CLKDIV_ADC(7) |  // ADC clock = ADC clock source / 7
						SYSCLK_CLKDIV_UART(1) | // UART clock = UART clock source / 1
						SYSCLK_CLKDIV_HCLK(1);	// HCLK clock = HCLK clock source / 1


	/* Update System Core Clock */
	/* User can use SystemCoreClockUpdate() to calculate PllClock, SystemCoreClock and CycylesPerUs automatically. */
	SystemCoreClockUpdate(); 
#else

	SYSCLK->PWRCON = SYSCLK_PWRCON_XTL12M_EN_Msk | SYSCLK_PWRCON_IRC10K_EN_Msk;
	SYS_WaitingForClockReady( SYSCLK_CLKSTATUS_XTL12M_STB_Msk | SYSCLK_CLKSTATUS_IRC10K_STB_Msk );

	/* Switch HCLK clock source to XTAL */
	SYSCLK->CLKSEL0 = SYSCLK_CLKSEL0_HCLK_XTAL | SYSCLK_CLKSEL0_STCLK_XTAL;

	/* Set PLL to power down mode and PLL_STB bit in CLKSTATUS register will be cleared by hardware.*/
	SYSCLK->PLLCON |= SYSCLK_PLLCON_PD_Msk;
	SYSCLK->PLLCON |= SYSCLK_PLLCON_OE_Msk;

	/* Enable IP clock */		 
	SYSCLK->APBCLK =  SYSCLK_APBCLK_ADC_EN_Msk | SYSCLK_APBCLK_WDT_EN_Pos |
						SYSCLK_APBCLK_UART1_EN_Msk | SYSCLK_APBCLK_UART0_EN_Msk | 
						SYSCLK_APBCLK_FDIV_EN_Msk |	SYSCLK_APBCLK_WDT_EN_Msk; 

	/* Select IP clock source */
	SYSCLK->CLKSEL1 =  SYSCLK_CLKSEL1_UART_XTAL |
						 SYSCLK_CLKSEL1_ADC_HCLK | SYSCLK_CLKSEL1_WDT_IRC10K;

	SYSCLK->CLKSEL2 = SYSCLK_CLKSEL2_FRQDIV_XTAL;

		
	/* IP clock divider */
	SYSCLK->CLKDIV = SYSCLK_CLKDIV_ADC(7) |  // ADC clock = ADC clock source / 7
						SYSCLK_CLKDIV_UART(1) | // UART clock = UART clock source / 1
						SYSCLK_CLKDIV_HCLK(1);	// HCLK clock = HCLK clock source / 1

	/* Update System Core Clock */
	/* User can use SystemCoreClockUpdate() to calculate PllClock, SystemCoreClock and CycylesPerUs automatically. */
	SystemCoreClockUpdate(); 
	
#endif
}

void UartInit(void)
{
	/* Set P3 multi-function pins for UART0 RXD and TXD  */
	_SYS_P30_MFP(SYS_MFP_P30_RXD0);
	_SYS_P31_MFP(SYS_MFP_P31_TXD0);

//    SYS->P3_MFP = SYS_MFP_P30_RXD0 | SYS_MFP_P31_TXD0;

	_UART_SEL_FUNC(UART0,UART_FUNC_SEL_UART);
    /* Set 115200 baudrate according to 50MHz system clock */
#ifdef CLK_IRC	
    UART0->BAUD = UART_BAUD_MODE2 | UART_BAUD_DIV_MODE2(__IRC22M/*__XTAL*/, 115200);
#else
 	UART0->BAUD = UART_BAUD_MODE2 | UART_BAUD_DIV_MODE2(__XTAL, 115200);
#endif
    _UART_SET_DATA_FORMAT(UART0, UART_WORD_LEN_8 | UART_PARITY_NONE | UART_STOP_BIT_1);

	_UART_ENABLE_INT(UART0, (UART_IER_RDA_IEN_Msk | UART_IER_RTO_IEN_Msk));
	NVIC_EnableIRQ(UART0_IRQn);



    /* Set P1 multi-function pins for UART1 RXD and TXD  */
	_SYS_P12_MFP(SYS_MFP_P12_RXD1);
	_SYS_P13_MFP(SYS_MFP_P13_TXD1);
	
	_UART_SEL_FUNC(UART1,UART_FUNC_SEL_UART);
#ifdef CLK_IRC		
	UART1->BAUD = UART_BAUD_MODE2 | UART_BAUD_DIV_MODE2(__IRC22M/*__XTAL*/, 115200);
#else
	UART1->BAUD = UART_BAUD_MODE2 | UART_BAUD_DIV_MODE2(__XTAL, 115200);
#endif
	_UART_SET_DATA_FORMAT(UART1, UART_WORD_LEN_8 | UART_PARITY_NONE | UART_STOP_BIT_1);

	_UART_ENABLE_INT(UART1, (UART_IER_RDA_IEN_Msk | UART_IER_RTO_IEN_Msk));
	NVIC_EnableIRQ(UART1_IRQn);

	_FMC_ENABLE_ISP();
}

void AdcInit(void)
{
    ADC_ResetIP();
//    _ADC_DISABLE_CLOCK();
    NVIC_DisableIRQ(ADC_IRQn);

	/* Disable the P1.0 digital input path to avoid the leakage current. */
	P1->OFFD = GPIO_OFFD_ENABLE(0);
	/* Configure the P1.0 ADC analog input pins */
	_SYS_P10_MFP(SYS_MFP_P10_AIN0);

	/* Set the ADC operation mode as single, input mode as single-end and enable the ADC converter */
	ADC->ADCR = (ADC_ADCR_ADMD_SINGLE | ADC_ADCR_DIFFEN_SINGLE_END | ADC_ADCR_ADEN_CONVERTER_ENABLE);
	/* Enable analog input channel 0 */
	_ADC_SET_CHANNEL(0);           
}

void ModulePowerOn(uint8_t on)
{
	if( on )
	{
//		DrvGPIO_SetBit(MODEM_POWER_PORT, MODEM_POWER_PIN);
		MODEM_POWER_PORT_PIN = 1;
	}
	else
	{
//		DrvGPIO_ClrBit(MODEM_POWER_PORT, MODEM_POWER_PIN);
		MODEM_POWER_PORT_PIN = 0;
	}
}


void LedTigger(void)
{
	LED_PORT_PIN = !LED_PORT_PIN;
}


void ModuleOn(uint8_t on)
{
	if( on )
	{
		MODEM_ON_PORT_PIN = 1;
//		DrvGPIO_SetBit(MODEM_ON_PORT, MODEM_ON_PIN);
	}
	else
	{
		MODEM_ON_PORT_PIN = 0;
//		DrvGPIO_ClrBit(MODEM_ON_PORT, MODEM_ON_PIN);
	}
}


void LockPower(uint8_t enable)
{
//	if( enable)
//	{
//		DrvGPIO_SetBit(LOCK_POWER_PORT, LOCK_POWER_PIN);
		LOCK_POWER_PORT_PIN = enable;
//	}
//	else
//	{
//		DrvGPIO_ClrBit(LOCK_POWER_PORT, LOCK_POWER_PIN);
//		LOCK_POWER_PORT_PIN = 0;
//	}
}

uint8_t PressBatter(void)
{
	if ( !KEY_BAT_PORT_PIN )
	{
		delay_ms(3);
		return( !KEY_BAT_PORT_PIN );
	}

	return 0;
}

uint8_t PressHelp(void)
{
	if ( !KEY_HELP_PORT_PIN )
	{
		delay_ms(3);
		return( !KEY_HELP_PORT_PIN );
	}

	return 0;
}



void ModemSleep(uint8_t on)
{
#if 1
	debug_8("sleep", on, TRUE);

	IsModemSleep = on;
 	if( on )
	{
		SLEEP_PORT_PIN = 0;
	}
	else
	{
		SLEEP_PORT_PIN = 1;
	}
#endif	
}	
	
void AdcStart(void)
{	
	/* Enable the ADC interrupt */
	_ADC_CLEAR_ADC_INT_FLAG();
	_ADC_ENABLE_ADC_INT();
	NVIC_EnableIRQ(ADC_IRQn);
	_ADC_START_CONVERT();
}

void WhatToDo(void)
{
	while( !PressHelp() && !PressBatter() ){
	}

	
	
//	debug_8("help:", PressHelp());
//	debug_8("Batter:", PressBatter());
#if 0	
	if( PressBatter() )
	{
		isCheckingBattery = TRUE;
	}
	else
	{
		isCheckingBattery = FALSE;
	}
#endif
}

void WaitLockPower(void)
{
	module_PowerOn();

#if 1	
	if( PressHelp() )
	{
		isCheckingBattery = FALSE;
	}
	else
	{
		isCheckingBattery = TRUE;
	}
#endif

	if( isCheckingBattery )
	{
		dlyct1 = 52;
	}
	else 
	{
		dlyct1 = 35;
	}
	
	while(dlyct1)
	{
		if( PressHelp() && PressBatter() )
		{
			isCheckingBattery = FALSE;
			state = STATE_TEST;
			
		}
	}	
	
	
LockPower(TRUE);
	
	debug(VERSION);
	////////////////////// stop blinking if lock//24.11.2015////////////////////
	////////////////////// continiue blink if press both buttons or unlock//////
	
			if (custermParam.param.lockState && !PressBatter()) {
																						LedDark();////
																					}
  
																					else {LedBlink();}
	////////////////////////////////////////////////////////////////////////////
	
  //LedBlink();  24.11.2015 
	
	if(state == STATE_TEST)
	{
		Flag_DisabeDoubleButton = TRUE;
		debug("test mode");
	}
}

void MeasurePower(uint8_t cnt)
{
	uint8_t		i = 0, Interval = 15;
	uint16_t	ad = 0;


	AdcStart();
	dlyct1 = Interval;
	do
	{
		if( dlyct1 == 0 )
		{
			//debug_16("adc:", adc_result, TRUE);	
			ad += adc_result;
			i++;
			if( i < cnt )
			{
				AdcStart();
				dlyct1 = Interval;
			}
		}
		
	} while( i < cnt );

	adc_result = ad / cnt;
	//debug_16("adc_result:", adc_result, TRUE);	

}

void PowerOn(void)
{
	uint16_t temp = adc_result;

	adc_result = 0;
	
	if(state == STATE_TEST)
	{ ///----------------
		//PlayVoice("\"unitUnlock.wav\",2\r");
		///----------------
		
		progress = TEST_VERSION;
		TimerGps = 0;
		enter_test_mode(progress);
	}
	else if( isCheckingBattery )
	{
		delay_50ms(40);
		// œ‘ æµÁ≥ÿµÁ¡ø
		BatteryIndicate(temp);
		
		TimerWait = 200;	// 10s
		state = STATE_BATT_DISPLAY;
	}
	else
	{
//#if 0	
		if(temp < custermParam.param.battDischargeLev)
		{ PlayVoice("\"batteryLow.wav\",2\r");
			delay_50ms(40);
			PlayVoice("\"replaceBattery.wav\",2\r");
			Flag_Power_Down = TRUE;
			TimerWait = 100;
		}
		else
		if(temp < custermParam.param.battEmptyLev)
		{ 
			PlayVoice("\"replaceBattery.wav\",2\r");
			delay_50ms(40);
			Flag_LowBat = TRUE;
			//Flag_Power_Down = TRUE;
			//TimerWait = 100;
		}
		else
//#endif			
		{	
			if(temp < custermParam.param.battLowLev)
			{
				PlayVoice("\"batteryLow.wav\",2\r");
				delay_50ms(40);
			}
			
			PlayVoice("\"h.wav\",2\r");			
			HelpKey = TRUE;
			PhoneInit();
			
			if( Flag_SimExist )
				UdpPacketInit();

			SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT&W\r\n");
		}		
	}

}

#if 0
void SignalCheck(void)
{	
	if(TimerSignal == 0)
	{
		if( (state < STATE_GSM_STEADY && !(state==STATE_TEST && progress>TEST_VERSION))
			|| state == STATE_POWERING_DOWN 
			|| state == STATE_STANDBY )
			return;
		
		MsgHandle();
		
		SignalIntensity = signal_quality();
		DisplaySignalLevel(SignalIntensity);

		if(ModuleNoAck >= MAX_MODULE_NO_ACK)
			Flag_Power_Down = TRUE;
		
		TimerSignal = 250;
	}
}
#endif

void BatterCheck(void)
{
	static uint16_t adc_bak = 0;
	
	if( adc_result )
	{
		if( adc_bak )
			adc_bak = (adc_result + adc_bak) >> 1;
		else
			adc_bak = adc_result;

		LowValtageWarnning(adc_bak);
//		DisplayBatteryVol(adc_bak);
		adc_bak = adc_result;
		adc_result = 0;
	}
	
	if(TimerBattery == 0)
	{
		if( state==STATE_1ST_CALL
			|| state == STATE_REGISTER_OK
			|| state == STATE_POWERING_DOWN
			|| isCheckingBattery == TRUE
			|| state == STATE_TEST )
			return;
		
		TimerBattery = 180;
		AdcStart();
	}
}

void SecondHandle(void)
{	
	char 	*p;
	u8		i = 0, j=0;
	u8		st = FALSE;

	while(TimerSecond >= CNT_PER_SEC)
	{
		TimerSecond -= CNT_PER_SEC;
		i++;
	}
	
	if( i == 0 )
		return;

/******************************************************************************/
	if( StandbyTimerHandle(i) )
		return;
	
/******************************************************************************/
#ifdef GPS_AUTO
	if((GetGpsSig()==1) && TimerGpsPeriod)
	{
		TimerGpsPeriod = (TimerGpsPeriod>i) ? (TimerGpsPeriod-i) : 0;
		if( TimerGpsPeriod == 0 )
			ResendGpsSig();
	}
#endif
	

/******************************************************************************/
	if( TimerGps /*&& (Flag_ObtainGps==FALSE)*/ && Flag_GpsStart )
	{
		TimerGps = (TimerGps>i) ? (TimerGps-i) : 0;
		if( TimerGps==0 && Flag_SimExist  )
		{
			if( (state == STATE_TEST) || (state >= STATE_GSM_STEADY && state != STATE_STANDBY))
			{
				SendAtCommand("AT+CGPSINFO\r\n");
				module_WaitResponse(100);

				p = strstr((char *)(&tc35data[g_rsq]), "+CGPSINFO:");
				if( p )
				{
			#ifndef GPS_TEST			
					if(p[10] != ',')
			#endif				
						GpsDataHandle();
				}
			}
				
			TimerGps = 20;
		}
	}

/******************************************************************************/
	TimerSms = (TimerSms>i) ? (TimerSms-i) : 0;

/******************************************************************************/
	j = i;

	while( i-- )
	{
		if(SystemTime == 0xff)
			break;
		
		SystemTime++;
		switch(SystemTime)
		{
#if 0		
		case 2:
			if( state == STATE_1ST_CALL )
				PlayVoice("\"Pleasewait.wav\",2\r");
			break;
#endif

		case 14:
			GpsStart_2();
			break;

		case 12:
			SmsInit();
			break;

		default:
			break;
		}
#if 0
		if( state == STATE_1ST_CALL )
		{	
			uint8_t	signal;
			
			if( (SystemTime & 0x01) == 0 ) // √ø2s≤È“ª¥Œ
			{
				if( Flag_SimExist == FALSE )	
					signal = signal_quality();
				else
					signal = Module_CheckRegister();
			
				if( signal > 0 && signal != SIGNAL_STRENGTH_INVAILD )
				{
					state = STATE_REGISTER_OK;
					TimerWait = 80;
			#if 0
					TimerWait += 50;	// —” ± 2.5 s ≤¶∫≈
					//TimerWait += 100;	// —” ± 5 s ≤¶∫≈
					//TimerWait += 200;	// —” ± 10 s ≤¶∫≈
					//TimerWait += 300;	// —” ± 15 s ≤¶∫≈
				#ifdef VOICE_PREFER	
					TimerSock = 0xffff;				
				#endif					
			#endif
				}
			}
		}
#endif
	}

	while( j-- )
	{
		SecondPoll++;
		if((progress==TEST_GPS) && (Flag_ObtainGps==FALSE) && ((SecondPoll&0x1f)==0x1f))
		{
			PlayVoice("\"waitGPS.wav\",2\r");
		}

		if((state<STATE_CALL_PROMPT) && (state >=STATE_1ST_CALL) && ((SecondPoll&0x0f)==0x0f)) // √ø16s≤È“ª¥Œ
			PlayVoice("\"Pleasewait.wav\",2\r");

		if( IsInCall() && (SecondPoll % 6)==5 && st== FALSE )	// √ø6s≤È“ª¥Œ
		{
			QueryModuleSate();
			st = TRUE;
		}

		if( (gPhoneNumOk == PHONE_NUM_BUSY) && (SecondPoll & 0x0f)==0x0e  && (state < STATE_STANDBY) && (Flag_SimExist==TRUE) )
			AccountGet();

		if( (progress>=TEST_GPS) 
			&& (Flag_ObtainCpsi==FALSE) && (Flag_ObtainGps==FALSE)
			&& (SystemTime & 3)==3 ) // √ø4s≤È“ª¥Œ
		{
//			UpdateDateTime();
			GetCpsiInfo();
			
		}
	}
	
}

void KeyHandle(void)
{ 


	if( LongHelpKey )
	{  
		LongHelpKey = FALSE;
		if((state==STATE_STANDBY) && (BattKey==FALSE) && !PressBatter() )
		{  
			
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

#if 1
	if( LongBattKey )
	{
		LongBattKey = FALSE;
		if((state==STATE_STANDBY) && (HelpKey==FALSE) && !PressHelp() )
		{
			//LedBlink();
			ModemSleep(FALSE);
			delay_50ms(40);
			MeasurePower(4);
			BatteryIndicate(adc_result);
			adc_result = 0;
			delay_50ms(40);
			ModemSleep(TRUE);
			//LedDark();
		}
	}
#endif

	if( GetKeyBatt() )
	{							
		if(state == STATE_ACTIVE || state == STATE_ALERT)
		{
			curVolume = (curVolume + 1 ) % VOLUME_LEVEL_NUM;
			AdjustVolume(curVolume);
			//DispalyVolumeLevel(curVolume);
		}
		else if( state==STATE_TEST )
		{
			enter_test_mode(++progress);
		}
	}

	if(GetKeyHelp() && isCheckingBattery==FALSE)
	{
		switch( state )		
		{
		case STATE_ACTIVE:
		case STATE_ALERT:
			if( Flag_SimExist==FALSE || callTimes >= MAX_CALL_TIMES)
			{
				SendAtCommand("AT+VTS=1,0\r\n");
				module_WaitResponse(20);
			}
			else
			{
				ResendGpsSig();
			}
			break;
			
		case STATE_INCOMMING:
			callTimes = 0;
			logSet = 0;
			EnterAnswer();
			break;
			
		default:
			break;
		}		
		
	}
	
}

void enter_test_mode(uint8_t progress)
{
	u8	level;
//	debug_8("test", progress, TRUE);

			
	switch(progress)
	{ 
		
	case TEST_VERSION:
	  Flag_Power_Down = FALSE;
		Flag_async_Power_Down = FALSE;
		sockState = SOCKSTATE_NULL;
		state = STATE_TEST;
		delay_50ms(40);
		PlayVoice("\"unitInTest.wav\",2\r");	
		PhoneInit();
		
		
		Str2Speech(VERSION);
//		SmsInit();
		GetKeyBatt();
		GetKeyHelp();
		break;

	case TEST_GPS:
    
		TimerGps = 2;
		PlayVoice("\"waitGPS.wav\",2\r");
		SockOpen();
		break;

	case TEST_BATT:

	{ 
		char adcStr[5];
		MeasurePower(4);
		BatteryVoltage(adc_result, adcStr);
		Str2Speech(adcStr);
		break;
	}
	
	case TEST_CSQ:
		
		level = GetGsmSigal();
		CsqPlay(level);
		break;
		
	case TEST_LOOP:
		PlayVoice("\"loopTest.wav\",2\r\n");
		delay_50ms(40);	
		//SendAtWaitRsq(80, MAX_RETRY, FALSE, "AT+CTXGAIN=60000;+CTXVOL=60000;+CRXGAIN=50000;+CRXVOL=90\r\n");
		SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CTXGAIN=65000;+CTXVOL=65000;+CRXGAIN=65000;+CRXVOL=100\r\n");
	  delay_50ms(40);
	  SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CMICAMP1=1;+CLVL=7;+CECM=0\r\n");
		delay_50ms(40);
	  SendAtWaitRsq(80, MAX_RETRY, FALSE, "AT+CLOOPBACK=3,1\r\n");
		break;

	default:
		SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CLOOPBACK=3,0\r\n");
		delay_50ms(40);
		ModemAudioInit();
		EnterPowerDown();
		break;

	}
}

void LowValtageWarnning(uint16_t batteryvoltage)
{
#if 1
	static uint8_t lowValtageCnt = 0;
	static uint8_t cutoffCnt = 0;

	//batteryvoltage <<= 1;

	if(batteryvoltage < custermParam.param.battEmptyLev)
	{
		++lowValtageCnt;
		++cutoffCnt;
		
		if( (state != STATE_TEST) 
			&& (cutoffCnt > 3)
			&& (state < STATE_BYE) )
		{
			PlayVoice("\"replaceBattery.wav\",2\r");
			TimerStandby = 0;
			Flag_Power_Down = TRUE;
			TimerPowerDown = 80;
		}

	}
	else if(batteryvoltage<custermParam.param.battLowLev && Flag_LowBat==FALSE)
	{
		++lowValtageCnt;
		cutoffCnt = 0;
		Flag_LowBat = TRUE;
		if( (state != STATE_TEST) 
			&& (lowValtageCnt > 2)
			&& (state < STATE_BYE) )
		{
			lowValtageCnt = 0;
			PlayVoice("\"batteryLow.wav\",2\r");
		}
	}
	else
	{
		cutoffCnt = 0;
		lowValtageCnt = 0;
	}
#endif	
}

#if 0
static uint8_t currentIndex = 0;
uint8_t getBatteryDispalyLevel(uint16_t batteryvoltage)
{
  uint8_t		movingUp = FALSE;
  uint8_t		movingDown = FALSE;
	uint8_t		thresholdFound = FALSE;
	uint16_t	gaugeValue;
	uint8_t		numberOfElements = sizeof(BATTERY_GAUGE)/sizeof(BATTERY_GAUGE[0]);
	
	gaugeValue = batteryvoltage;

	while(thresholdFound == FALSE)
  	{
		if(gaugeValue > BATTERY_GAUGE[currentIndex].upValue)
	    {
	    	movingUp = TRUE;
			if(movingDown == TRUE)
			{
	        	//DevFail("Gauge threshold incorrect - gauges oscillating");
	        	thresholdFound = TRUE;
	      	}
	      	else
	      	{
	        	if(currentIndex < (numberOfElements - 1) )
	        	{
	          		currentIndex++;
	        	}
	        	else
	        	{ /*currentIndex = gaugeElement_p->numberOfElements - 1*/
	        		currentIndex = numberOfElements - 1;/*sanity - make sure it is not out of range*/
	         	 	thresholdFound = TRUE;/*gauge value of the top of the gauge so set it to the max*/
	        	}
	      	}
		}
    	else if(gaugeValue < BATTERY_GAUGE[currentIndex].downValue)
    	{
      		movingDown = TRUE;
      		if(movingUp == TRUE)
      		{
       			//DevFail("Gauge threshold incorrect - gauges oscillating");
        		thresholdFound = TRUE;
      		}
      		else
	      	{
	        	if(currentIndex > 0 )
	        	{
	         		currentIndex--;
	        	}
	        	else
	        	{ /*currentIndex = 0*/
	         		currentIndex = 0; /*sanity - make sure it is not out of range*/
	          		thresholdFound = TRUE;/*gauge value of the bottom of the gauge so set it to the min*/
	       		}
	      	}
    	}
    	else
    	{/*value not greater than up value and not less than down value so we must have found the element*/
      		thresholdFound = TRUE;
    	}
  	}

	return currentIndex;
	
}
#endif

#if 0
void DisplayBatteryVol(uint16_t batteryvoltage)
{
	uint8_t pic_id = 255;

//	debug_16("batt vol:", batteryvoltage, TRUE);
	
	//batteryvoltage <<= 1;
	pic_id = getBatteryDispalyLevel(batteryvoltage);
	if(pic_id < 2)
		Flag_LowBat = TRUE;
	else
		Flag_LowBat = FALSE;
	if(isCheckingBattery == TRUE)
	{
		StrongPlay(pic_id);
		pic_id += PIC_ID_BATT_0; 
		//LcdDisplayPic(35, 8, pic_id, EXT_FULL_CLEAR);		
	}
	else //if(pic_id != BatteryVol)
	{
		BatteryVol = pic_id;
		//LcdDisplayPic(3,16,pic_id+PIC_ID_MODEM_BATT0,0);	
	}

}
#endif

#if 0
void DispalyVolumeLevel(uint8_t volume)
{
	uint8_t i, picId, x, height=0;

	volume %= (VOLUME_LEVEL_NUM+1);
	LcdClear(0, 0, X_PIXELS, Y_PIXELS);
	//LcdDisplayPic(30,16,pic_id,EXT_FULL_CLEAR);
	LcdDisplayPic(30, 32, PIC_ID_VOL0, 0);
	x = 39; //30 + 5 + 4
	for(i=0; i<7; i++)
	{
		if(volume > i)
			picId = PIC_ID_VOL1 + i;
		else
			picId = PIC_ID_VOL1_0 + i;
		PicHeight((PicId_Enum)picId, &height);
		LcdDisplayPic( x, 40-height, picId, 0);

		x += 10;
	}
}
#endif

void DisplaySignalLevel(uint8_t signallevel)
{
	static uint8_t	SignalLowCnt = 0;
	
	if(signallevel<SIGNAL_STRENGTH_LEVEL1 || signallevel==SIGNAL_STRENGTH_INVAILD)
	{
		SignalLowCnt++;
#if 0
		if( SignalLowCnt > 1 )
			LedDark();
#endif		
	}	
	else
	{
		SignalLowCnt = 0;
		//LedBlink();
	}
}

#if 0
void DisplayCallTimes(u16 secondnum)
{
	static u16	second_bak = 0xffff;	
	uint8_t hours,mimutes,seconds;
	uint8_t time_str[10];

	if(secondnum == second_bak)
		return;
	
	second_bak = secondnum;
	
	seconds = secondnum%60;
	mimutes = secondnum/60;
	hours = mimutes/60;
	
	Dec2Txt2(hours, time_str);
	time_str[2] = ':';
	Dec2Txt2(mimutes, time_str+3);
	time_str[5] = ':';	
	Dec2Txt2(seconds, time_str+6);
	time_str[8] = 0;	
		
	//LcdDisplayPic(33, 0, PIC_ID_ACTIVE, EXT_H_CLEAR|EXT_V_CLEAR);
	//LcdClear(10, 0, 118, 48);
	//LcdClear(10, 0, 33, 24);
	//LcdClear(88, 0, 118, 24);
	//LcdClear(10, 24, 25, 48);
	//LcdClear(99, 24, 118, 48);
	
	//LcdDisplayStr(33, 0, FONT_TYPE_BIG, "Active");
	//LcdDisplayStr(25, 24, FONT_TYPE_BIG, time_str);				 
}
#endif

const static uint8_t *MUSIC_FILE[] = 
{
	"\"h.wav\",2\r\n",	// Calling Life Alert.wav
	"\"e.wav\",2\r\n",	// Ending Call.wav
	"\"a.wav\",2\r\n",	// 911 Call failed, please try again.wav
	"\"f.wav\",2\r\n",	// Help call failed.wav
	"\"h2.wav\",2\r\n",	// Calling 911.wav
//	"\"f2.wav\",2\r",	// Call Failed.wav
	"\"poweredOff.wav\",2\r\n",	// powering down.wav
};

void PlayMusic(uint8_t index)
{
	if(index >= MUSIC_NUM)
		return;
	
	SendAtCommand("AT+CCMXPLAYWAV=");
	SendAtCommand((uint8_t *)(MUSIC_FILE[index]));
	module_WaitResponse(50);	
}


void EnterCall(void)
{
#if 1
	callTimes++;
	debug_8("EntCall callTms: ", callTimes, TRUE);

	if(state >= STATE_CALL_PROMPT)
	{
		if(Flag_SimExist && (callTimes<=MAX_CALL_STEP3))
			PlayMusic(MUSIC_HELP_CALL);
		else
			PlayMusic(MUSIC_911_CALL);
		
		TimerWait = 60;	// 3s
	}
	else
	{
		TimerWait = 1;
	}
#endif	

	if(callTimes == 1)
		LogOnOff(FALSE);
	
	state= STATE_CALL_PROMPT;
}

void EnterAnswer( void )
{
	u8	result = 0;
	u8	cnt = 2;
		
	while(result==0 && cnt-- )
	{
		SendAtCommand("ATA\r\n");

		sdly = 200;
		while(sdly && !Flag_Power_Down)
		{
			if( strstr((char *)&tc35data[g_rsq], "VOICE CALL: BEGIN") )
			{
				result = 1;
				break;
			}
			else if( strstr((char *)&tc35data[g_rsq], "MISSED_CALL") )
			{
				result = 2;
				break;
			}
			
			FeedWatchdog();
		}
	}

	switch( result )
	{
	case 1:
		CallActive();
		break;
		
	case 2:
		TimerStandby = custermParam.param.delay;
		EnterStandby();
		break;
		
	default:
		TimerStandby = custermParam.param.delay;
		HuangupCall();
		//state = STATE_CALL_PROMPT;
#if 1	
		PlayMusic(MUSIC_FAIL);
		Flag_Power_Down = TRUE;
		TimerPowerDown = 60;
#endif	
		break;
	}
		
}

void Redial(void)
{
	EnterCall();
}

void EnterStandby(void)
{
	//debug("EnterStandby()");

	if(state == STATE_STANDBY)
		return;

	state = STATE_STANDBY;
#if 1	
	//LedDark();
#endif
	GpsStop();
	if( TimerStandby )
	{
	#if 0	
		if(sockState==SOCKSTATE_OPENNING && Flag_SimExist)
			SockOpen();
	#endif
		if( sms_index[0] != SMSINDEX_NULL )
			TimerModemSleep = MODEM_SLEEP_DELAY;
		
//		ModemSleep(TRUE);
	}
	
//	TimerStandby = custermParam.param.delay;
}


void EnterPowerDown(void)
{
	if(state == STATE_POWERING_DOWN)
		return;
	
	ModemSleep(FALSE);
	delay_50ms(20);
	PlayMusic(MUSIC_PD);
	TimerWait = 60; // 3s
	state = STATE_POWERING_DOWN;

	if( gLogPowerDownExpect )
		LogOnOff(TRUE);
}

void Call(void)
{
#if 1
	uint8_t	i = 20;

	debug_8("Call callTms: ", callTimes, TRUE);
#if 1
	SendAtCommand("ATD");
	if(Flag_SimExist==FALSE || (callTimes > MAX_CALL_STEP3))
		SendAtCommand("911");
	else if(callTimes <= MAX_CALL_STEP1)
		SendAtCommand((uint8_t *)custermParam.param.phone1);
	else if(callTimes <= MAX_CALL_STEP2)
		SendAtCommand((uint8_t *)custermParam.param.phone2);
	else if(callTimes <= MAX_CALL_STEP3)
		SendAtCommand((uint8_t *)custermParam.param.phone1);

	SendAtCommand(";\r\n");
		
	TimerSecond = 0;
	while(!Flag_Power_Down)
	{
		if(TimerSecond >= CNT_PER_SEC)
		{
			TimerSecond -= CNT_PER_SEC;
			if(--i == 0)
				break;
		}
		
		if(Flag_EndWithCr==1)
		{
			if( strchr((char *)&tc35data[g_rsq], '0') || strchr((char *)&tc35data[g_rsq], '3') )
				break;	
			else
				Flag_EndWithCr = 0;
		}
		FeedWatchdog();
	}
#else
	//debug("**do not call***");
	tc35data[g_rsq]='0';
	i = 1;
#endif	

	if( i && strstr((char *)&tc35data[g_rsq], "0\r") )
	{
		state = STATE_ALERT;
		TimerWait = 1800;	// 90 sƒ⁄√ª”–Ω”Õ®£¨‘Ú»œŒ™∫ÙΩ– ß∞‹
	}
	else if(Flag_Power_Down==FALSE)
	{
		EnterCallFail();
	}
#endif	
}

void PowerDown()
{
	if( isCheckingBattery == FALSE )
	{
		SendAtWaitRsq(50, 3, FALSE, "AT+CPOF\r\n");
		delay_50ms(65);
	}

	LedDark();
	LockPower(FALSE);
	//debug("shut down");

	ModulePowerOn(TRUE); 
	delay_50ms(16);
	ModulePowerOn(FALSE);
	
	while(1)
	{
		//FeedWatchdog();
	}
}

void EnterEndCall(void)
{
	while( TimerPowerDown )
		FeedWatchdog();;
	
#if 1
	if( Flag_TxInitOk )
	{
		state = STATE_BYE;
		SIAEventPacketCreate(Flag_ObtainGps, Flag_LowBat, TRUE);
		UdpSend();
	}
	else
#endif		
	{
		EnterStandby();
	}
}

void EnterCallFail()
{
	state = STATE_NEXT_CALL;
	HuangupCall();		
#if 1		
	if(callTimes < MAX_CALL_TIMES)
	{
		TimerWait = 200; // 10s
		PlayMusic(MUSIC_FAIL);
		if(sockState==SOCKSTATE_OPENNING&& Flag_SimExist)
			TimerSock = 20;
	}
	else
	{
		PlayMusic(MUSIC_AGAIN);
		TimerStandby = 0;
		Flag_Power_Down = TRUE;
		TimerPowerDown = 100;
	}
#endif	
}

// +CGPSINFO:2311.950276,N,11422.686356,E,150811,075628.5,5.2,0.0,0
uint8_t GpsDataHandle(void)
{
	char 		*p, *ptr, *ptr1;
	char		Latitude[15];
	char		Longitude[15];
	uint8_t		i, j, k;
	uint32_t	f;

	p = (char *)(&tc35data[g_rsq]);
	
#ifdef GPS_TEST
	delay_50ms(10);
	NVIC_DisableIRQ(UART1_IRQn); 
	memcpy( p, 
			"+CGPSINFO:12306.950300,N,11450.000000,E,150811,075628.5,5.2,0.0,0",
			strlen("+CGPSINFO:12305.950300,N,11422.686356,E,150811,075628.5,5.2,0.0,0"));
#endif	
//-------------------------------------------
//	+CGPSINFO:2311.950276,N,11422.686356,E,150811,075628.5,5.2,0.0,0
//            ^          ^
//			  ptr1		 ptr
	ptr = strchr(p, ',');
	if(ptr==NULL)
		return FALSE;

	i = 0;
	ptr1 = &p[10];
	if(ptr-ptr1 >= 15)
		return FALSE;
	
	while(ptr1 != ptr)
		Latitude[i++] = *(ptr1++);
	Latitude[i] = 0;

//-------------------------------------------
//	+CGPSINFO:2311.950276,N,11422.686356,E,150811,075628.5,5.2,0.0,0
//                         ^            ^
//						   ptr1         ptr 
	ptr1 = strchr((char *)ptr+1, ',');
	if(ptr1==NULL)
		return FALSE;
	
	ptr = strchr((char *)ptr1+1, ',');
	if(ptr==NULL)
		return FALSE;

	i = 0;
	ptr1++;
	if(ptr-ptr1 >= 15)
		return FALSE;
	
	while(ptr1 != ptr)
		Longitude[i++] = *(ptr1++);
	Longitude[i] = 0;	

#ifdef GPS_TEST	
	NVIC_EnableIRQ(UART1_IRQn); 	
#endif

	i = 0;
	while(Latitude[i] && Latitude[i]!='.')
		i++;

	if(i<2 || Latitude[i]!='.')
		return FALSE;

	for(k=0; k<i-2; k++)
		gpsInfo[k] = Latitude[k];
	gpsInfo[k++] = '.';

	j = i;		// i ÷∏œÚ '.'
	while( Latitude[j] )
	{
		Latitude[j] =  Latitude[j+1];
		j++;
	}

	j = strlen(&Latitude[i-2]);
	f = StrToInt(&Latitude[i-2], j);	

	for(; j>7; j--)	// xx.yyyyy/60 = 0.xxyyyyy/6
	{
		f /= 10;
	}	

	for(; j<7; j++)
		f = f * 10;
	
	f = f/6;
	
	sprintf(Latitude, "%06ld", f);
	strncpy((char *)&gpsInfo[k], Latitude, 6);
	k += 6;
	
//////////////////////////////////////////////////////
	i = 0;
	while(Longitude[i] && Longitude[i]!='.')
		i++;

	if(i<2 || Longitude[i]!='.')
		return FALSE;

	gpsInfo[k++] = ',';
	gpsInfo[k++] = '-';
	for(j=0; j<i-2; j++)	// i ÷∏œÚ '.'
		gpsInfo[k++] = Longitude[j];
	gpsInfo[k++] = '.';

	j = i;		// i ÷∏œÚ '.'
	while( Longitude[j] )
	{
		Longitude[j] =  Longitude[j+1];
		j++;
	}

	j = strlen(&Longitude[i-2]);
	f = StrToInt(&Longitude[i-2], j);	

	for(; j>7; j--)	// xx.yyyyy/60 = 0.xxyyyyy/6
	{
		f /= 10;
	}	

	for(; j<7; j++)
		f = f *10;

	f = f/6;

	sprintf(Longitude, "%06ld", f);
	strncpy((char *)&gpsInfo[k], Longitude, 6);
	k += 6;
	

	if( state==STATE_TEST && progress>=TEST_GPS && Flag_ObtainGps==FALSE)
		PlayVoice("\"GPSreceived.wav\",2\r");
	///--------------------My added code-----------------///
	LedLight(40);
	///--------------------------------------------------///
	

	Flag_ObtainGps = TRUE;

#if 0
	GpsStop();	
	DelayUntil(100, "+CGPS: 0");
#endif

	return TRUE;
}

static void AtProxy(uint8_t *str)
{
	char  *p;
	
	p = strchr((char *)str+2, '\r');
	if( p )
	{
		p[1] = 0;
		//debug(Custerm_Set);
		SendAtCommand(Custerm_Set);
		module_WaitResponse(100);
		delay_50ms(5);
		if( Flag_MsgDebug == FALSE)
			SendDebugString( &tc35data[g_rsq]);
	}
	else
	{
		SendDebugString( "ERR\r\n" );
	}
}

void MsgHandle(void)
{
	char  *p, *p2;
	
	if(Flag_EndWithCr==1)
	{
		if(state==STATE_ALERT && strstr((char *)tc35data, "VOICE CALL: BEGIN"))
		{
#if 0		
			if(sockState == SOCKSTATE_NULL)
				TimerSock = 0;
			state = STATE_ACTIVE;
#else
			CallActive();
#endif
		}
		else if( (state==STATE_ACTIVE || state==STATE_ALERT)
			&& strstr((char *)tc35data, "VOICE CALL: END"))
		{
#if 0		
			if( state==STATE_ACTIVE )
			{
				TimerStandby = custermParam.param.delay;
				Flag_Power_Down = TRUE;
			}
			else
			{
				EnterCallFail();
			}
#else
			EndCall();
#endif
			delay_50ms(20);
			TimerSock += 35;
		}
		else if(state == STATE_INCOMMING
			&& strstr((char *)tc35data, "MISSED_CALL:"))
		{
			TimerStandby = custermParam.param.delay;
			EnterStandby();
		}
		
		if( sockState == SOCKSTATE_OPENNING 
			&& ( strstr((char *)tc35data, "Network opened") 
				|| strstr((char *)tc35data, "Network is already opened")) )
		{
			sockState = SOCKSTATE_OPENED;
			SockConnect();
			if(state == STATE_GSM_STEADY )
				TimerWait = 100; 
		}	
		else if(  sockState == SOCKSTATE_OPENED			
			&&  strstr((char *)tc35data, "Connection is already created") ) 
		{ 
			sockState = SOCKSTATE_CONNECT_OK;
			TimerWait = 20;
		}	
			
	#if 0	
		else if(sockState == SOCKSTATE_CONNECTING
			&& strstr((char *)tc35data, "Connect fail") )
		{
			//sockState = SOCKSTATE_CONNECT_FAIL;
			TimerSock = 100;	// 5s∫Û÷ÿ–¬¡¨Ω”
		}
	#endif	

	#if 0
		else if(sockState == SOCKSTATE_SENDDING)
		{	// +RECEIVE,0,32:
			p = strstr((char *)tc35data, "+RECEIVE");
			if( p )
			{
				findUdp();
			}


		}
	#endif
	
		if(state >= STATE_REGISTER_OK
			&& strstr((char *)tc35data, "START"))
		{
			//debug("*mod res *");
	#if 0		
			SwitchVoiceChannel(SPEAKER);
			Flag_Power_Down = TRUE;
	#endif		
		}

		
		
		// +CMTI: "ME",16
		p = strstr((char *)tc35data, "+CMTI: ");
		if( p )
		{	
			//debug("waken up by sms");
			TimerSms = 1;
			
			p2 = strchr(p+8, ',');
			if( p2 )
			{
				saveSmsIndex((u8 *)p2+1); 
			}
			
			if( state == STATE_STANDBY )
			{
				TimerModemSleep += MODEM_SLEEP_DELAY;
				if( IsModemSleep == TRUE )
					ModemSleep( FALSE );
			}
		}


		if( STATE_ACTIVE == state )
		{
			p = strstr((char *)tc35data, "+RXDTMF: ");
			if( p )
			{	
				switch(p[9])
				{
					case '4':
						if(curVolume < VOLUME_LEVEL_NUM-1)
						{
							curVolume++;
							AdjustVolume(curVolume);
						}
						break;
						
					case '7':
						if(curVolume > 0)
						{
							curVolume--;
							AdjustVolume(curVolume);
						}
						break;
					case '9':
						// Need to add in the FW ñ when press button ëí9íí on remote phone 
						// the unit should hang up and play message ëíCall endedî see version 1.4.
						PlayMusic(MUSIC_END);
					  EnterEndCall();
					  HuangupCall();
					  
						break;
					
				}
			}
		}
		
#if 0
		ResetUartFlag();
#endif
	}

	if( Flag_EndWithCr || Flag_FindCr )
	{
		if(sockState == SOCKSTATE_SENDDING)
		{	//RECV FROM:113.83.78.83:3061[0D][0A]
			//+RECEIVE,0,32:[0D][0A]
			p = strstr((char *)tc35data, "RECV FROM:");
			if( p )
			{
				delay_ms(200);
				findUdp();
			}
			
			//debug_8("Flag_FindCr", Flag_FindCr, TRUE);
		}

		ResetUartFlag();
	}
	
	if( Flag_Custerm ) 
	{
		if( strstr((char *)Custerm_Set, "AT") )
		{
			uint8_t	finish = 0;
			
			if( Custerm_Set[2] == '+' )
			{
				if( CustermHandle((char *)(Custerm_Set+3)) )
				{
					finish = 1;
				}					
			}
			
			if(finish == 0)
			{
				AtProxy(Custerm_Set);
			}
		}
		
		Flag_Custerm = 0;
		Custerm_Set[0] = 0;
		count_custerm = 0;
	}
		
	FeedWatchdog();
}



// +RECEIVE,0,32:/r/n
void findUdp(void)
{
	const char PREFIX[] = "+RECEIVE,";
	uint8_t	i, j, matchNum=0, length;
	uint8_t	buff[UDP_BUFF_MAX];

	//debug("findUdp");
	
	length = strlen(PREFIX);
	delay_ms(120);
	memcpy(buff, udp_buff+udp_buff_index, UDP_BUFF_MAX-udp_buff_index);
	memcpy(buff+(UDP_BUFF_MAX-udp_buff_index), udp_buff, udp_buff_index);
	buff[UDP_BUFF_MAX-1] = 0;
	
	//debug(buff);
	for(i=0; i<UDP_BUFF_MAX; i++)
	{
		if((UDP_BUFF_MAX-i) < length)
		{
			return;
		}
		
		j = i;
		if(buff[j] == PREFIX[0])
		{
			for(j++,matchNum=1; matchNum<length; matchNum++,j++)
			{
				if(buff[j] != PREFIX[matchNum])
				{
					break;
				}
			}
			
			if(matchNum == length)
			{	// 0,32:/r/n
				for(; j<UDP_BUFF_MAX; j++)
					if(buff[j] == ',')
						break;

				for(i=j; j<UDP_BUFF_MAX; i++)
					if(buff[i] == ':')
						break;
					
				if(i>=UDP_BUFF_MAX || j-i > 3)
				{
					return;
				}	

				length = 0;
				for(j++; j<i; j++)
				{
					if(buff[j]>='0' && buff[j]<='9')
					{
						length = length*10 + (buff[j]-'0');
					}
					else
					{
						return;
					}
				}
				
				j += 3;		// :/r/n
				if(j >= UDP_BUFF_MAX)
				{
					return;
				}
				
				if(state != STATE_STANDBY)
				{
					udp_recv_length = (UDP_BUFF_MAX-j > 18) ? 18 : UDP_BUFF_MAX-j;
					memcpy(udp_recv, buff+j, udp_recv_length);	// "/r/n"
					Flag_RecvUdp = TRUE;
				}
				
				//debug("recv udp rsp");
				break;
			}

		}
	}
	
}


uint32_t StrToInt(char* Str, uint8_t Len)
{
	uint8_t		i, j;
	uint32_t	d = 0;
				
	if (Str == NULL) //≤Œ ˝∑«∑®
	{
		return 0;
	}

	for(i=0; i<Len; i++)
	{
		if(Str[i]<'0' && Str[i]>'9') //≤ª∫œ∑®µƒ◊÷∑˚
		{
			break;
		}
		else //0 ~ 9
		{
			j = Str[i] - '0';
			d *= 10;
			d += j;
		}
	}
  
	return d;
}

uint8_t IsInCall(void)
{
	return ((state >= STATE_INCOMMING) && (state <= STATE_ACTIVE));
}

void InitMsgDebug(void)
{
#if 1
	Flag_MsgDebug = (custermParam.param.debug=='0') ? FALSE : TRUE;
#else
	Flag_MsgDebug = TRUE;
#endif
}

void InitVariables(void)
{
	memset(udp_buff, 0, sizeof(udp_buff));
	udp_buff_index = 0;
	TimerSignal=0;
	ResetUartFlag();
	strcpy(gpsInfo, NOGPSINFO);
	strcpy(gMnc, "000");
	TimerSecond = 0;
	SystemTime = 0;
//	memset(CspiInfo, 0, sizeof(CspiInfo));
}


#if 0
double StrToDouble(char* Str, uint8_t Len)
{
	uint8_t		i, j, has_dot = 0; //±Íº« «∑Ò”ˆµΩ–° ˝µ„'.'
	double 		d = 0;
	double 		temp = 0;

	if (Str == NULL) //≤Œ ˝∑«∑®
	{
		return 0;
	}

	for(i=0; i<Len; i++)
	{
		if (Str[i] == '.') //–° ˝µ„
		{
			if (has_dot) //”ˆµΩµ⁄∂˛∏ˆ'.'
			{
				break;
			}
			else //µ⁄“ª∏ˆ'.'
			{
				has_dot = 1;
			}
		}
		else if(Str[i]<'0' && Str[i]>'9') //≤ª∫œ∑®µƒ◊÷∑˚
		{
			break;
		}
		else //0 ~ 9
		{
			j = Str[i] - '0';
			if(has_dot <= 0) //”ˆµΩ–° ˝µ„÷Æ«∞£¨’˚ ˝≤ø∑÷
			{
				d *= 10;
				d += j;
			}
			else //–° ˝≤ø∑÷
			{
				temp = (double)j;
				d += temp/10.00;
			}
		}
	}
  
	return d;
}
#endif

#if 0
void MusicTest()
{
	uint8_t		i=0;

	while(1)
	{
		PlayMusic(i);
		delay_50ms(100);

		i = (i+1)%MUSIC_NUM;
	}
}
#endif

void PinStatusIndication(uint8_t status)
{
	switch( status )
	{
	case SIM_PIN:
		Flag_SimExist = FALSE;
		PlayVoice("\"pinCodeIsWrong.wav\",2\r");
		debug("pin code err");
		break;
	
	case SIM_PUK:
		Flag_SimExist = FALSE;
		PlayVoice("\"needPuk.wav\",2\r");
		debug("need puk !");
		break;

	case SIM_READY:
		break;
		
	default:
		Flag_SimExist = FALSE;
		PlayVoice("\"noSimCard.wav\",2\r");
		break;
	}
	
	if(status == SIM_READY )
		DelayUntil(120, "+CPIN: READY");		
}


uint8_t PinHandle(uint8_t status)
{
	uint8_t	ret = status;

	delay_50ms(20);
	
	switch( status )
	{
	case SIM_READY:
#ifdef LOCK_SIM		
//		debug("sim card ok");
		ret = LockPinCode(1, custermParam.param.pin_origin);
		if(SIM_READY == ret)
			ret = ChgPinCode(custermParam.param.pin_origin, custermParam.param.pin_use);
#endif		
		PinStatusIndication( ret );
		break;
	
	case SIM_UNKNOW:
	case NO_SIM:
//		debug("no sim card");
		//LcdDisplayPic(35, 16, PIC_ID_NO_SIM, EXT_FULL_CLEAR);
		//LcdClear(0, 0, X_PIXELS, Y_PIXELS);
		//LcdDisplayStr(35, 16, FONT_TYPE_BIG, "No Sim");
		PinStatusIndication( status );
		Flag_SimExist = FALSE;
		break;
		
	case SIM_PIN:
#ifdef LOCK_SIM			
		ret = ActiveSimLock(custermParam.param.pin_use, 0);
#endif
		PinStatusIndication( ret );
		break;
		
	case SIM_PUK:
		//LcdDisplayPic(15, 16, PIC_ID_SIM_LOCKED, EXT_FULL_CLEAR);
		//LcdClear(0, 0, X_PIXELS, Y_PIXELS);
		//LcdDisplayStr(15, 16, FONT_TYPE_BIG, "Sim Locked");
		debug("sim locked");
		PinStatusIndication( SIM_PUK );
		Flag_SimExist = FALSE;
		break;
	}
	


	return TRUE;
}

void Switch2Apn2(void)
{
	if( witchApn == 0)
	{
		SockClose();
		witchApn = 1;
		sockState = SOCKSTATE_NULL;
		SockOpen();
	}

}

static void PhoneInit(void)
{
	uint8_t		i;
	
	module_Init();
	i = GetSimPinStatus();
	ResetUartFlag();
	PinHandle( i );

	ModemNetworkInit();

	// Automatic time and time zone update
//	if( Flag_SimExist )
//		SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CTZU=1");
	GpsStop();		
	ModemAudioInit();
}


static void DelayUntil(uint8_t delay, char * rsq)
{
	sdly = delay;
	while(sdly && !Flag_Power_Down)
	{
		if(Flag_EndWithCr==1)
		{
			if(strstr((char *)tc35data, rsq))
				break;
		}
		
		FeedWatchdog();
	}			
}	

#if 0
void WakeUpIntInit(void)
{
	_GPIO_ENABLE_DEBOUNCE(INT_PORT, INT_PIN);
	_GPIO_CLEAR_INT_STATUS(INT_PORT, 2);
	GPIO_EnableInt(INT_PORT, INT_PIN, GPIO_INT_RISING);
}
#endif

uint8_t Txt2Hex(uint8_t *txt)
{
	uint8_t	value;
	uint8_t	temp;

	temp = txt[0];
	if(temp >= 'A') 
		value = temp - 'A' + 0X0A;
	else
		value = temp - '0';
	value <<= 4;

	temp = txt[1];
	if(temp >= 'A') 
		value += (temp - 'A' + 0X0A);
	else
		value += (temp - '0');
	
	return value;

}

uint8_t Txt2Dec(char *txt, char length)
{
	uint8_t	value = 0;
	uint8_t	i;

	for(i=0; i<length; i++)
	{
		value *= 10;
		value += (txt[i]-'0');
	}
	
	return value;
}


void SmsInit(void)
{
	char  	*p, *p2;

	if( Flag_SimExist==FALSE || Flag_SmsInit==TRUE)
		return;
	
	memset(sms_index, SMSINDEX_NULL, SMS_INDEX_MAX);
		
	SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CNMI=2,1,0,0,0\r\n");
	SendAtWaitRsq(50, MAX_RETRY, FALSE, "AT+CMGF=1\r\n"); //TEXT MODE

	// +CPMS:3,40,3,40,3,40
	if( SendAtCmdRsq("AT+CPMS=\"SM\",\"SM\",\"SM\"\r\n", "+CPMS:") )
	{
		p = strchr((char *)(&tc35data[g_rsq]), ',');
		if( p != NULL )
		{
			p += 1;
			p2 = strchr((char *)p, ',');
			if( (p2 != NULL) && (p2 - p <= 3) )
			{
				smsMax = Txt2Dec(p, p2-p);
			}
		}		
	}

	TimerSms = 12;

//	smsMax = 10;
	if(smsMax > 0)
	{
		Flag_SmsInit = TRUE;
		SendAtWaitRsq(120, MAX_RETRY, FALSE, "AT+CMGD=,4\r\n");
	}
	debug_8("smsmax", smsMax, TRUE);
}

static void saveSmsIndex(u8 * str)
{
	u8	i, j;
	u8  temp[3];
	
	for(i=0; i<SMS_INDEX_MAX; i++)
	{
		if(sms_index[i] == SMSINDEX_NULL)
			break;
	}

	if(i >= SMS_INDEX_MAX)
	{
		//debug("sms_index overflow");
		return;
	}

	for(j=0; j<3; j++)
	{
		if(str[j] < '0' || str[j] > '9')
			break;
		temp[j] = str[j];
	}

	sms_index[i] = Txt2Dec((char *)temp, j);

}

void GetSmsContent(u8 index, char *pSms)
{
	u8	i;

	ResetUartFlag();
	SendAtCommand2("AT+CMGRD=", index);
	
	dlyct2 = 50; 
	while(!Flag_Power_Down)
	{
		if( Flag_EndWithCr==1 || dlyct2==0 )
		{
			 Flag_EndWithCr = 0;
			break;
		}
					
		FeedWatchdog();	
	}

	dlyct2 = 80; 
	while(!Flag_Power_Down)
	{
		if( Flag_EndWithCr==1 || dlyct2==0 )
		{
			 Flag_EndWithCr = 0;
			break;
		}
					
		FeedWatchdog();	
	}
	
	
	i = (Count_SL>220) ? 220 : Count_SL;
	memcpy(pSms, tc35data, i);
	pSms[i] = 0;
	
	debug_8("sms1", Count_SL, TRUE);
	debug((u8 *)pSms);
	debug("sms2");
}

u8	GetSmsMainBody(char	 *pSms)
{
	char		*p, *p2;
	uint16_t	length, offset, i, j;

	p = strchr(pSms, ',');
	if( !p )
		return FALSE;
	p++;
	if(*p++ != '\"')
		return FALSE;
	
	for(i=0; p[i]!='\"' && i<20; i++)
	{
		smsc[i] = p[i];
	}
	smsc[i] = 0;
	
	p2 = strchr(p, '\r');
	if( !p2 )
		return FALSE;
	length = strlen(pSms);
	offset = p2 - pSms;
	for(j=0,i=offset+1; i<length; )
	{
		pSms[j++] = pSms[i++];
	}
	pSms[j] = 0;
	
	return TRUE;
}


static char * GetNum(char *src, char *head, char *tail, u8 *num, u8 maxLength)
{
	char  		*p, *p2;
	
	p = strstr(src, head);
	if( p != NULL )
	{
		p += strlen(head);
		p2 = strstr(p, tail);
		if( (p2 != NULL) && (p2 - p <= maxLength) )
		{
			*num = Txt2Dec(p, p2-p);
			return p2;
		}
	}	

	return NULL;
}


u8	SmsHave()
{
	char  		*p, *p2;
	uint8_t		sum = 0;

	if( Flag_SmsInit == FALSE )
	{
		SmsInit();
	}
	
	// +CPMS: "SM",5,50,"SM",5,50,"SM",5,50
	if( SendAtCmdRsq("AT+CPMS?\r\n", "+CPMS:") )
	{
		p = GetNum((char *)&tc35data[g_rsq], "\"SM\",", ",", &sum, 3);
		if( p )
		{
			if( smsMax == 0 )
			{
				p2 = p + 1;
				if( GetNum(p2, NULL, ",", &smsMax, 3) == NULL )
					sum = 0;
			}
		}
		
	}

	debug_8("sms cnt", sum, TRUE);
	
	return sum;
}

u8 SmsExist(char *pSms)
{
	if( strncmp((const char *)pSms, "+CMS ERROR: 321", 15) == 0)
		return FALSE;

	return TRUE;
}

void SmsDel(u8 index)
{
//	debug_8("SmsDel", index, TRUE);
	
#if 1
	SendAtCommand2("AT+CMGD=", index);	
	module_WaitResponse(50);
#endif	
}


u8 SmsAck(u8 *pSms)
{	
#if 0
	SendAtCommand("AT+CMGSO=\"");
	SendAtCommand( smsc );
	SendAtCommand("\",\"");
	SendAtCommand(pSms);	
	SendAtCommand("\"\r\n");

	if( WaitRsp(200, "+CMGSO") == FALSE )
		return FALSE;
	
	return TRUE;
#else
	u8 end[3] = {0x1a, 0x0d, 0};

	SendAtCommand("AT+CMGS=\"");
	SendAtCommand( smsc );
	SendAtCommand("\"\r");

	if( WaitRsp(250, ">") == FALSE )
		return FALSE;

	delay_ms(2);
	SendAtCommand(pSms);
	SendAtCommand(end);
	if( WaitRsp(250, "+CMGS") == FALSE )
		return FALSE;

	return TRUE;

#endif
}

u8 SmsHeadVerify(char *pSms, u8 *offset)
{
	u8		SmsType = SMSTYPE_NULL;
	char	*p;
	u8		i = 0;
	
	if( strncmp((const char *)pSms, SMS_HEAD_SET, SMS_HEAD_SET_LENGTH) == 0 )
	{
		SmsType = SMSTYPE_SET;
		i = SMS_HEAD_SET_LENGTH;
	}
	else if( strncmp((const char *)pSms, SMS_HEAD_GET, SMS_HEAD_GET_LENGTH) == 0 )
	{
		SmsType = SMSTYPE_GET;
		i = SMS_HEAD_GET_LENGTH;
	}
	else
	{
		return SMSTYPE_NULL;
	}

	p = pSms + i;
	if( strncmp(p, custermParam.param.sms_pw, strlen(custermParam.param.sms_pw)) )
	{
		return SMSTYPE_NULL;
	}

	p += SMS_HEAD_PW_LENGTH;
	if( !strchr((const char *)p, SPLIT) )
	{
		return SMSTYPE_NULL;
	}
	
	*offset = i + SMS_HEAD_PW_LENGTH + 1;
	return SmsType;
	
}



void ConfigureBySms(char *pSms)
{
	u8	SmsType;
	char *p, *p2, *p3;
	u8	offset;

	SmsType = SmsHeadVerify(pSms, &offset);
	if( SmsType == SMSTYPE_NULL )
		return;

	debug_8("valid type", SmsType, TRUE);

	SmsResponse[0] = 0;
	Flag_SmsConfig = TRUE;
	p = pSms + offset;
	while( *p )
	{
		// PHONE1#181812075116#
		// ^
		// p
		p2 = strchr(p, SPLIT);
		if( !p2 )
			break;
		// PHONE1#181812075116#
		//       ^
		//       p2
		if( SmsType == SMSTYPE_GET )
		{
			*p2 = '?';
			p3 = p2;
		}
		else
		{
			p3 = strchr((char *)p2+1, SPLIT);
			if( !p3 )
				break;
			// PHONE1#181812075116#
			// ^     ^            ^
			// p     p2           p3
			*p2 = '=';
			*p3 = '\r';
		}
		
		if( !CustermHandle( p ) )
			break;
		p = p3 + 1;
		
	}

	if( SmsResponse[0] )
	{
		SmsAck( (u8 *)SmsResponse );
	}

	Flag_SmsConfig = FALSE;
}

void SmsHandle(void)
{
	u8	i;
	
	if( TimerSms || IsModemSleep==TRUE || (state==STATE_TEST && progress==TEST_VERSION))
		return;

	debug_8("SmsHandle", LogCnt, TRUE);
	
	TimerSms = 6;	// 6s

	if( LogCnt )
	{
		LogSendBySms();
		TimerSms = 20;	// 2s
		return;
	}
	
	if(sms_index[0] == SMSINDEX_NULL)
	{
		if( SmsHave() )
		{
			if( !Flag_SmsHave )
			{
				SmsIndex = 0;
				Flag_SmsHave = TRUE;
			}
			else
			{
				SmsIndex = (SmsIndex+1) % smsMax;
			}
		}
		else
		{
			TimerSms = 45;	// 60s
			return;
		}
	}
	else
	{
		SmsIndex = sms_index[0];
		for(i=0; i<SMS_INDEX_MAX-1; i++)
		{
			sms_index[i] = sms_index[i+1];
		}
		sms_index[i] = SMSINDEX_NULL;

		if(sms_index[0] == SMSINDEX_NULL)
			TimerSms = 45;	// 60s
	}
	
	GetSmsContent(SmsIndex, SmsContent);
	if( SmsExist( SmsContent ) && GetSmsMainBody(SmsContent))
	{
		debug(smsc);
		ConfigureBySms( (char *)SmsContent );
		//SmsDel( SmsIndex );
	}
	
}


void PlayVoice(const uint8_t *voice)
{
	SendAtCommand("AT+CCMXPLAYWAV=");
	SendAtCommand((uint8_t *)voice);
	module_WaitResponse(50);	
}

const static uint8_t *digit_files[] = 
{
	"\"0.wav\",2\r",
	"\"1.wav\",2\r",
	"\"2.wav\",2\r",
	"\"3.wav\",2\r",
	"\"4.wav\",2\r",
	"\"5.wav\",2\r",
	"\"6.wav\",2\r",
	"\"7.wav\",2\r",
	"\"8.wav\",2\r",
	"\"9.wav\",2\r",
	"\"dot.wav\",2\r"
};

/*
	AT+CCMXPLAYWAV="0.wav",2[0D][0D][0A]
	+WAVSTATE: wav play[0D][0A]
	0[0D]
	[0D][0A]
	+WAVSTATE: wav play stop[0D][0A]
*/
void Str2Speech(char *ver)
{
	u8	j = strlen(ver);
	u8	i;
	
	for(i=0; i<j; i++)
	{
		if(ver[i] == '.')
			PlayVoice(digit_files[10]);
		else
			PlayVoice(digit_files[ver[i]-'0']);

		sdly = 50;
		while(sdly && !Flag_Power_Down)
		{
			if( strstr((char *)&tc35data[g_rsq], "stop") != NULL )
				break;
			FeedWatchdog();
		}
		
	}

}

const static uint8_t *strong_file[] = 
{
	"\"20per.wav\",2\r",
	"\"40per.wav\",2\r",
	"\"60per.wav\",2\r",
	"\"80per.wav\",2\r",
	"\"100per.wav\",2\r"
};

void StrongPlay(u8	i)
{
	if( i < 1 || i > 5 )
		PlayVoice(strong_file[i]);
}

void SmsRsqAdd(char *str)
{
	if(strlen(SmsResponse) + strlen(str) > 140)
		return;
	
	strcat(SmsResponse, str);
}

void LedLight(uint8_t ms_50)
{
	SysTick_DisableInt();

	LedMode = LEDMODE_LIGHT;
	LED_PORT_PIN = LED_LIGHT;	
	TimerLed = ms_50;
	
	SysTick_EnableInt();
}

void LedBlink()
{
	LedMode = LEDMODE_BLINK;
}

void LedDark()
{
	if(LedMode != LEDMODE_DARK)
	{
		LedMode = LEDMODE_DARK;
		LED_PORT_PIN = LED_DARK;	
		TimerLed = 0;
	}
}

char * GetString(char *src, char *head, char *tail, char *str, u8 maxLength)
{
	char  		*p, *p2;
	u8			length;
	
	p = strstr(src, head);
	if( p != NULL )
	{
		p += strlen(head);
		p2 = strstr(p, tail);
		if( (p2 != NULL) && (p2 - p <= maxLength) )
		{
			length = p2 - p;
			memcpy(str, p, length);
			str[length] = 0;
			return p2;
		}
	}	

	return NULL;
}

void GetCpsiInfo(void)
{	
#if 1
	char *p, *p2;
	char mnc[4];
	char lac[5];
	char cell[10];
	
//MNC LAC CELL_ID
//+CPSI: <System Mode>, <Operation Mode>, <MCC>- <MNC>,<LAC>,<Cell ID>,<Frequency Band>, <PSC>, <Freq>, <SSC>,<EC/IO>,< RSCP >,<Qual>,<RxLev>,<TXPWR>
//+CPSI: WCDMA, Online,310-410,0xD8DF,57659107,WCDMA 850,354,4385,0,5.5,55,37,60,500
//+CPSI: GSM,Online,460-01 0x25b1,22273,124 EGSM 900,-77,0,19-13
	if( SendAtCmdRsq("AT+CPSI?\r\n", "+CPSI:") == FALSE )
		return;

	p = GetString((char *)&tc35data[g_rsq], "-", ",", mnc, 3);
	if( !p )
	{
		p = GetString((char *)&tc35data[g_rsq], "-", " ", mnc, 3);
		if( !p )
			return;
	}

//	debug(mnc);
	
	p2 = GetString(p, "0x", ",", lac, 4);
	if( !p2 )
		return;
//	debug(lac);

	p = GetString(p2, ",", ",", cell, 9);
	if( !p )
		return;
	
//	debug(cell);
	
	Flag_ObtainCpsi = TRUE;

	strcpy(gpsInfo, mnc);
	strcpy(gMnc, mnc);
	strcat(gpsInfo, ".");
	strcat(gpsInfo, lac);
	strcat(gpsInfo, ",-");
	strcat(gpsInfo, cell);
	
#endif	
}

static void BatteryIndicate(uint16_t adc)
{
	// œ‘ æµÁ≥ÿµÁ¡ø
	if(adc < custermParam.param.battEmptyLev)
		PlayVoice("\"replaceBattery.wav\",2\r");
	else if(adc < custermParam.param.battLowLev)
		PlayVoice("\"batteryLow.wav\",2\r");
	else
		PlayVoice("\"batteryOK.wav\",2\r");
}


void BatteryVoltage(uint16_t adc, char *voltageStr)
{
	uint8_t		i;
	
	adc = (adc * 10) / 62;
	voltageStr[0] = adc / 100 + '0';
	voltageStr[1] = '.';

	i = adc % 100;
	voltageStr[2] = i / 10 + '0';
	voltageStr[3] = i % 10 + '0';
	voltageStr[4] = 0;

}

static uint8_t StandbyTimerHandle(uint8_t s)
{	
	if( state != STATE_STANDBY )
		return FALSE;
	
	TimerModemSleep = (TimerModemSleep>s) ? (TimerModemSleep-s) : 0;
	if( TimerModemSleep==0 && IsModemSleep==FALSE )
	{
		if( SmsHave() || LogCnt )
			TimerModemSleep = MODEM_SLEEP_DELAY;	// 20s
		else
			ModemSleep(TRUE);
	}
		
//***********************************************************************
	TimerStandby = (TimerStandby>s) ? (TimerStandby-s) : 0;
//	debug_16("TimerStandby = 0x", TimerStandby, TRUE);
	
	if( TimerModemSleep && (TimerStandby<MODEM_SLEEP_DELAY) )
	{
		TimerStandby += MODEM_SLEEP_DELAY;
	}
	else if( TimerStandby == 0 )
	{
		EnterPowerDown();
		return TRUE;
	}

	return FALSE;
}


uint8_t GetDateTime(char *time, uint8_t length)
{
	if( SendAtCmdRsq("AT+CCLK?\r\n", "+CCLK:") == FALSE )
		return FALSE;

	if( GetString((char *)&tc35data[g_rsq], "\"", "+", time, length) )
		return TRUE;

	if( GetString((char *)&tc35data[g_rsq], "\"", "-", time, length) )
		return TRUE;
	
	return FALSE;
}

#if 0 
void SetDateTime(uint8_t *time)
{
	static uint8_t	dateInit = FALSE;
	u32	i;
	struct tm *t;
	char buf[18];

	if( dateInit )
		return;
	
	i = time[0]<<24;
	i = i+ (time[1]<<16);
	i = i+ (time[2]<<8);
	i = i+ time[3];
	
	t = localtime((time_t *)&i);
	//"08/11/26,10:15:00"
	sprintf(buf, "%2d/%02d/%02d,%02d:%02d:%02d",
			t->tm_year-100,t->tm_mon+1,t->tm_mday,t->tm_hour,t->tm_min,t->tm_sec);
	SendAtWaitRsq(100, MAX_RETRY, FALSE, "AT+CCLK=\"%s\"\r\n", (u8 *)buf);

	if(	tc35data[g_rsq]=='0' || tc35data[g_rsq]=='O' )
		dateInit = TRUE;
	
}
#endif

void LogSendBySms(void)
{
	char buf[128];
	
	if( ReadLog(buf) == LOG_VALID )
	{
		strcpy(SmsResponse, "+LOG=");
		SmsRsqAdd(buf);
		SmsRsqAdd(SPLIT_STR);
		SmsAck( (u8 *)SmsResponse );
	}
}

void QueryModuleSate(void)
{
	char 	*p;
	char 	ret[2];
	
	//+CLCC: 1,0,2,0,0,
	//+CLCC: 1,0,3,0,0,
	//+CLCC: 1,0,0,0,0,
	if( SendAtCmdRsq("AT+CLCC\r\n", "+CLCC:") == TRUE )
	{
		if(tc35data[g_rsq]=='0' || tc35data[g_rsq]=='O' )
		{
			if( EndCall() == TRUE)
				return;
		}
			
		p = strchr((char *)&tc35data[g_rsq], ',');
		if( !p )
			return;
		
		p = GetString(p+1, ",", ",", ret, 1);
		if( !p )
			return;

		if( state==STATE_ALERT && ret[0]=='0' )
		{
			CallActive();
		}
	}

//	debug("QueryModuleSate");
	
}

void CallActive(void)
{
	if(sockState == SOCKSTATE_NULL)
		TimerSock = 0;
	state = STATE_ACTIVE;
}

uint8_t EndCall(void)
{
	uint8_t	ret = TRUE;
#if 1	
	if(state==STATE_ACTIVE)
	{
		TimerStandby = custermParam.param.delay;
		Flag_Power_Down = TRUE;
		ret = TRUE;
	}
	else if(state==STATE_ALERT)
	{
		EnterCallFail();
		ret = TRUE;
	}
#else
	if(state==STATE_ALERT || state==STATE_ACTIVE)
	{
		EnterCallFail();
		ret = TRUE;
	}

#endif

	return ret;
}


#if 0
void UpdateDateTime(void)
{
	static u8	init_ok = FALSE;
	char *p;

	if( init_ok == TRUE )
		return;
	
	if( SendAtCmdRsq("AT+CHTPUPDATE\r\n", "+CHTPUPDATE") )
	{
		p = strstr(&tc35data[g_rsq], "+CHTPUPDATE");
		if( !p )
			return;

		if( p[13] == '0' )
			init_ok = TRUE;
	}
}
#endif

void RegisterWait(void)
{
	uint8_t signal;
	
	if( Flag_SimExist == FALSE )	
		signal = signal_quality();
	else
		signal = Module_CheckRegister();
	
	if( signal > 0 && signal != SIGNAL_STRENGTH_INVAILD )
	{
		state = STATE_REGISTER_OK;
		TimerWait = 100;
	}
	else
	{
		TimerWait = 40;
	}

}


void PowerDownHandle(void)
{
	if( Flag_Power_Down )
	{
		Flag_Power_Down = FALSE;
	
		if( IsInCall() )
			HuangupAllCall();
	
		if( state == STATE_STANDBY )
		{
			EnterPowerDown();
		}
		else if(state < STATE_STANDBY)
		{
			if (state==STATE_ACTIVE || state==STATE_INCOMMING )
			{
				PlayMusic(MUSIC_END);
				//LcdClear(0, 0, X_PIXELS, Y_PIXELS);
				//LcdDisplayStr(15, 16, FONT_TYPE_BIG, "Ending Call");
				TimerPowerDown = 40;
			}
								
			if(Flag_async_Power_Down == TRUE)
			{
				Flag_async_Power_Down = FALSE;
	
				if ((state!=STATE_ACTIVE) && (state!=STATE_INCOMMING))
				{
					TimerPowerDown = 0;
				}
			
				if( state == STATE_ACTIVE )
					TimerStandby = custermParam.param.delay;
				else
					TimerStandby = 0;
			}
	
			if( Flag_SimExist==FALSE )
				TimerStandby = 0;
			
			EnterEndCall();
		}
		
	}

}


/*
	AT+CNSMOD?
	+CNSMOD: 0,2
*/


/*
	2g
0	    	1
1	2	4
2	5	7
3   	8  	11
4	12-16
5   	17

	3g
0	    	1
1	2	3
2	4	6
3   	7  	11
4	12-16
5   	17

AT+CNSMOD?
+CNSMOD: 0,2

*/

static u8 IsUnder3G(void)
{
	char	mode[2];
	
	if( SendAtCmdRsq("AT+CNSMOD?\r\n", "+CNSMOD:") == TRUE 
		&& GetString((char *)&tc35data[g_rsq], ",", "\r", mode, 2) )
	{
		debug((u8 *)mode);
		return (mode[0] > '4');
	}
	
	return TRUE;
}

static u8 GetGsmSigal(void)
{	
	u8	signal = signal_quality();
	u8	level = 0;
	
	if( IsUnder3G())
	{
		// -- 3g
		if( signal == 99 || signal < 2 )
			level = 0;
		else if( signal >= 17 )
			level = 5;
		else if( signal >= 12 )
			level = 4;
		else if( signal >= 7 )
			level = 3;
		else if( signal >= 4 )
			level = 2;
		else
			level = 1;
	}
	else
	{
		// -- 2g
		if( signal == 99 || signal < 2 )
			level = 0;
		else if( signal >= 17 )
			level = 5;
		else if( signal >= 12 )
			level = 4;
		else if( signal >= 8 )
			level = 3;
		else if( signal >= 5 )
			level = 2;
		else
			level = 1;
	}
	
	return level;
}


const static uint8_t *csq_files[] = 
{
	"\"oneBar.wav\",2\r", //"\"noService.wav\",2\r",
	"\"oneBar.wav\",2\r",
	"\"twoBars.wav\",2\r",
	"\"threeBars.wav\",2\r",
	"\"fourBars.wav\",2\r",
	"\"fiveBars.wav\",2\r"
};

static void CsqPlay(u8 level)
{
	if( level < 6 )
		PlayVoice(csq_files[level]);
}

