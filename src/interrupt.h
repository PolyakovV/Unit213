#ifndef __INTERRUPT_H__
#define	__INTERRUPT_H__

void Module_Uart_Handler(uint32_t u32IntStatus);
void Debug_Uart_Handler(uint32_t u32IntStatus);
void SysTick_Handler(void);
uint8_t GetKeyHelp(void);
uint8_t GetKeyBatt(void);

#endif

