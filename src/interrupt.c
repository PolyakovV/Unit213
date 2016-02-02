#include <stdio.h>
//#include "Driver\DrvUART.h"
//#include "Driver\DrvGPIO.h"
//#include "Driver\DrvSYS.h"
//#include "Driver\DrvADC.h"
#include "ext_var.h"
#include "misc.h"
#include "udp.h"


static uint8_t	Flag_LongKeyHelpPush=FALSE;
static uint8_t	Flag_LongKeyBattPush=FALSE;

static uint8_t	Flag_HelpKey_release=TRUE;
static uint8_t	Flag_BattKey_release=TRUE;

/*---------------------------------------------------------------------------------------------------------*/
/* UART Callback function                                                                           	   */
/*---------------------------------------------------------------------------------------------------------*/
void UART1_IRQHandler()
{
 	uint8_t i;
	uint32_t u32IntStatus;
		
	u32IntStatus = inpw(&UART1->ISR) ;
	
	if((u32IntStatus & UART_ISR_RDA_IF_Msk) || (u32IntStatus & UART_ISR_TOUT_IF_Msk) )
	{
		/* Get all the input characters */
		do
		{
			/* Get the character from UART Buffer */
			i = UART1->DATA;
			if( Flag_MsgDebug )
				UART0->DATA = i;
			
			udp_buff[udp_buff_index++] = i;
			udp_buff_index &= 0x3f;
				
			if(i >= 0x20)	//ÆÁµô\r¡¢\n
			{	
				//Flag_EndWithCr = 0;
				if(Count_SL >= MAX_SMS_LENGTH)
					Count_SL = 0;

				tc35data[Count_SL++] = i;
				tc35data[Count_SL] = 0;
			}
			else if(i=='\r')
			{	
				if(Count_SL != 0)
				{
					if( tc35data[Count_SL-1]=='2' 
						&& (Count_SL==1 || tc35data[Count_SL-2]=='\r') )
					{
						Flag_Incomming = 1;
					}
						
					tc35data[Count_SL++] = '\r';
					tc35data[Count_SL] = '\0';
					Flag_EndWithCr = 1;
					Flag_FindCr = 1;
					break;
				}	 	
			}			
		}while ((UART1->FSR & UART_FSR_RX_EMPTY_Msk) == 0);
	}
	else if(u32IntStatus & UART_ISR_BUF_ERR_IF_Msk)     /* Buffer Error INT */
    {
        _UART_CLEAR_BUFERR_INT_FLAG(UART1);
    }

}

void UART0_IRQHandler()
{
 	uint8_t i;
	uint32_t u32IntStatus;
	
	u32IntStatus = inpw(&UART0->ISR) ;
	if((u32IntStatus & UART_ISR_RDA_IF_Msk) || (u32IntStatus & UART_ISR_TOUT_IF_Msk) )
	{
		/* Get all the input characters */
		do
		{
			/* Get the character from UART Buffer */
			i = UART0->DATA;

			if(i >= 0x20)	//ÆÁµô\r¡¢\n
			{	
				//Flag_Custerm = 0;
				if(count_custerm >= 90)
					count_custerm = 0;

				Custerm_Set[count_custerm++] = i;
				Custerm_Set[count_custerm] = 0;
			}
			else if(i=='\r')
			{	
				if(count_custerm != 0)
				{
					Custerm_Set[count_custerm++] = '\r';
					Custerm_Set[count_custerm] = '\0';
					Flag_Custerm = 1;
					break;
				}	 	
			}			
		}while ((UART0->FSR & UART_FSR_RX_EMPTY_Msk) == 0);
			
	}
	else if(u32IntStatus & UART_ISR_BUF_ERR_IF_Msk)     /* Buffer Error INT */
    {
        _UART_CLEAR_BUFERR_INT_FLAG(UART0);
    }

}


void SysTick_Handler(void)
{ 
	if(dlyct1) dlyct1--;	//µ¥Î»£ºÎª50ºÁÃë
	if(dlyct2) dlyct2--;
	if(sdly) sdly--;

	if(TimerSignal) TimerSignal--;

	

	if(TimerWait) TimerWait--;

	switch( LedMode )
	{
	case LEDMODE_BLINK:
		TimerLed++;
		if( (TimerLed & 0x0f) == 0x0f )
			LED_PORT_PIN = !LED_PORT_PIN;
		break;

	case LEDMODE_LIGHT:
		if(TimerLed && (--TimerLed==0))
		{
			LED_PORT_PIN = LED_DARK;
			LedMode = LEDMODE_DARK;
		}
		break;
	}

	if(TimerBattery) TimerBattery--;		
	if(TimerSock) TimerSock--;
	if(TimerUdp) TimerUdp--;
	if(TimerPowerDown) TimerPowerDown--;
	///------------------------------
	if(TimerTestMode) TimerTestMode--;
	///------------------------------
	TimerSecond++;	
	
#if 1

	if( PressHelp() )
	{
		if( !Flag_LongKeyHelpPush )
		{
			++TimerKeyHelp;
			if( TimerKeyHelp > 30 )
			{
				Flag_LongKeyHelpPush = TRUE;
				TimerKeyHelp = 0;
				if( !PressBatter() )
					LongHelpKey = TRUE;
			}
			else if( TimerKeyHelp == 2 )
			{
				Flag_HelpKey_release = FALSE;
				HelpKey = TRUE;
			}
			else if( (TimerKeyHelp == 4) && (!PressBatter()) )
			{
				Flag_HelpKey_release = TRUE;
			}
		}
		else
		{
			TimerKeyHelp = 0;
		}
	}
	else
	{
		if( Flag_LongKeyHelpPush ) 
		{
			if( ++TimerKeyHelp > 2 )
			{
				Flag_LongKeyHelpPush = FALSE;
				TimerKeyHelp = 0;
				Flag_HelpKey_release = TRUE;
			}
		}
		else
		{
			TimerKeyHelp = 0;
		}
	}
	
	if( PressBatter() )
	{
		if( !Flag_LongKeyBattPush )
		{
			 ++TimerKeyrBatt;
			if( TimerKeyrBatt > 30 )
			{
				Flag_LongKeyBattPush = TRUE;
				TimerKeyrBatt = 0;
				LongBattKey = TRUE;
			}
			else if( TimerKeyrBatt == 2 )
			{
				Flag_BattKey_release = FALSE;
				BattKey = TRUE;
			}
			else if( (TimerKeyrBatt == 4) && (!PressHelp()) )
			{
				Flag_BattKey_release = TRUE;
			}
		}
		else
		{
			TimerKeyrBatt = 0;
		}
	}
	else
	{
		if( Flag_LongKeyBattPush ) 
		{
			if( ++TimerKeyrBatt > 2 )
			{
				Flag_LongKeyBattPush = FALSE;
				TimerKeyrBatt = 0;
				Flag_BattKey_release = TRUE;
			}
		}
		else
		{
			TimerKeyrBatt = 0;
		}
	}

	if(Flag_LongKeyBattPush && Flag_LongKeyHelpPush)
	{
		if( Flag_BattKey_release == FALSE )
			BattKey = FALSE;
		if( Flag_HelpKey_release == FALSE )
			HelpKey = FALSE;
		if( Flag_DisabeDoubleButton == FALSE && Flag_ModuleOn == TRUE)
		{
			Flag_Power_Down = TRUE;
			Flag_async_Power_Down = TRUE;
		}
	}

	if(Flag_HelpKey_release && Flag_BattKey_release)
		Flag_DisabeDoubleButton = FALSE;
#endif

}


/*---------------------------------------------------------------------------------------------------------*/
/* ADC interrupt handler                                                                                   */
/*---------------------------------------------------------------------------------------------------------*/
void ADC_IRQHandler(void)
{    
    if(ADC->ADSR & ADC_ADSR_ADF_Msk)
    {
		adc_result = _ADC_GET_CONVERSION_DATA(0);
  
        ADC->ADSR = ADC_ADSR_ADF_Msk;      /* clear the A/D conversion flag */
    }
    
    if(ADC->ADSR & ADC_ADSR_CMPF0_Msk)
    {
        _ADC_CLEAR_CMP0_INT_FLAG();     /* clear the A/D compare flag 0 */
    }
    
    if(ADC->ADSR & ADC_ADSR_CMPF1_Msk)
    {
        _ADC_CLEAR_CMP1_INT_FLAG();     /* clear the A/D compare flag 1 */
    }
}


// true °´¼ü´¥·¢
uint8_t GetKeyHelp(void)
{
#if 0
	if (!HelpKey && !DrvGPIO_GetBit(KEY_HELP_PORT, KEY_HELP_PIN))
	{
		delay_ms(3);
		HelpKey = !DrvGPIO_GetBit(KEY_HELP_PORT, KEY_HELP_PIN);
		return	HelpKey;
	}
	else if(HelpKey && DrvGPIO_GetBit(KEY_HELP_PORT, KEY_HELP_PIN))
	{
		delay_ms(3);
		HelpKey = !DrvGPIO_GetBit(KEY_HELP_PORT, KEY_HELP_PIN);
	}

	return 0;
#else
		uint8_t temp;
	
		if(HelpKey && Flag_HelpKey_release)
		{
			temp = TRUE;
			HelpKey = FALSE;	
		}
		else
			temp = FALSE;
		
		return temp;
	
#endif
}

uint8_t GetKeyBatt(void)
{
#if 0
	if (!BattKey && !DrvGPIO_GetBit(KEY_BAT_PORT, KEY_BAT_PIN))
	{
		delay_ms(3);
		BattKey = !DrvGPIO_GetBit(KEY_BAT_PORT, KEY_BAT_PIN);
		return	BattKey;
	}
	else if(BattKey && DrvGPIO_GetBit(KEY_BAT_PORT, KEY_BAT_PIN))
	{
		delay_ms(3);
		BattKey = !DrvGPIO_GetBit(KEY_BAT_PORT, KEY_BAT_PIN);
	}
	
	return 0;
#else
		uint8_t temp;
	
		if(BattKey && Flag_BattKey_release)
		{
			temp = TRUE;
			BattKey = FALSE;	
		}
		else
			temp = FALSE;
		
		return temp;
#endif
}

#if 0
void GPIOP2P3P4_IRQHandler(void)
{
    /* To check if P3.2 interrupt occurred */
    if (INT_PORT->ISRC & GPIO_ISRC_ISRC2)
    {
    	ModemSleep(FALSE);
        INT_PORT->ISRC = GPIO_ISRC_ISRC2;
    }
	else
    {
        /* Un-expected interrupt. Just clear all Pinterrupts */
        P2->ISRC = P2->ISRC;
    	P3->ISRC = P3->ISRC;
    	P4->ISRC = P4->ISRC;
    }
}
#endif

