#ifndef __EXT_VAR_H__
#define	__EXT_VAR_H__

#include "lib.h"
//
extern uint8_t Flag_EndWithCr;
extern uint8_t Flag_FindCr;

extern uint8_t Flag_Incomming;
extern uint8_t isCheckingBattery;
extern uint8_t Flag_Power_Down;
extern uint8_t Flag_async_Power_Down;
//extern uint8_t Flag_EarIn;
extern uint8_t BattKey;
extern uint8_t HelpKey;
extern uint8_t LongHelpKey;
extern uint8_t LongBattKey;
/////////////////////////////////
/////////////////////////////////
extern uint8_t Flag_LowBat;
extern uint8_t Flag_ObtainGps;
extern uint8_t Flag_SimExist;
//   
extern uint8_t TimerSignal;
extern volatile uint8_t dlyct1;
extern volatile uint8_t dlyct2;  
extern volatile uint8_t sdly;
extern uint8_t tc35data[MAX_SMS_LENGTH+1];		   
extern uint16_t Count_SL;

extern uint16_t	adc_result;

extern uint8_t state;
extern uint16_t TimerWait;
extern uint8_t TimerBattery;
extern uint8_t TimerSecond;
extern uint16_t	BatteryVol;
extern uint8_t callTimes;
extern uint8_t TimerKeyHelp;
extern uint8_t TimerKeyrBatt;
extern uint8_t curVolume;
extern uint8_t progress;
extern uint8_t TimerLed;
///----------------
extern uint16_t TimerTestMode;
extern uint8_t TimerLockMode;
///----------------
extern uint8_t sockState;
extern uint16_t TimerSock;
extern uint8_t TimerGps;
extern char gpsInfo[23];
//extern char CspiInfo[23];
extern char gMnc[4];
extern uint8_t TimerUdp;
extern uint16_t TimerStandby;
#ifdef GPS_AUTO
extern uint16_t TimerGpsPeriod;
extern uint8_t	gpsSendCnt;
#endif
extern volatile uint8_t TimerPowerDown;
extern uint16_t g_rsq;
extern const char *NOGPSINFO;
extern uint8_t witchApn;

extern uint8_t	Flag_SmsConfig;
extern uint8_t	LedMode;
extern uint8_t	SystemTime;
extern uint8_t Flag_GpsStart;
extern uint8_t SignalIntensity;
extern uint8_t LogCnt;
extern uint16_t	logSet;
extern uint8_t gSia[11];
extern uint8_t gPhoneNumOk;
extern uint8_t Flag_ModuleOn;

#endif

