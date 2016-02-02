
#ifndef __LIB_H1__
#define	__LIB_H1__

#include <stdint.h>
#include "M051Series.h"


#define	MAX_RETRY	6
#define  LOCK_SIM
#define	VOICE_PREFER	//语音呼叫前，不进行gprs打开尝试
#define	TIME_AFTER_GPRS_TRY		300	// 15s  	打开gprs后，延时语音拨号
#define	TIME_AFTER_VOICE_CALL	160	// 8s		语音拨号后，延时打开gprs

#define VOLUME_LEVEL_NUM          7
#define VOLUME_LEVEL_DEFAULT      (VOLUME_LEVEL_NUM-1)

#define	USER

//#define	CLK_IRC	// 使用内部 rc
//#define	DELAY_TEST
//#define	GPS_TEST

#define	SPLIT	'#'
#define	SPLIT_STR	"#"
#define	MAX_MODULE_NO_ACK		4
#define	MAX_SMS_LENGTH	350


#define	MODEM_POWER_PORT		P2
#define	MODEM_POWER_PIN			5
#define	MODEM_POWER_PORT_PIN	P25

#define	MODEM_ON_PORT			P0
#define	MODEM_ON_PIN			1
#define	MODEM_ON_PORT_PIN		P01


#define	LED_PORT			P1
#define	LED_PIN			4
#define	LED_PORT_PIN		P14

#define	LED_LIGHT		0
#define	LED_DARK		1

#define	LOCK_POWER_PORT			P3
#define	LOCK_POWER_PIN			6
#define	LOCK_POWER_PORT_PIN		P36

#define	KEY_HELP_PORT			P3
#define	KEY_HELP_PIN			5
#define	KEY_HELP_PORT_PIN		P35

/*
#define	KEY_END_PORT		E_PORT0
#define	KEY_END_PIN			E_PIN4

#define	KEY_VOLUP_PORT		E_PORT4
#define	KEY_VOLUP_PIN		E_PIN7

#define	KEY_VOLDOWN_PORT	E_PORT0
#define	KEY_VOLDOWN_PIN		E_PIN7
*/

#define	KEY_BAT_PORT			P3
#define	KEY_BAT_PIN				4
#define	KEY_BAT_PORT_PIN		P34

//#define	EAR_PORT			E_PORT0
//#define	EAR_PIN				E_PIN1

//#define	MUSIC_PORT				P3
//#define	MUSIC_PIN				6
//#define	MUSIC_PORT_PIN			P36

#define	SLEEP_PORT				P0
#define	SLEEP_PIN				4
#define	SLEEP_PORT_PIN			P04

#define	INT_PORT				P3
#define	INT_PIN					2
#define	INT_PORT_PIN			P32

#ifdef CLK_IRC
#define	SYS_TICK			1105920
#else
#define	SYS_TICK			600000
#endif

#define	SMS_INDEX_MAX	4						   



/*
*********************************************************************************
				宏定义
*********************************************************************************
*/

//
#define DTMF  			1
#define FSK	  			2 
//
#define NO_SIM			0
#define SIM_READY		1
#define SIM_PIN			2
#define SIM_PUK			3
#define SIM_UNKNOW		4
#define SIM_INVALID		5

//
#define FALSE			0
#define	TRUE			1
#define NULL			0


#define	LCD_WEIGHT		128
#define	LCD_HEIGHT		64
#define	LCD_PAGE		8
#define MAX_CALL_TIMES      10
#define MAX_CALL_STEP1		3
#define MAX_CALL_STEP2		6
#define MAX_CALL_STEP3		9

#define CNT_PER_SEC		20

#define VERSION		"0.29"

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned long int u32;

typedef enum
{
	STATE_NULL = 0,
	STATE_TEST,
	STATE_BATT_DISPLAY,
	STATE_SETTING,
	STATE_1ST_CALL,
	STATE_REGISTER_OK,
	STATE_GSM_STEADY,
	
	STATE_CALL_PROMPT,	// 呼叫前语音提示
	STATE_INCOMMING,	  // 来电
	STATE_ALERT,		    // 振铃
	STATE_ACTIVE,		    // 通话中
	STATE_NEXT_CALL,	  // 等待下一次呼叫

	STATE_STANDBY,
	STATE_BYE,
	STATE_POWERING_DOWN,	// 显示关机界面
}state_enum;

typedef enum
{
	SOCKSTATE_NULL = 0,
	SOCKSTATE_CONFIG,		
	SOCKSTATE_OPENNING,
	SOCKSTATE_OPENED,	
//	SOCKSTATE_CONNECTING,
	SOCKSTATE_CONNECT_OK,
	SOCKSTATE_CONNECT_FAIL,
	SOCKSTATE_SENDDING,
	SOCKSTATE_SEND,
	SOCKSTATE_CLOSING,
	SOCKSTATE_CLOSED,
	
}SockState_enum;

enum LEDMODE_ENUM
{
	LEDMODE_BLINK,
	LEDMODE_LIGHT,
	LEDMODE_DARK
};

enum TEST_ENUM
{
	TEST_NULL,
	TEST_VERSION,
	TEST_LOOP,
	//TEST_GPS,
	TEST_BATT,
	TEST_CSQ,
	TEST_GPS,
	//TEST_LOOP,	
};

enum
{
	LOG_EMPTY = 0,
	LOG_DIRTY,
	LOG_VALID
	
};

enum
{
	PHONE_NUM_BUSY = 0,
	PHONE_NUM_EMPTY,
	PHONE_NUM_READY
	
};


typedef enum 
{
#define __PIC_INFO(a,b,c,d) a,
#include "pic_info.h"
#undef __PIC_INFO	

	PIC_ID_NUM
} PicId_Enum; /* 图片id */

#endif
