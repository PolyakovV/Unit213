#ifndef __MISC_H__
#define __MISC_H__

#include "lib.h"

enum MUSIC
{
	MUSIC_HELP_CALL = 0,
	MUSIC_END,
	MUSIC_AGAIN,
	MUSIC_FAIL,
	MUSIC_911_CALL,
	MUSIC_PD,
	
	MUSIC_NUM
};


extern uint8_t Flag_Custerm;
extern uint8_t Custerm_Set[];
extern uint8_t count_custerm;

extern uint8_t	Flag_MsgDebug;
extern uint8_t	Flag_DisabeDoubleButton;
extern u8	ModuleNoAck;
extern u8	TimerSms;
extern uint8_t Flag_ObtainCpsi;
extern char	SmsResponse[141];


#define  SIGNAL_STRENGTH_INVAILD		 99

//#define	LcdDisplayStr(x, y, font, str)
//#define	LcdClear(x0, y0, x1, y1) 
//#define	LcdDisplayPic(x, y, pic, clear) 

void WatchdogInit(void);
void FeedWatchdog(void);
void SoftReset(void);
void UartlInit(void);

void TimerInit(void);


void MiscInit(void);


void GPIOInit(void);
void ClkInit(void);
void delay_ms(u16 ms);
void delay_50ms(u8 ms);
void Hex2Txt(u8 hex, u8 *txt);
void Dec2Txt(u8 dec,u8 * txt,u8 fill);
void DEC2Txt(u16 dec, u8 *txt, u8 fill);
void Dec2Txt2(u8 dec, u8 * txt);

void SendDebug(uint8_t *atcmd, uint8_t length);
void SendDebugString(uint8_t *atcmd);
void debug(unsigned char *string);
void debug_32(u8 * string,u32 value);
void debug_16(u8 * string,u16 value,u8 lf);
void debug_8(unsigned char * string,u8 value,u8 lf);
void debug_Hex(u8 *string, u8 length);
	
void MulHex2Txt(u8 string[],u8 number);

uint8_t PressBatter(void);
uint8_t PressHelp(void);


void UartInit(void);
void AdcInit(void);
void AdcStart(void);
void ModuleOn(uint8_t on);




void PaCtrlEnable(uint8_t enable);


void LockPower(uint8_t enable);

void ModulePowerOn(uint8_t on);
void WhatToDo(void);


void WaitLockPower(void);
void PowerOn(void);
void module_Init(void);
void SignalCheck(void);


void BatterCheck(void);


void SecondHandle(void);



void LowValtageWarnning(u16 batteryvoltage);

u8 getBatteryDispalyLevel(u16 batteryvoltage);


void DisplayBatteryVol(u16 batteryvoltage);


void DisplaySignalLevel(u8 signallevel);


//void DisplayCallTimes(u16 secondnum);




void PlayMusic(u8 index);



void EnterCall(void);
void EnterAnswer( void );


void Redial(void);


void EnterPowerDown(void);
void EnterStandby(void);


void Call(void);


void PowerDown(void);


void EnterEndCall(void);
void EnterCallFail(void);

void KeyHandle(void);
void enter_test_mode(u8 progress);

void SockOpen(void);
void SockConnect(void);
void SockClose(void);
uint8_t GpsDataHandle(void);
void MsgHandle(void);
void MusicTest(void);

uint32_t StrToInt(char* Str, uint8_t Len);
uint8_t IsInCall(void);
void InitMsgDebug(void);
void InitVariables(void);

void MeasurePower(uint8_t cnt);
uint8_t PinHandle(uint8_t status);
void Switch2Apn2(void);
void ModemSleep(uint8_t on);
void WakeUpIntInit(void);
void PlayVoice(const uint8_t *voice);
void BackLightOn(uint8_t on, uint8_t ms);
void StrongPlay(u8	i);
void SmsHandle(void);
void SmsInit(void);
void SmsRsqAdd(char *str);
void LedLight(uint8_t ms_50);
void LedBlink(void);
void LedDark(void);
void ClkInit(void);

#ifdef DELAY_TEST
void DelayTest(void);
#endif

uint8_t GetDateTime(char *time, uint8_t length);
void SetDateTime(uint8_t *time);
void QueryModuleSate(void);
void UpdateDateTime(void);

void Hex2String(u8 *hexStr, u8 hexLen, u8 *str);
u8 Str2Hexs(u8 *str, u8 hexMax, u8 *hexs);

void RegisterWait(void);

void GetCpsiInfo(void);
u8 SmsAck(u8 *pSms);
void PowerDownHandle(void);
void BatteryVoltage(uint16_t adc, char *voltageStr);
char * GetString(char *src, char *head, char *tail, char *str, u8 maxLength);

#endif
