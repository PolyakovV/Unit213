#include <stdio.h>
//#include "Driver\DrvUART.h"
//#include "Driver\DrvGPIO.h"
//#include "Driver\DrvSYS.h"
#include "lib.h"
#include "misc.h"
#include "module.h"
#include "udp.h"
#include <string.h>
#include "custerm.h"
#include "gpio.h"

//
uint8_t Flag_EndWithCr; 
uint8_t Flag_FindCr;

uint8_t Flag_Incomming = FALSE;
uint8_t isCheckingBattery=FALSE;
uint8_t Flag_Power_Down = FALSE;
uint8_t Flag_async_Power_Down = FALSE;
//uint8_t Flag_EarIn = FALSE;	//true 耳机插入
uint8_t BattKey = FALSE;
uint8_t HelpKey = FALSE;
uint8_t LongBattKey = FALSE;
uint8_t LongHelpKey = FALSE;
uint8_t Flag_LowBat = FALSE;
uint8_t Flag_ObtainGps = FALSE;
uint8_t	Flag_SimExist = TRUE;
uint8_t	Flag_MsgDebug = FALSE;
//  
uint16_t Count_SL; 
uint8_t TimerSignal;
volatile uint8_t dlyct1;
volatile uint8_t dlyct2;
volatile uint8_t sdly;

uint8_t tc35data[MAX_SMS_LENGTH+1];		  
uint16_t	 adc_result = 0;

uint8_t state = STATE_NULL;
uint16_t TimerWait=0;

///--------------------
uint16_t TimerTestMode;
uint8_t TimerLockMode=0;
///--------------------
uint8_t TimerBattery;
uint8_t TimerLed = 0;
uint8_t TimerSecond;
uint16_t BatteryVol = 0xff;
uint8_t callTimes = 0;
uint8_t TimerKeyHelp = 0;
uint8_t TimerKeyrBatt = 0;

uint8_t curVolume = VOLUME_LEVEL_DEFAULT;

uint8_t sockState = SOCKSTATE_NULL;
uint8_t witchApn = 1;		// 0:agps, 1: help data

uint16_t TimerSock;
uint8_t TimerGps=0;
uint16_t TimerStandby=0;

#ifdef GPS_AUTO
uint16_t TimerGpsPeriod=0;
uint8_t	gpsSendCnt = 0;
#endif
volatile uint8_t TimerPowerDown=0;
uint8_t progress = TEST_NULL;
uint16_t	g_rsq;

uint8_t	LedMode = LEDMODE_DARK;
uint8_t SystemTime;
uint8_t Flag_GpsStart = FALSE;
uint8_t gPhoneNumOk = PHONE_NUM_BUSY;
uint8_t Flag_ModuleOn = FALSE;
//////////////////////////////////////
uint8_t tmp_my=0; // my string
  u8 counterPress=0; // my string
/////////////////////////////////////
int32_t main()
{

/***************************************************************************
*       ClkInit()
****************************************************************************/
	ClkInit();

/***************************************************************************
*       GPIOInit();
****************************************************************************/
//	DrvGPIO_InitFunction(E_FUNC_GPIO);
	outpw(&SYS->P0_MFP, 0);
	outpw(&SYS->P1_MFP, 0);
	outpw(&SYS->P2_MFP, 0);
	outpw(&SYS->P3_MFP, 0);
	outpw(&SYS->P4_MFP, 0);

	_GPIO_SET_PIN_MODE(MODEM_ON_PORT, MODEM_ON_PIN, GPIO_PMD_OUTPUT);
	ModuleOn(TRUE);

	_GPIO_SET_PIN_MODE(MODEM_POWER_PORT, MODEM_POWER_PIN, GPIO_PMD_OUTPUT);
	ModulePowerOn(FALSE);

	_GPIO_SET_PIN_MODE(LOCK_POWER_PORT, LOCK_POWER_PIN, GPIO_PMD_OUTPUT);
	LockPower(FALSE);

	_GPIO_SET_PIN_MODE(KEY_HELP_PORT, KEY_HELP_PIN, GPIO_PMD_QUASI);
	_GPIO_SET_PIN_MODE(KEY_BAT_PORT, KEY_BAT_PIN, GPIO_PMD_QUASI);

	_GPIO_SET_PIN_MODE(SLEEP_PORT, SLEEP_PIN, GPIO_PMD_OUTPUT);
	ModemSleep(FALSE);

	_GPIO_SET_PIN_MODE(LED_PORT, LED_PIN, GPIO_PMD_OUTPUT);
	
	LedDark();
	
	_GPIO_SET_PIN_MODE(INT_PORT, INT_PIN, GPIO_PMD_INPUT);

/***************************************************************************
*       TimerInit();
****************************************************************************/
	SysTick_Config(SYS_TICK);
//	SYS_LockReg();

/***************************************************************************
*       UartInit();
****************************************************************************/
	UartInit();
//	debug(VERSION);
//	DrvSYS_GetPLLClockFreq();

/***************************************************************************
*       WatchdogInit();
****************************************************************************/	
	WatchdogInit();

//	udpTest();
	NvInit();



 	WhatToDo();
	AdcInit();
	
	
	
	WaitLockPower();

  LockPower(!custermParam.param.lockState);


	InitMsgDebug();	
	
	if( Communication(10) == FALSE )
		SoftReset();

	if( isCheckingBattery )
	{
		delay_50ms(40);
		MeasurePower(4);
	}
	else
	{
		MeasurePower(2);
	}
					
	Flag_ModuleOn = TRUE;
	//Flag_ModuleOn = TRUE;
	ModemVolumeInit();

	///--------------------24.11.2015----------------------------------------------
	////////////////////////////////////////////////////////////////////////////////////////
while(PressHelp()&&(tmp_my<200)&&(PressBatter())){
	tmp_my++;
		
	delay_50ms(1);
if (tmp_my>=150) {
	  LedLight(144);
	    if (custermParam.param.lockState) {
														LockPower(TRUE);
														custermParam.param.lockState = FALSE;
												    WriteToNv( &custermParam ); //- save to eeprom
  													PlayVoice("\"unitUnlock.wav\",2\r");
														delay_ms(2000);
			                      LockPower(FALSE);
			
			} else {
	                          //  debug("ins");
															while(PressBatter()){};
														 tmp_my=0;
												while (tmp_my<25){               
																											tmp_my++;
																											delay_ms(150);
																											if (PressBatter()){counterPress++;
																																				while(!PressBatter()){};
																																					}
																										  if (counterPress>2){ 
																																					PlayVoice("\"unitLock.wav\",2\r");
																																					delay_ms(2000);
																																					custermParam.param.lockState = TRUE;
																																					WriteToNv( &custermParam ); //- save to eeprom
																																		      tmp_my=0;
																																					delay_ms(2000);
																																					LockPower(DISABLE);

																																				}
																											}
													LedBlink();
										} 
					///////				
			tmp_my=0;
			}

}

while(custermParam.param.lockState){}
 
///////////////////////////////////////////////////////////////////////////////////////////////													
#ifdef DELAY_TEST
	DelayTest();
#endif
	PowerOn();
	
	

	
	if(state==STATE_POWERING_DOWN || Flag_Power_Down)
	{
		Flag_Power_Down = FALSE;
		EnterPowerDown();
		while( TimerWait )
			FeedWatchdog();
		PowerDown();
		//不会返回
	}
	
	InitVariables();
	  
	if(state == STATE_NULL)
	{
		state = STATE_1ST_CALL;
		TimerWait = 100;	// 5 s
	}
	
	TimerTestMode = 6000;
	//debug("ent main loop");
	while(1)
	{  
			
		///--------------------
				if (!TimerTestMode && state==STATE_TEST)
										{ 
										PlayMusic(MUSIC_PD);
										EnterPowerDown();
										}
		
		///--------------------
		
		if( Flag_Incomming )
		{
	#if 1
			TimerWait = 200;
			Flag_Incomming = FALSE;
			TimerStandby = custermParam.param.delay;
			//if(state != STATE_ACTIVE)
			{
				ModemSleep(FALSE);
				state = STATE_INCOMMING;
			}
	#else
			Flag_Incomming = FALSE;
			if(state != STATE_INCOMMING)
			{
				state = STATE_INCOMMING;
				ModemSleep(FALSE);
				EnterAnswer();
			}
	#endif
		}
		
		if(TimerWait == 0)
		{
			switch(state)
			{
									
			case STATE_POWERING_DOWN:
				PowerDown();
				break;

			case STATE_1ST_CALL:
				RegisterWait();
				break;

			case STATE_REGISTER_OK:	
				GetCpsiInfo();
				if( Flag_ObtainCpsi==TRUE)
				{
					state = STATE_GSM_STEADY;
					if( Flag_SimExist )
					{
						//delay_50ms(200);
						SockOpen();
						TimerWait = 400;
					}
					else
					{
						TimerWait = 60;
					}
				}
				else
				{
					TimerWait = 70;
				}
				break;

			case STATE_GSM_STEADY:	
				if( gPhoneNumOk==PHONE_NUM_READY || Flag_SimExist==FALSE)
					EnterCall();
				else
					TimerWait = 40;
				break;
				
			case STATE_CALL_PROMPT:
				Call();
				break;

			case STATE_ALERT:
				EnterCallFail();
				break;
			
			case STATE_NEXT_CALL:
				Redial();
				break;				

			case STATE_BATT_DISPLAY:
				EnterPowerDown();
				break;

			case STATE_INCOMMING:
				TimerStandby = custermParam.param.delay;
				EnterStandby();
				break;
			}
		}

		if( TimerSock==0 && Flag_SimExist
			&& ( (state>=STATE_GSM_STEADY && state<STATE_STANDBY) || progress>=TEST_GPS ) )
		{
			switch(sockState)
			{
			//case SOCKSTATE_NULL:
			case SOCKSTATE_CONFIG:				
			case SOCKSTATE_OPENNING:
				SockOpen();	// 打开失败，从新打开
				break;

			case SOCKSTATE_OPENED:
				SendAtWaitRsq(50, 1, FALSE, "AT+CIPOPEN=0,\"UDP\",,,%s\r\n", custermParam.param.local_port);
				TimerSock = 80;
				break;
	#if 0
			case SOCKSTATE_CONNECTING:
				SockConnect();	// 连接失败，从新连接
				break;
	#endif
			case SOCKSTATE_CONNECT_OK:		
				if( witchApn == 1)
					ClientInit();
				break;

			default:
				break;
			}
		}

		KeyHandle();

		SecondHandle();
		//SignalCheck();
		BatterCheck();
		PowerDownHandle();
		MsgHandle();
											
		if( Flag_SimExist )
		{
			UdpHandle();
			SmsHandle();
			PowerDownHandle();
		}
		
		FeedWatchdog();
	}
}	


