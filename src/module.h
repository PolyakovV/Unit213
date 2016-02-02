#ifndef __MODULE_H__
#define	 __MODULE_H__

#define	HANDSET		1
#define SPEAKER		3
#define PCM			4

void ResetUartFlag(void);

void SendAtCommand(uint8_t *atcmd);

void SendData(uint8_t *cmd, uint8_t length); 
void SendAtWaitRsq(u8 delay, u8 retry, u8 reset, char *fmt, ...);

uint8_t SendAtCmdRsq(char *string, char *rsp);

void module_WaitResponse(uint8_t time);
uint8_t CheckTc35Respond(uint8_t * respond, uint16_t offset);

void module_PowerOn(void);

void module_Register(void);

uint8_t Module_CheckRegister(void);

void ModemVolumeInit(void);
void ModemAudioInit(void);
void ModemNetworkInit(void);
void HuangupCall(void);

void HuangupAllCall(void);

uint8_t GetSimPinStatus(void);

uint8_t strsearch(uint8_t *ptr,uint8_t *ptr2);

uint8_t signal_quality(void);
void GpsStart(void);
void GpsStop(void);
void GpsStart_2(void);
uint8_t AnswerCall(void);
uint8_t GetModuleIMEI(unsigned char * imei, uint8_t length);
uint8_t GetIccid(char *iccid, uint8_t length);
void sendDtmf(uint8_t dtmf);
uint8_t ActiveSimLock(uint8_t *pin, uint8_t *newPin);
uint8_t GetSimCardId(uint8_t *id);
void WitchModoule(void);
void DownLinkOn(uint8_t on);
void SwitchVoiceChannel(uint8_t ch);
void AdjustVolume(uint8_t volume);
uint8_t LockPinCode(uint8_t lock, uint8_t *pin);
uint8_t ChgPinCode(uint8_t *oldPin, uint8_t *newPin);
uint8_t Communication(uint8_t max);
void MoudleWait(uint8_t ms);
void SendAtCommand2(uint8_t * atcmd, u8 index);
u8	WaitRsp(u8 ms, char *rsq);
void AccountGet(void);
u8 PhoneNumberSet(char * ph);

#endif



















