#ifndef __UDP_H__
#define	__UDP_H__

#include "lib.h"

#define	UDP_TRY_MAX				3	// 重发3次，共4次
#define	UDP_INIT_TRY_MAX		5	// 重发5次，共6次

#define	UDP_DELAY		100	// 5 S

#define	UDP_BUFF_MAX	64

typedef struct
{
	uint8_t valid;
	uint8_t	tryTime;
	uint8_t	dataLen;
	uint8_t	packetData[80];
}Packet;

extern uint8_t	udp_recv[50];
extern uint8_t	udp_recv_length;
extern uint8_t	Flag_RecvUdp ;

extern uint8_t	udp_buff[UDP_BUFF_MAX];
extern uint8_t	udp_buff_index;
extern uint8_t	Flag_TxInitOk;

void UdpHandle(void);
void ClientInit(void);
void SIAEventPacketCreate(uint8_t gps, uint8_t lowBat, uint8_t shutdown);
void UdpSend(void);
void UdpPacketInit(void);
void udpTest(void);
void udpParamInit(void);
void ResendGpsSig(void);
uint8_t GetGpsSig(void);
u8 AddVoltageInfo(char *event);

#endif
