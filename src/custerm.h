#ifndef __CUSTERM_H__
#define	__CUSTERM_H__

typedef void (* CustermFunc)(char *param);

typedef struct 
{
	char			*cmdName;
	CustermFunc 	func;
} Custerm_Item;

typedef struct 
{
	union 
    {
        uint32_t	params[79];  ///--- 76
        
		struct 
		{
			uint8_t	apn[40];
			uint8_t	apn2[40];
			uint8_t	user_pw[40];
			uint8_t	user_pw2[40];
			uint8_t	phone1[16];
			uint8_t	phone2[16];
			uint8_t	server1[24];
			uint8_t	server2[24];
			uint8_t	local_port[8];
			//uint8_t fibro[6];
			//char sia[12];
			uint16_t delay;
	///-----------------------------My Added strings----------------///
	uint16_t battLowLev;
	uint16_t battEmptyLev;
	uint16_t battReplaceLev;
	uint16_t battDischargeLev;
	uint8_t  lockState;
	
	///-------------------------------------------------------------///
			uint8_t	debug;	
			uint8_t	agps;	// 0: gps, 1: user plane, 2: control plane
			uint8_t	gps_url[24];
			
			uint8_t pin_origin[10];
			uint8_t pin_use[10];

			char sms_pw[5];
			
			uint8_t reserve[3];	
     			

	

		} param;
    };
	
} CustermParam;

extern CustermParam custermParam;
extern u8	gLogPowerDownExpect;

void Custerm_Apn(char *param);
void Custerm_Apn2(char *param);
void Custerm_Ip1(char *param);
void Custerm_Ip2(char *param);
void Custerm_Url(char *param);

void Custerm_Phone1(char *param);
void Custerm_Phone2(char *param);
void Custerm_LocalPort(char *param);
void Custerm_Default(char *param);
void Custerm_Delay(char *param);
void Custerm_Fibro(char *param);
void Custerm_Sia(char *param);
void Custerm_Imei(char * param);
void Cutterm_Iccid(char * param);
void Custerm_Debug(char *param);
void Custerm_Agps(char *param);
void Custerm_Version(char *param);
void Custerm_UserPw(char *param);
void Custerm_UserPw2(char *param);
void Custerm_SmsPw(char *param);
void Custerm_Csq(char *param);
void Custerm_Log(char *param);
void Custerm_GpsInfo(char *param);
void Custerm_Call(char *param);
void Custerm_End(char *param);
void Custerm_LogClean(char *param);
void Custerm_Bat(char *param);
///-----------------------------My Added strings----------------///
void Custerm_BattLowLev      (char *param);
void Custerm_BattEmptyLev    (char *param);
void Custerm_BattReplaceLev  (char *param);
void Custerm_BattDischargeLev(char *param);

///-------------------------------------------------------------///

uint8_t CustermHandle(char *param);
void NvInit(void);
uint8_t ReadLog(char *buf);
void WriteLog(char *buf);
void LogInit(void);
void LogOnOff(u8 off);

#endif

