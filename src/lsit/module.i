#line 1 "module.c"
#line 1 "ext_var.h"



#line 1 "lib.h"




#line 1 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdint.h"
 
 





 










#line 26 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdint.h"







 

     

     
typedef   signed          char int8_t;
typedef   signed short     int int16_t;
typedef   signed           int int32_t;
typedef   signed       __int64 int64_t;

     
typedef unsigned          char uint8_t;
typedef unsigned short     int uint16_t;
typedef unsigned           int uint32_t;
typedef unsigned       __int64 uint64_t;

     

     
     
typedef   signed          char int_least8_t;
typedef   signed short     int int_least16_t;
typedef   signed           int int_least32_t;
typedef   signed       __int64 int_least64_t;

     
typedef unsigned          char uint_least8_t;
typedef unsigned short     int uint_least16_t;
typedef unsigned           int uint_least32_t;
typedef unsigned       __int64 uint_least64_t;

     

     
typedef   signed           int int_fast8_t;
typedef   signed           int int_fast16_t;
typedef   signed           int int_fast32_t;
typedef   signed       __int64 int_fast64_t;

     
typedef unsigned           int uint_fast8_t;
typedef unsigned           int uint_fast16_t;
typedef unsigned           int uint_fast32_t;
typedef unsigned       __int64 uint_fast64_t;

     
typedef   signed           int intptr_t;
typedef unsigned           int uintptr_t;

     
typedef   signed       __int64 intmax_t;
typedef unsigned       __int64 uintmax_t;




     

     





     





     





     

     





     





     





     

     





     





     





     

     


     


     


     

     


     


     


     

     



     



     


     
    
 



#line 197 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdint.h"

     







     










     











#line 261 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdint.h"



 



#line 6 "lib.h"
#line 1 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\M051Series.h"
 









 


                 





 
 


 
typedef enum IRQn
{
 
  NonMaskableInt_IRQn       = -14,       
  HardFault_IRQn            = -13,       
  SVCall_IRQn               = -5,        
  PendSV_IRQn               = -2,        
  SysTick_IRQn              = -1,        

 
  BOD_IRQn                  = 0,         
  WDT_IRQn                  = 1,         
  EINT0_IRQn                = 2,         
  EINT1_IRQn                = 3,         
  GPIO_P0P1_IRQn            = 4,         
  GPIO_P2P3P4_IRQn          = 5,         
  PWMA_IRQn                 = 6,         
  PWMB_IRQn                 = 7,         
  TMR0_IRQn                 = 8,         
  TMR1_IRQn                 = 9,         
  TMR2_IRQn                 = 10,        
  TMR3_IRQn                 = 11,        
  UART0_IRQn                = 12,        
  UART1_IRQn                = 13,        
  SPI0_IRQn                 = 14,        
  SPI1_IRQn                 = 15,        
  I2C0_IRQn                 = 18,        
  I2C1_IRQn                 = 19,        
  ACMP0_IRQn                = 25,        
  ACMP1_IRQn                = 26,        
  PWRWU_IRQn                = 28,        
  ADC_IRQn                  = 29         
           
} IRQn_Type;






 

 





#line 1 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\CoreSupport\\core_cm0.h"
 




















 











 








 











#line 56 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\CoreSupport\\core_cm0.h"

















 

#line 82 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\CoreSupport\\core_cm0.h"





 


 





 
typedef struct
{
  volatile uint32_t ISER[1];                       
       uint32_t RESERVED0[31];
  volatile uint32_t ICER[1];                       
       uint32_t RSERVED1[31];
  volatile uint32_t ISPR[1];                       
       uint32_t RESERVED2[31];
  volatile uint32_t ICPR[1];                       
       uint32_t RESERVED3[31];
       uint32_t RESERVED4[64];
  volatile uint32_t IPR[8];                        
}  NVIC_Type;
   





 
typedef struct
{
  volatile const  uint32_t CPUID;                         
  volatile uint32_t ICSR;                          
       uint32_t RESERVED0;                                      
  volatile uint32_t AIRCR;                         
  volatile uint32_t SCR;                           
  volatile uint32_t CCR;                           
       uint32_t RESERVED1;                                      
  volatile uint32_t SHP[2];                        
  volatile uint32_t SHCSR;                         
       uint32_t RESERVED2[2];                                   
  volatile uint32_t DFSR;                          
} SCB_Type;                                                

 















 



























 















 









 






 



 














   





 
typedef struct
{
  volatile uint32_t CTRL;                          
  volatile uint32_t LOAD;                          
  volatile uint32_t VAL;                           
  volatile const  uint32_t CALIB;                         
} SysTick_Type;

 












 



 



 








   





 
typedef struct
{
  volatile uint32_t DHCSR;                         
  volatile  uint32_t DCRSR;                         
  volatile uint32_t DCRDR;                         
  volatile uint32_t DEMCR;                         
} CoreDebug_Type;

 

































 






 








   


 











   




 





#line 377 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\CoreSupport\\core_cm0.h"


 


 




#line 395 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\CoreSupport\\core_cm0.h"


 
 








 
extern uint32_t __get_PSP(void);








 
extern void __set_PSP(uint32_t topOfProcStack);








 
extern uint32_t __get_MSP(void);








 
extern void __set_MSP(uint32_t topOfMainStack);








 
extern uint32_t __REV16(uint16_t value);








 
extern int32_t __REVSH(int16_t value);


#line 500 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\CoreSupport\\core_cm0.h"








 
static __inline uint32_t __get_PRIMASK(void)
{
  register uint32_t __regPriMask         __asm("primask");
  return(__regPriMask);
}







 
static __inline void __set_PRIMASK(uint32_t priMask)
{
  register uint32_t __regPriMask         __asm("primask");
  __regPriMask = (priMask);
}







 
static __inline uint32_t __get_CONTROL(void)
{
  register uint32_t __regControl         __asm("control");
  return(__regControl);
}







 
static __inline void __set_CONTROL(uint32_t control)
{
  register uint32_t __regControl         __asm("control");
  __regControl = control;
}





#line 770 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\CoreSupport\\core_cm0.h"







 
 

 

 
 












 
static __inline void NVIC_EnableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ISER[0] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}








 
static __inline void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ICER[0] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}









 
static __inline uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  return((uint32_t) ((((NVIC_Type *) ((0xE000E000) + 0x0100))->ISPR[0] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));  
}








 
static __inline void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ISPR[0] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}








 
static __inline void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ICPR[0] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}












 
static __inline void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if(IRQn < 0) {
    ((SCB_Type *) ((0xE000E000) + 0x0D00))->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] = (((SCB_Type *) ((0xE000E000) + 0x0D00))->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] & ~(0xFF << ( (((uint32_t)(IRQn) ) & 0x03) * 8 ))) | 
        (((priority << (8 - 2)) & 0xFF) << ( (((uint32_t)(IRQn) ) & 0x03) * 8 )); }
  else {
    ((NVIC_Type *) ((0xE000E000) + 0x0100))->IPR[( ((uint32_t)(IRQn) >> 2) )] = (((NVIC_Type *) ((0xE000E000) + 0x0100))->IPR[( ((uint32_t)(IRQn) >> 2) )] & ~(0xFF << ( (((uint32_t)(IRQn) ) & 0x03) * 8 ))) |
        (((priority << (8 - 2)) & 0xFF) << ( (((uint32_t)(IRQn) ) & 0x03) * 8 )); }
}















 
static __inline uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

  if(IRQn < 0) {
    return((uint32_t)((((SCB_Type *) ((0xE000E000) + 0x0D00))->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] >> ( (((uint32_t)(IRQn) ) & 0x03) * 8 ) ) >> (8 - 2)));  }  
  else {
    return((uint32_t)((((NVIC_Type *) ((0xE000E000) + 0x0100))->IPR[( ((uint32_t)(IRQn) >> 2) )] >> ( (((uint32_t)(IRQn) ) & 0x03) * 8 ) ) >> (8 - 2)));  }  
}



 












 
static __inline uint32_t SysTick_Config(uint32_t ticks)
{ 
  if (ticks > (0xFFFFFFul << 0))  return (1);             
                                                               
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->LOAD  = (ticks & (0xFFFFFFul << 0)) - 1;       
  NVIC_SetPriority (SysTick_IRQn, (1<<2) - 1);   
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->VAL   = 0;                                           
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->CTRL  = (1ul << 2) | 
                   (1ul << 1)   | 
                   (1ul << 0);                     
  return (0);                                                   
}




static __inline void SysTick_EnableInt()
{
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->CTRL  = ((SysTick_Type *) ((0xE000E000) + 0x0010))->CTRL | (1ul << 1);     
}

static __inline void SysTick_DisableInt()
{
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->CTRL  = ((SysTick_Type *) ((0xE000E000) + 0x0010))->CTRL & (~(1ul << 1));  
}

 





 
static __inline void NVIC_SystemReset(void)
{
  ((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR  = ((0x5FA << 16)      | 
                 (1ul << 2));
  __dsb(0);                                                                                            
  while(1);                                                                             
}

   





   



 
#line 74 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\M051Series.h"
#line 1 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\system_M051Series.h"
 









 







 
 
 











 




 





extern uint32_t SystemCoreClock;     
extern uint32_t CyclesPerUs;         
extern uint32_t PllClock;            

#line 65 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\system_M051Series.h"












 
extern void SystemInit(void);











 
extern void SystemCoreClockUpdate (void);







#line 75 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\M051Series.h"



#pragma anon_unions











 
extern void SystemInit (void);                


 
 
 



 


 



 
typedef struct
{
    






















































     
    volatile uint32_t  PMD;                         

    









     
    volatile uint32_t  OFFD;                        

    














































     
    volatile uint32_t  DOUT;                        

    






















































     
    volatile uint32_t  DMASK;                       

    






















     
    volatile uint32_t  PIN;                         

    














































































     
    volatile uint32_t  DBEN;                        

    






















































































     
    volatile uint32_t  IMD;                         

    






















































































































































     
    volatile uint32_t  IEN;                         

    






























































     
    volatile uint32_t  ISRC;                        
} GPIO_T;                                  
                                                
typedef struct                                  
{                                               
    

































     
    volatile uint32_t  DBNCECON;                    
} GPIO_DBNCECON_T;

 
























 



                                            



 



 



 



 



 






 



 








   


 




 
typedef struct
{
                                
    union {                             
    volatile uint32_t DATA;                 

    










     
    volatile uint32_t THR;                  

    








     
    volatile uint32_t RBR;                  
    };

    









































     
    volatile uint32_t IER;                  

    



































     
    volatile uint32_t FCR;                  

    





























     
    volatile uint32_t LCR;                  

    

















     
    volatile uint32_t MCR;                  

    
















     
    volatile uint32_t MSR;                  

    





























































     
    volatile uint32_t FSR;                  

    















































     
    volatile uint32_t ISR;                  

    














     
    volatile uint32_t TOR;                  

    





















     
    volatile uint32_t BAUD;                 

    


















     
    volatile uint32_t IRCR;                 

    


























     
    volatile uint32_t ALT_CSR;               

    











     
    volatile uint32_t FUNSEL;               
} UART_T;




 



 



 

































 















 


















 










 










 







































 























           



















 






 












 









 

























 



   


 



 
typedef struct
{
    

















































     
    volatile uint32_t  TCSR;                

    














     
    volatile uint32_t  TCMPR;		        

    










     
    volatile uint32_t  TISR;		        

    









     
    volatile uint32_t  TDR;			        

    




     
    volatile uint32_t  TCAP;		        

    




     
    volatile uint32_t  TEXCON;	            

    




     
    volatile uint32_t  TEXISR;	            
} TIMER_T;

 








                                                                                 

































 



 






 



 



 





















 


   


 



 
typedef struct
{
    















































     
    volatile uint32_t  WTCR;                 

    




     
    volatile uint32_t  WTCRALT;              
} WDT_T;

 






























 


   


 



 
typedef struct
{
    




     
    volatile uint32_t  WWDTRLD;

    




     
    volatile uint32_t  WWDTCR;

    




     
    volatile uint32_t  WWDTSR;

    




     
    volatile uint32_t  WWDTCVR;

} WWDT_T;

 



 















 






 


   


 



 
typedef struct
{
    























































































     
    volatile uint32_t CNTRL;

    



















     
    volatile uint32_t DIVIDER;

    



































     
    volatile uint32_t SSR;

    




     
    volatile const  uint32_t RESERVE0;

    












     
    volatile const  uint32_t RX[2];

    




     
    volatile const  uint32_t RESERVE1;

    




     
    volatile const  uint32_t RESERVE2;

    













     
    volatile  uint32_t TX[2];

    




     
    volatile const  uint32_t RESERVE3;

    




     
    volatile const  uint32_t RESERVE4;

    




     
    volatile const  uint32_t RESERVE5;

    











     
    volatile uint32_t VARCLK;

    




     
    volatile const  uint32_t RESERVE6;

    




     
    volatile uint32_t CNTRL2;

    




     
    volatile uint32_t FIFO_CTL;

    




     
    volatile uint32_t STATUS;

} SPI_T;


 






















































 






 















 



























 
























 



































   


 




 
typedef struct
{
    
































     
    volatile uint32_t I2CON;

    













     
    volatile uint32_t I2CADDR0;

    








     
    volatile uint32_t I2CDAT;

    

















     
    volatile const  uint32_t I2CSTATUS;

    








     
    volatile uint32_t I2CLK;

    


















     
    volatile uint32_t I2CTOC;

    













     
    volatile uint32_t I2CADDR1;

    













     
    volatile uint32_t I2CADDR2;

    













     
    volatile uint32_t I2CADDR3;

    














     
    volatile uint32_t I2CADM0;

    














     
    volatile uint32_t I2CADM1;

    














     
    volatile uint32_t I2CADM2;

    














     
    volatile uint32_t I2CADM3;

    




     
    uint32_t RESERVED0[2];

    




     
    volatile uint32_t I2CWKUPCON;

    




     
    volatile uint32_t I2CWKUPSTS;

} I2C_T;

 


















 






 



 



 



 









 



 



 




   

 



 
typedef struct
{
    



















     
    volatile const uint32_t ADDR[8];

    



























































     
    volatile uint32_t ADCR;

    



































     
    volatile uint32_t ADCHER;

    












































     
    volatile uint32_t ADCMPR[2];

    








































     
    volatile uint32_t ADSR;

    

















     
    volatile uint32_t ADCALR;
    
} ADC_T;


 









 



























 






 


















 





















 





   


 



 
typedef struct
{
    




     
        volatile uint32_t CMPCR[2];

    




     
        volatile uint32_t CMPSR;

} ACMP_T;


 












 











   


 




 
                                                              
typedef struct
{
    



















































     
    volatile uint32_t PWRCON;

    












     
    volatile uint32_t AHBCLK;

    

























































     
    volatile uint32_t APBCLK;

    






















     
    volatile uint32_t CLKSTATUS;

    




























     
    volatile uint32_t CLKSEL0;

    



















































     
    volatile uint32_t CLKSEL1;

    












     
    volatile uint32_t CLKDIV;

    




















     
    volatile uint32_t CLKSEL2;

    






















     
    volatile uint32_t PLLCON;

    














     
    volatile uint32_t FRQDIV;

} SYSCLK_T;

 




























 






 






















































                                                






 



















 






 

































 












 









 





















 





   

 




 
typedef struct
{
    








 
    volatile const  uint32_t PDID;                 
    
    




































     
    volatile uint32_t RSTSRC;

    
































     
    volatile uint32_t IPRSTC1;

    













































     
    volatile uint32_t IPRSTC2;

    




     
    uint32_t RESERVED0[2];

    



















































     
    volatile uint32_t BODCR;

    




     
    volatile uint32_t TEMPCR;

    




     
    uint32_t RESERVED1;

    

















     
    volatile uint32_t PORCR;

    




     
    uint32_t RESERVED2[2];

    




































































     
    volatile uint32_t P0_MFP;

    




































































     
    volatile uint32_t P1_MFP;

    




































































     
    volatile uint32_t P2_MFP;

    
































































     
    volatile uint32_t P3_MFP;

    




























































     
    volatile uint32_t P4_MFP;

    




     
    uint32_t RESERVED3[47];

    


























     
    volatile uint32_t REGWRPROT;

} GCR_T;

 





















 









 




















































 





















 



 



 












 









 









 









 









 






   





 
typedef struct
{
    




     
    volatile const  uint32_t IRQSRC[32];

    




     
    volatile uint32_t NMISEL;

    




     
    volatile uint32_t MCUIRQ;

} GCR_INT_T;

 





   

 




 
typedef struct
{
    





















































     
    volatile uint32_t ISPCON;

    









     
    volatile uint32_t ISPADR;

    









     
    volatile uint32_t ISPDAT;

    












     
    volatile uint32_t ISPCMD;

    











     
    volatile uint32_t ISPTRG;

    













     
    volatile const  uint32_t DFBADR;

    

























     
    volatile uint32_t FATCON;

} FMC_T;

 














                                                                                        



 









 



 








   

 




 
typedef struct
{
    






















     
    volatile uint32_t PPR;

    























     
    volatile uint32_t CSR;

    








































































     
    volatile uint32_t PCR;

    























     
    volatile uint32_t CNR0;

    























     
    volatile uint32_t CMR0;

    









     
    volatile const  uint32_t PDR0;

    























     
    volatile uint32_t CNR1;

    























     
    volatile uint32_t CMR1;

    









     
    volatile const  uint32_t PDR1;

    























     
    volatile uint32_t CNR2;

    























     
    volatile uint32_t CMR2;

    









     
    volatile const  uint32_t PDR2;

    























     
    volatile uint32_t CNR3;

    























     
    volatile uint32_t CMR3;

    









     
    volatile const  uint32_t PDR3;

    




     
    volatile const uint32_t RESERVE0;

    


















     
    volatile uint32_t PIER;

    


















     
    volatile uint32_t PIIR;

    




     
    volatile const uint32_t    RESERVE1[2];

    




























































































     
    volatile uint32_t CCR0;

    




























































































     
    volatile uint32_t CCR2;

    








     
    volatile uint32_t CRLR0;

    








     
    volatile uint32_t CFLR0;

    








     
    volatile uint32_t CRLR1;

    








     
    volatile uint32_t CFLR1;

    








     
    volatile uint32_t CRLR2;

    








     
    volatile uint32_t CFLR2;

    








     
    volatile uint32_t CRLR3;

    








     
    volatile uint32_t CFLR3;

    






















     
    volatile uint32_t CAPENR;

    






















     
    volatile uint32_t POE;

    




     
    volatile uint32_t TCON;

    




     
    volatile uint32_t TSTATUS;

    




     
    volatile const  uint32_t  RESERVE2[4];

    




     
    volatile uint32_t PSCR;
        
} PWM_T;

 












 












 




























































 



 



 




 




































 
























 










































 










































 



 



 












 












 















































   


 



 
typedef struct
{
    




























     
    volatile uint32_t EBICON;

    



















     
    volatile uint32_t EXTIME;

} EBI_T;

 












 











   


 
 
 



 
 






 
#line 6001 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\M051Series.h"







































   

 
 
  




 
#line 6056 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\M051Series.h"





































   

   



typedef volatile unsigned char  vu8;
typedef volatile unsigned long  vu32;
typedef volatile unsigned short vu16;




#line 6112 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\M051Series.h"

#line 6119 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\M051Series.h"













 
#line 6165 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\M051Series.h"


 











 
 
  
#line 1 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\SYS.h"
 









 



#line 1 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\M051Series.h"
 









 
#line 6194 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\M051Series.h"
                                                                                                 

#line 16 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\SYS.h"




 



 


 
 
 





 




#line 49 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\SYS.h"








 
 
 
#line 68 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\SYS.h"


 
 
 
#line 101 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\SYS.h"


 
 
 
#line 115 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\SYS.h"

       
 
 
 





 
 
 









        





        





        





        




        




        




        




        





        





        




        




        





        





        




        




        




        




        




        




        




        




        





        











































































        





 
 
 






 
 
 
#line 359 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\SYS.h"

#line 368 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\SYS.h"

#line 377 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\SYS.h"

#line 386 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\SYS.h"

#line 395 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\SYS.h"


 
 
 









 
static __inline uint32_t DrvSYS_GetPLLClockFreq(void)
{
    uint32_t u32PllFreq;
    uint32_t u32FIN, u32NF, u32NR, u32NO;
    uint8_t au8NoTbl[4] = {1, 2, 2, 4};  
    uint32_t u32Reg;

    u32PllFreq = 0;
    u32Reg = ((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->PLLCON;
    if((u32Reg & ((1ul << 16) | (1ul << 18))) == 0)
    {    
         

        u32FIN = (u32Reg & (1ul << 19))?(22118400UL):(12000000UL);
        if(u32Reg & (1ul << 17))
        {
             
            u32PllFreq = u32FIN;
        }
        else 
        {
             
            u32NO = au8NoTbl[((u32Reg & (3ul << 14)) >> 14)];
            u32NF  = ((u32Reg & (0x1FFul << 0)) >> 0) + 2;
            u32NR  = ((u32Reg & (0x1Ful << 9)) >> 9) + 2;
             
            u32PllFreq = (((u32FIN >> 2) * u32NF) / (u32NR * u32NO) << 2); 
        }
    }

    return u32PllFreq;
}















 
static __inline void SYS_WaitingForClockReady(uint32_t u32Mask)
{
    int32_t i32TimeOutCnt;

    i32TimeOutCnt = (50000000UL) / 200;  
    
    while((((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKSTATUS & u32Mask) != u32Mask)
    {
        if(i32TimeOutCnt-- <= 0)
            break;    
    }
}











 
static __inline void SYS_SysTickDelay(uint32_t us)
{
    ((SysTick_Type *) ((0xE000E000) + 0x0010))->LOAD = us * CyclesPerUs;
    ((SysTick_Type *) ((0xE000E000) + 0x0010))->VAL  =  (0x00);
    ((SysTick_Type *) ((0xE000E000) + 0x0010))->CTRL = (1ul << 2) | (1ul << 0);

     
    while((((SysTick_Type *) ((0xE000E000) + 0x0010))->CTRL & (1ul << 16)) == 0);
}
















 
static __inline void SYS_EnableCKO(uint32_t u32ClkSrc, uint32_t u32ClkDiv)
{
     
    ((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->FRQDIV = (1ul << 4) | u32ClkDiv;

     
    ((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->APBCLK |= (1ul << 6);

     
    ((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKSEL2 = (((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKSEL2 & (~(3ul << 2))) | u32ClkSrc;
}









 
static __inline void SYS_DisableCKO(void)
{
     
    ((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->APBCLK &= (~(1ul << 6));
}








 
static __inline void SYS_PowerDownInit(void)
{   
    ((SCB_Type *) ((0xE000E000) + 0x0D00))->SCR = (1ul << 2);
    ((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->PWRCON |= ((1ul << 8) | (1ul << 7) | (1ul << 6));
}







 
static __inline void SYS_UnlockReg(void)
{   
    ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->REGWRPROT = 0x59;
    ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->REGWRPROT = 0x16;
    ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->REGWRPROT = 0x88;
}






 
static __inline void SYS_LockReg(void)
{   
    ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->REGWRPROT = 0;
}


  



  




#line 6183 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\M051Series.h"
#line 1 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\ADC.h"
 









 




 
 
 
#line 20 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\ADC.h"



 



 



 
 
 
























 
 
 




 
 
 







 
 
 





 
 
 





 
 
 



 
 
 





 
 
 



 




 




 




 




 




 




 




 













 













 









 









 













 










 











 











 




 




 




 




 




 




 




 




 




 













 


















 






















 















 










 










 












 




 




 




 




 
__inline void ADC_ResetIP()
{
    ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->IPRSTC2 |= (1<<28) ;
    ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->IPRSTC2 &= ~(1<<(28)) ;
} 



 




 












 
static __inline uint32_t ADC_GetConversionRate_M05xxxAN()
{
    uint32_t u32AdcClkSrcSel;
    uint32_t u32ClkTbl[4] = {(12000000UL), 0, 0, (22118400UL)};    
    
    u32ClkTbl[1] = PllClock;
    u32AdcClkSrcSel = ((((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKSEL1 & (3ul << 2)) >> 2);
    return   ((u32ClkTbl[u32AdcClkSrcSel]) / (((((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKDIV & (0xFFul << 16))>>16)+ 1) / 27);
}











 
static __inline uint32_t ADC_GetConversionRate_M05xxxBN()
{
    uint32_t u32AdcClkSrcSel;
    uint32_t u32ClkTbl[4] = {(12000000UL), 0, 0, (22118400UL)};    
    
    u32ClkTbl[1] = PllClock;
    u32ClkTbl[2] = SystemCoreClock;
    u32AdcClkSrcSel = ((((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKSEL1 & (3ul << 2)) >> 2);
    return   ((u32ClkTbl[u32AdcClkSrcSel]) / (((((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKDIV & (0xFFul << 16))>>16)+ 1) / 21);
}



 




 




 




 




 




 




 




 





 
 
 


 




 




 




  



  


#line 6184 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\M051Series.h"
#line 1 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\EBI.h"
 









 



#line 16 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\EBI.h"



 



 


 
 
 




 
 
 
#line 43 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\EBI.h"


 
 
 






 
 
 


              





              





              





              





              





              





              





              





              





              





              





              





              





              





              





              




  



  




#line 6185 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\M051Series.h"
#line 1 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\FMC.h"
 









 



#line 16 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\FMC.h"




 



 


 
 
 







 
 
 



 
 
 





 
 
 
#line 64 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\FMC.h"




 
 
 













 
static __inline void FMC_Write(uint32_t u32addr, uint32_t u32data)
{
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x21;
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = u32addr;
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPDAT = u32data;
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = 0x1;  
    __isb(0);
    while (((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG);
}














 
static __inline uint32_t FMC_Read(uint32_t u32addr)
{ 
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x00;
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = u32addr;
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPDAT = 0;
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = 0x1;
    __isb(0);
    while (((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG);
    
    return ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPDAT;
}














 
static __inline void FMC_Erase(uint32_t u32addr)
{
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x22;
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = u32addr;
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = 0x1;
    __isb(0);
    while (((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG);
}














 
static __inline uint32_t FMC_ReadUID(uint8_t u8index)
{ 
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCMD = 0x04;
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPADR = (u8index << 2);
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPDAT = 0;
    ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG = 0x1;
    __isb(0);
    while (((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPTRG);
    
    return ((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPDAT;
}



  



  





#line 6186 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\M051Series.h"
#line 1 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\GPIO.h"
 









 



#line 16 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\GPIO.h"




 



 
















 
#line 83 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\GPIO.h"


 
 
 






#line 126 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\GPIO.h"
                                            

 
 
 



                                                        
#line 151 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\GPIO.h"

                                    
 
 
 



#line 167 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\GPIO.h"
                                    
#line 176 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\GPIO.h"


 
 
 
#line 189 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\GPIO.h"


 
 
 






#line 216 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\GPIO.h"


 
 
 



 
 
 



 
 
 



 
 
 







 
 
 










 












 












 












 












 




















 













 












 



 
 
 











 
static __inline void GPIO_EnableInt(GPIO_T *PORT, uint32_t u32Pin, uint32_t u32IntAttribs)
{
    PORT->IMD |= (((u32IntAttribs & (0xFF000000)) >> 24) << u32Pin);
    PORT->IEN |= ((u32IntAttribs & 0xFFFFFFUL) << u32Pin);
}











 
static __inline void GPIO_DisableInt(GPIO_T *PORT, uint32_t u32Pin)
{
    PORT->IMD &= ~((0x00000001) << u32Pin);
    PORT->IEN &= ~((0x00010001UL) << u32Pin);
}




  



  


#line 6187 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\M051Series.h"
#line 1 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\I2C.h"
 









 



#line 16 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\I2C.h"




 



 



 
 
 
#line 41 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\I2C.h"


 
 
 



 
 
 









 










 










 











 










 










 


























 










 











 











 











 











 












 











 











 











 
















 
static __inline uint8_t I2C_ReadAck(I2C_T *port)
{
    (port)->I2CDAT= 0xFF;
    (port)->I2CON = (1ul << 6) | (1ul << 3) | (1ul << 2);
    while(((port)->I2CON & (1ul << 3)) == 0);
    return (port)->I2CDAT;
}









 
static __inline uint8_t I2C_ReadNak(I2C_T *port)
{
    (port)->I2CDAT= 0xFF;
    (port)->I2CON = (1ul << 6) | (1ul << 3);
    while(((port)->I2CON & (1ul << 3)) == 0);
    return (port)->I2CDAT;
}















 
static __inline void I2C_SetBusClockFreq(I2C_T * tI2C, uint32_t u32BusClock)
{
    uint32_t u32divider;     
 
    u32divider = (uint32_t) (((SystemCoreClock * 10)/(u32BusClock * 4) + 5) / 10 - 1);
                        
    tI2C->I2CLK = (u32divider & ~0xFF)? 0xFF:((u32divider & ~0x03)? u32divider: 4);
}



  



  




#line 6188 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\M051Series.h"
#line 1 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\PWM.h"
 










 



 
 
 

#line 21 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\PWM.h"




 



 



 
 
 

 
 
 





 
 
 











 
 
 
#line 80 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\PWM.h"

 
 
 





 
 
 




















 
 
 





 
 
 





 
 
 




























 


























 

























 



























 



























 


























 




















 




















 




















 



















 























 




























 





















 




















 

























 






















 






















 






















 





















 




















 



















 




















 


















 





















 
#line 701 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\PWM.h"




















 
#line 728 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\PWM.h"




















 
#line 755 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\PWM.h"




















 
#line 782 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\PWM.h"




















 
#line 809 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\PWM.h"




















 
#line 836 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\PWM.h"



















 
#line 862 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\PWM.h"





















 
#line 890 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\PWM.h"





















 





















 
#line 940 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\PWM.h"


















 























 
#line 989 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\PWM.h"
        



















 























 
#line 1040 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\PWM.h"




















 





















 





















 




















 





















 





















 

















  
__inline void PWM_ResetPwmController(PWM_T* PWM)
{
    ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->IPRSTC2 |= ((1ul << 20)<<(((PWM)==((PWM_T *) ((( uint32_t)0x40000000) + 0x40000)))?0:1));
    ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->IPRSTC2 &= ~(((1ul << 20)<<(((PWM)==((PWM_T *) ((( uint32_t)0x40000000) + 0x40000)))?0:1)));
}  




















 
__inline uint32_t PWM_GetTimerClockSource(PWM_T* PWM, uint32_t u32Ch)
{
    uint8_t     u8EngineClk;
    uint32_t u32ClkTbl[4] = {(12000000UL), 0, 0, (22118400UL)};
    
    u32ClkTbl[2] = SystemCoreClock;        
    u8EngineClk = ((PWM)==((PWM_T *) ((( uint32_t)0x40000000) + 0x40000)))?((((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKSEL1&((3ul << 28)<<(((u32Ch)/2)*2)))
                               >>(28+((u32Ch)/2)*2)):
                              ((((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKSEL2&((3ul << 4)<<(((u32Ch)/2)*2)))
                               >>(4+((u32Ch)/2)*2));                                             
    return u32ClkTbl[u8EngineClk];    
}




  



  






#line 6189 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\M051Series.h"
#line 1 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\SPI.h"
 









 



 
 
 
#line 19 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\SPI.h"




 



 



 
 
 
#line 54 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\SPI.h"


 
 
 




 
 
 
#line 74 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\SPI.h"

 
 
 







 
 
 



 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 




 














 
static __inline uint32_t SPI_GetClock1Freq(SPI_T * pSpiPort)
{
    return (SystemCoreClock>>1)/((pSpiPort->DIVIDER & 0xFFFF)+1);
}










 
static __inline uint32_t SPI_GetClock2Freq(SPI_T * pSpiPort)
{
    return (SystemCoreClock>>1)/(((pSpiPort->DIVIDER & 0xFFFF0000)>>16)+1);
}



  



  




#line 6190 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\M051Series.h"
#line 1 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\TIMER.h"
 









 



#line 16 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\TIMER.h"



 



 



 
                                                                             
 
#line 42 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\TIMER.h"


 
                                                                             
 
#line 62 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\TIMER.h"


 
                                                                             
 


 





 













 












 





 





 





 





 

                                               



 





 





 





 



 
                                                                             
 


#line 167 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\TIMER.h"

#line 176 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\TIMER.h"

#line 185 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\TIMER.h"


 
                                                                             
 


 





 





 





 





 





 





 





 





 



 
 
 








 
static __inline uint32_t TIMER_GetClockFreq(uint32_t eTimerCH)
{
    uint8_t u8TMRClkSrcSel;
    uint32_t u32ClkSrcTbl[] = {(12000000UL), 0, 0, 0, 0, (10000UL), 0, (22118400UL)};
        
    u32ClkSrcTbl[2] = SystemCoreClock;

    u8TMRClkSrcSel = (((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKSEL1 >> (8+(eTimerCH*4))) & 0x7;

    return u32ClkSrcTbl[u8TMRClkSrcSel]; 
}














 
static __inline uint32_t TIMER_CalInitValue(uint32_t u32ClockFreq, uint32_t u32TicksPerSec)
{
    uint32_t u32Prescale;
    uint32_t u32FinalTCMPR;

    for (u32Prescale=1; u32Prescale<256; u32Prescale++)
    {
        u32FinalTCMPR = u32ClockFreq / (u32TicksPerSec*u32Prescale);

         
        if ((u32FinalTCMPR > 1) && (u32FinalTCMPR < 0x1000000))
            return (((u32Prescale-1) << 24) | u32FinalTCMPR);
    }
    
    return (uint32_t)-1;
}



  



  


#line 6191 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\M051Series.h"
#line 1 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\UART.h"
 









 



#line 16 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\StdDriver\\inc\\UART.h"




 



 


 
 
 











 
 
 

















 
 
 



 
 
 





 
 
 

















 















 




 
 
 












 













 


 
 
 









 

static __inline uint32_t UART_GetClockFreq()
{
    uint8_t u8UartClkSrcSel;
    uint32_t u32ClkTbl[4] = {(12000000UL), 0, 0, (22118400UL)};    
    u32ClkTbl[1] = PllClock;
    u8UartClkSrcSel = (((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKSEL1 & (3ul << 24)) >> 24;
    return u32ClkTbl[u8UartClkSrcSel];
}










 

static __inline uint32_t UART_GetClockDivider()
{
    return ((((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKDIV & (0xFul << 8)) >> 8) + 1;
}











 
static __inline uint32_t UART_GetDivisor_ByMode0(uint32_t u32BaudRate)
{
    return ((((UART_GetClockFreq()/UART_GetClockDivider()) / u32BaudRate + 1) >> 4) -2) ;
}












                       
static __inline uint32_t UART_GetDivisor_ByMode1(uint32_t u32BaudRate,uint8_t u8Divider_X)
{
    return ((((UART_GetClockFreq()/UART_GetClockDivider()) / u32BaudRate + 1) / u8Divider_X) -2) ;
}                                        










 
static __inline uint32_t UART_GetDivisor_ByMode2(uint32_t u32BaudRate)
{
    return (((UART_GetClockFreq()/UART_GetClockDivider() * 2) / u32BaudRate + 1) >> 1);
}













 
static __inline void UART_SetBaudRate(UART_T *UART, uint32_t u32BaudRate)
{
    UART->BAUD = ((1ul << 29) | (1ul << 28)) | UART_GetDivisor_ByMode2(u32BaudRate); 
}



 
 
 














 
















 





















 
                               
static __inline void UART_SetTimeOutCounter(UART_T* UART,uint32_t u32Count)
{
    (UART)->TOR = ((UART)->TOR & ~(0xFFul << 0))| (u32Count);
    (UART)->IER |= (1ul << 11);
}

 
 
 











 
















 



                                              













 
















 















 
















 















 



















 





















 





 
 
 

























 






















 
























                                                                                       















   



 










   


 










  


 










 



 
 
 























   
                         
__inline void UART_SetRTS_TrgLev(UART_T* UART,uint32_t eActLevel,uint32_t eTRG_Level)
{
    (UART)->MCR = ((UART)->MCR & ~(1ul << 9)     | (eActLevel ));
    (UART)->FCR = ((UART)->FCR & ~(0xFul << 16) | (eTRG_Level));
}















   

















     
















 














 















 



 
 
 















   



 
 
 

















   



















   






























































                                                                                       














                                                                                       

















                                                                                       















                                                                                       




 
 
 















                                                                                       















                                                                                       




 
 
                                                                                      












  

  











  














  
__inline void UART_ResetIP(UART_T* UART)
{
    ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->IPRSTC2 |= 1<< (16+ ((UART)==((UART_T *) ((( uint32_t)0x40000000) + 0x50000)))?0:1) ;
    ((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->IPRSTC2 &= ~(1<< (16+ ((UART)==((UART_T *) ((( uint32_t)0x40000000) + 0x50000)))?0:1)) ;
}     

 
 
  











  













  





__inline int32_t UART_Write(UART_T *UART,uint8_t *pu8TxBuf,uint32_t u32WriteBytes)
{
    uint32_t  u32Count, u32delayno;

    for (u32Count=0; u32Count != u32WriteBytes; u32Count++)
    {
       u32delayno = 0;
       while (((UART)->FSR & (1ul << 28)) == 0)   
       {
            u32delayno++;
            if ( u32delayno >= 0x40000000 )             
               return 0;               
       }
       (((UART))->THR = (pu8TxBuf[u32Count]));         
    }
    return 1;
}

__inline int32_t UART_Read(UART_T *UART,uint8_t *pu8RxBuf, uint32_t u32ReadBytes)
{
    uint32_t u32Count, u32delayno;

    for (u32Count=0; u32Count != u32ReadBytes; u32Count++)
    {
         u32delayno = 0;
         while ((UART)->FSR & (1ul << 14))
         {
            u32delayno++;        
            if ( u32delayno >= 0x40000000 )        
                return 0;               
         }
         ((pu8RxBuf[u32Count]) = ((UART))->RBR);           
    }
    return 1;
}



  



  














#line 6192 ".\\BSP_Library\\M051SeriesBSP_CMSIS_v2.01.002\\LibM051Series\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\M051Series\\M051Series.h"


                                                                                                 

#line 7 "lib.h"
























































 


































 





#line 110 "lib.h"







#line 124 "lib.h"





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
	
	STATE_CALL_PROMPT,	
	STATE_INCOMMING,	  
	STATE_ALERT,		    
	STATE_ACTIVE,		    
	STATE_NEXT_CALL,	  

	STATE_STANDBY,
	STATE_BYE,
	STATE_POWERING_DOWN,	
}state_enum;

typedef enum
{
	SOCKSTATE_NULL = 0,
	SOCKSTATE_CONFIG,		
	SOCKSTATE_OPENNING,
	SOCKSTATE_OPENED,	

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
	
	TEST_BATT,
	TEST_CSQ,
	TEST_GPS,
	
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
#line 1 "pic_info.h"
PIC_ID_LOGO,
PIC_ID_BATT_0,
PIC_ID_BATT_1,
PIC_ID_BATT_2,
PIC_ID_BATT_3,
PIC_ID_BATT_4,
PIC_ID_BATT_5,
PIC_ID_VOL0,
PIC_ID_VOL1,
PIC_ID_VOL2,
PIC_ID_VOL3,
PIC_ID_VOL4,
PIC_ID_VOL5,
PIC_ID_VOL6,
PIC_ID_VOL7,
PIC_ID_VOL1_0,
PIC_ID_VOL2_0,
PIC_ID_VOL3_0,
PIC_ID_VOL4_0,
PIC_ID_VOL5_0,
PIC_ID_VOL6_0,
PIC_ID_VOL7_0,
PIC_ID_SIGNAL0,
PIC_ID_SIGNAL1,
PIC_ID_SIGNAL2,
PIC_ID_SIGNAL3,
PIC_ID_SIGNAL4,
PIC_ID_MODEM_BATT0,
PIC_ID_MODEM_BATT1,
PIC_ID_MODEM_BATT2,
PIC_ID_MODEM_BATT3,
PIC_ID_MODEM_BATT4,
PIC_ID_MODEM_BATT5,
#line 210 "lib.h"


	PIC_ID_NUM
} PicId_Enum;  

#line 5 "ext_var.h"

extern uint8_t Flag_EndWithCr;
extern uint8_t Flag_FindCr;

extern uint8_t Flag_Incomming;
extern uint8_t isCheckingBattery;
extern uint8_t Flag_Power_Down;
extern uint8_t Flag_async_Power_Down;

extern uint8_t BattKey;
extern uint8_t HelpKey;
extern uint8_t LongHelpKey;
extern uint8_t LongBattKey;


extern uint8_t Flag_LowBat;
extern uint8_t Flag_ObtainGps;
extern uint8_t Flag_SimExist;

extern uint8_t TimerSignal;
extern volatile uint8_t dlyct1;
extern volatile uint8_t dlyct2;  
extern volatile uint8_t sdly;
extern uint8_t tc35data[350+1];		   
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

extern uint16_t TimerTestMode;
extern uint8_t TimerLockMode;

extern uint8_t sockState;
extern uint16_t TimerSock;
extern uint8_t TimerGps;
extern char gpsInfo[23];

extern char gMnc[4];
extern uint8_t TimerUdp;
extern uint16_t TimerStandby;




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



#line 2 "module.c"
#line 3 "module.c"
#line 1 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\string.h"
 
 
 
 




 








 












#line 38 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\string.h"


  
  typedef unsigned int size_t;








extern __declspec(__nothrow) void *memcpy(void * __restrict  ,
                    const void * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) void *memmove(void *  ,
                    const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   







 
extern __declspec(__nothrow) char *strcpy(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncpy(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 

extern __declspec(__nothrow) char *strcat(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) char *strncat(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 






 

extern __declspec(__nothrow) int memcmp(const void *  , const void *  , size_t  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strcmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int strncmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcasecmp(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   





 
extern __declspec(__nothrow) int strncasecmp(const char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int strcoll(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   







 

extern __declspec(__nothrow) size_t strxfrm(char * __restrict  , const char * __restrict  , size_t  ) __attribute__((__nonnull__(2)));
   













 


#line 185 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\string.h"
extern __declspec(__nothrow) void *memchr(const void *  , int  , size_t  ) __attribute__((__nonnull__(1)));

   





 

#line 201 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   




 

extern __declspec(__nothrow) size_t strcspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   




 

#line 224 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strpbrk(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   




 

#line 239 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strrchr(const char *  , int  ) __attribute__((__nonnull__(1)));

   





 

extern __declspec(__nothrow) size_t strspn(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   



 

#line 262 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\string.h"
extern __declspec(__nothrow) char *strstr(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));

   





 

extern __declspec(__nothrow) char *strtok(char * __restrict  , const char * __restrict  ) __attribute__((__nonnull__(2)));
extern __declspec(__nothrow) char *_strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

extern __declspec(__nothrow) char *strtok_r(char *  , const char *  , char **  ) __attribute__((__nonnull__(2,3)));

   

































 

extern __declspec(__nothrow) void *memset(void *  , int  , size_t  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) char *strerror(int  );
   





 
extern __declspec(__nothrow) size_t strlen(const char *  ) __attribute__((__nonnull__(1)));
   



 

extern __declspec(__nothrow) size_t strlcpy(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   
















 

extern __declspec(__nothrow) size_t strlcat(char *  , const char *  , size_t  ) __attribute__((__nonnull__(1,2)));
   






















 

extern __declspec(__nothrow) void _membitcpybl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpybb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpyhb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitcpywb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovebb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovehb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewl(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) void _membitmovewb(void *  , const void *  , int  , int  , size_t  ) __attribute__((__nonnull__(1,2)));
    














































 







#line 494 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\string.h"



 

#line 4 "module.c"
#line 1 "misc.h"



#line 5 "misc.h"

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

#line 5 "module.c"
#line 1 "module.h"







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





















#line 6 "module.c"
#line 1 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdio.h"
 
 
 





 






 













#line 38 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdio.h"


  
  typedef unsigned int size_t;    








 
 

 
  typedef struct __va_list __va_list;





   




 




typedef struct __fpos_t_struct {
    unsigned __int64 __pos;
    



 
    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
   


 


   

 

typedef struct __FILE FILE;
   






 

extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;

#line 129 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdio.h"
    

    

    





     



   


 


   


 

   



 

   


 




   


 





    


 






extern __declspec(__nothrow) int remove(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int rename(const char *  , const char *  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) FILE *tmpfile(void);
   




 
extern __declspec(__nothrow) char *tmpnam(char *  );
   











 

extern __declspec(__nothrow) int fclose(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) int fflush(FILE *  );
   







 
extern __declspec(__nothrow) FILE *fopen(const char * __restrict  ,
                           const char * __restrict  ) __attribute__((__nonnull__(1,2)));
   








































 
extern __declspec(__nothrow) FILE *freopen(const char * __restrict  ,
                    const char * __restrict  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(2,3)));
   








 
extern __declspec(__nothrow) void setbuf(FILE * __restrict  ,
                    char * __restrict  ) __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) int setvbuf(FILE * __restrict  ,
                   char * __restrict  ,
                   int  , size_t  ) __attribute__((__nonnull__(1)));
   















 
#pragma __printf_args
extern __declspec(__nothrow) int fprintf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   


















 
#pragma __printf_args
extern __declspec(__nothrow) int _fprintf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   




 
#pragma __printf_args
extern __declspec(__nothrow) int _printf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __printf_args
extern __declspec(__nothrow) int sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






 
#pragma __printf_args
extern __declspec(__nothrow) int _sprintf(char * __restrict  , const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

#pragma __printf_args
extern __declspec(__nothrow) int snprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   















 

#pragma __printf_args
extern __declspec(__nothrow) int _snprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , ...) __attribute__((__nonnull__(3)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int fscanf(FILE * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   






























 
#pragma __scanf_args
extern __declspec(__nothrow) int _fscanf(FILE * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   






 
#pragma __scanf_args
extern __declspec(__nothrow) int _scanf(const char * __restrict  , ...) __attribute__((__nonnull__(1)));
   



 
#pragma __scanf_args
extern __declspec(__nothrow) int sscanf(const char * __restrict  ,
                    const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   








 
#pragma __scanf_args
extern __declspec(__nothrow) int _sscanf(const char * __restrict  ,
                     const char * __restrict  , ...) __attribute__((__nonnull__(1,2)));
   



 

 
extern __declspec(__nothrow) int vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int _vfscanf(FILE * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));
extern __declspec(__nothrow) int _vscanf(const char * __restrict  , __va_list) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) int _vsscanf(const char * __restrict  , const char * __restrict  , __va_list) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) int vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int _vprintf(const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) int vfprintf(FILE * __restrict  ,
                    const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 
extern __declspec(__nothrow) int vsprintf(char * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   






 

extern __declspec(__nothrow) int vsnprintf(char * __restrict  , size_t  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   







 

extern __declspec(__nothrow) int _vsprintf(char * __restrict  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vfprintf(FILE * __restrict  ,
                     const char * __restrict  , __va_list  ) __attribute__((__nonnull__(1,2)));
   



 
extern __declspec(__nothrow) int _vsnprintf(char * __restrict  , size_t  ,
                      const char * __restrict  , __va_list  ) __attribute__((__nonnull__(3)));
   



 
extern __declspec(__nothrow) int fgetc(FILE *  ) __attribute__((__nonnull__(1)));
   







 
extern __declspec(__nothrow) char *fgets(char * __restrict  , int  ,
                    FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   










 
extern __declspec(__nothrow) int fputc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   







 
extern __declspec(__nothrow) int fputs(const char * __restrict  , FILE * __restrict  ) __attribute__((__nonnull__(1,2)));
   




 
extern __declspec(__nothrow) int getc(FILE *  ) __attribute__((__nonnull__(1)));
   







 




    extern __declspec(__nothrow) int (getchar)(void);

   





 
extern __declspec(__nothrow) char *gets(char *  ) __attribute__((__nonnull__(1)));
   









 
extern __declspec(__nothrow) int putc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   





 




    extern __declspec(__nothrow) int (putchar)(int  );

   



 
extern __declspec(__nothrow) int puts(const char *  ) __attribute__((__nonnull__(1)));
   





 
extern __declspec(__nothrow) int ungetc(int  , FILE *  ) __attribute__((__nonnull__(2)));
   






















 

extern __declspec(__nothrow) size_t fread(void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   











 

extern __declspec(__nothrow) size_t __fread_bytes_avail(void * __restrict  ,
                    size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,3)));
   











 

extern __declspec(__nothrow) size_t fwrite(const void * __restrict  ,
                    size_t  , size_t  , FILE * __restrict  ) __attribute__((__nonnull__(1,4)));
   







 

extern __declspec(__nothrow) int fgetpos(FILE * __restrict  , fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   








 
extern __declspec(__nothrow) int fseek(FILE *  , long int  , int  ) __attribute__((__nonnull__(1)));
   














 
extern __declspec(__nothrow) int fsetpos(FILE * __restrict  , const fpos_t * __restrict  ) __attribute__((__nonnull__(1,2)));
   










 
extern __declspec(__nothrow) long int ftell(FILE *  ) __attribute__((__nonnull__(1)));
   











 
extern __declspec(__nothrow) void rewind(FILE *  ) __attribute__((__nonnull__(1)));
   





 

extern __declspec(__nothrow) void clearerr(FILE *  ) __attribute__((__nonnull__(1)));
   




 

extern __declspec(__nothrow) int feof(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) int ferror(FILE *  ) __attribute__((__nonnull__(1)));
   


 
extern __declspec(__nothrow) void perror(const char *  );
   









 

extern __declspec(__nothrow) int _fisatty(FILE *   ) __attribute__((__nonnull__(1)));
    
 

extern __declspec(__nothrow) void __use_no_semihosting_swi(void);
extern __declspec(__nothrow) void __use_no_semihosting(void);
    





 











#line 948 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdio.h"



 

#line 7 "module.c"
#line 1 "udp.h"



#line 5 "udp.h"








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

extern uint8_t	udp_buff[64];
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

#line 8 "module.c"
#line 1 "custerm.h"



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
        uint32_t	params[79];  
        
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
			
			
			uint16_t delay;
	
	uint16_t battLowLev;
	uint16_t battEmptyLev;
	uint16_t battReplaceLev;
	uint16_t battDischargeLev;
	uint8_t  lockState;
	
	
			uint8_t	debug;	
			uint8_t	agps;	
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

void Custerm_BattLowLev      (char *param);
void Custerm_BattEmptyLev    (char *param);
void Custerm_BattReplaceLev  (char *param);
void Custerm_BattDischargeLev(char *param);



uint8_t CustermHandle(char *param);
void NvInit(void);
uint8_t ReadLog(char *buf);
void WriteLog(char *buf);
void LogInit(void);
void LogOnOff(u8 off);



#line 9 "module.c"
#line 1 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdarg.h"
 
 
 





 










#line 27 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdarg.h"








 

 
 
  typedef struct __va_list { void *__ap; } va_list;

   






 


   










 


   















 




   

 


   




 



   





 






#line 119 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\stdarg.h"











 

#line 10 "module.c"

static char	atBuff[81];








 
#line 75 "module.c"




 
void ResetUartFlag(void)
{
	NVIC_DisableIRQ(UART1_IRQn); 
	Count_SL = 0;
	Flag_EndWithCr=0;
	Flag_FindCr = 0;
	tc35data[0] = 0;
	NVIC_EnableIRQ(UART1_IRQn); 
}

void SendData(uint8_t *cmd, uint8_t length)
{ 
	uint8_t 	i;
	
	if(Flag_Power_Down)
		return;

	if( Flag_MsgDebug == 0)
	{
		while(length--)
		{
			while( (((((UART_T *) ((( uint32_t)0x40100000) + 0x50000)))->FSR & (1ul << 23))>>23) == 1 );
			((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->DATA = *cmd++;;
		}
	}
	else
	{
		while(length--)
		{
			i = *cmd++;

			while( (((((UART_T *) ((( uint32_t)0x40100000) + 0x50000)))->FSR & (1ul << 23))>>23) == 1 );
			((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->DATA = i;
			while( (((((UART_T *) ((( uint32_t)0x40000000) + 0x50000)))->FSR & (1ul << 23))>>23) == 1 );
			((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->DATA = i;
		}
	}


	g_rsq = Count_SL;



	Flag_EndWithCr=0;
} 

void SendAtCommand2(uint8_t * atcmd, u8 index)
{
	u8	temp[4];

	Dec2Txt(index, temp, 0);
	SendAtCommand(atcmd);
	SendAtCommand(temp);
	SendAtCommand("\r\n");
}







 
void SendAtCommand(uint8_t *atcmd)
{ 
	uint8_t 	i;

	if( Flag_MsgDebug == 0)
	{
		while(*atcmd != '\0')
		{
			while( (((((UART_T *) ((( uint32_t)0x40100000) + 0x50000)))->FSR & (1ul << 23))>>23) == 1 );
			((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->DATA = *atcmd++;
		}
	}
	else
	{
		while(*atcmd != '\0')
		{
			i = *atcmd++;

			while( (((((UART_T *) ((( uint32_t)0x40100000) + 0x50000)))->FSR & (1ul << 23))>>23) == 1 );
			((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->DATA = i;
			while( (((((UART_T *) ((( uint32_t)0x40000000) + 0x50000)))->FSR & (1ul << 23))>>23) == 1 );
			((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->DATA = i;
		}
	}
	

	g_rsq = Count_SL;




	Flag_EndWithCr=0;
	Flag_FindCr = 0;
} 


uint8_t SendAtCmdRsq(char *string, char *rsq)
{
	uint8_t		i = 3;
	uint8_t		result = 1;

	while(i-- && !Flag_Power_Down)
	{	
		SendAtCommand((uint8_t *)string);

		sdly = 250;
		while(sdly && !Flag_Power_Down)
		{
			FeedWatchdog();
			switch(tc35data[g_rsq])
			{
			case '0':
			case 'O':
				goto exit;
				
			case '2':
			case '4':
				result = 0;
				goto exit;

			default:
				if( strstr((char *)&tc35data[g_rsq], rsq) )
				{
					goto exit;
				}
				else if(CheckTc35Respond("+CME ERROR: ", g_rsq))
				{
					result = 0;
					goto exit;
				}
				else if(CheckTc35Respond("+CMS ERROR: ", g_rsq))
				{
					result = 0;
					goto exit;
				}
				
				break;
			}

		}

		delay_50ms(60);
	}

exit:
	delay_ms(5);
	return result;
}


u8	WaitRsp(u8 ms, char *rsq)
{
	sdly = ms;
	while(sdly && !Flag_Power_Down)
	{
		FeedWatchdog();
		if( strstr((char *)&tc35data[g_rsq], rsq) )
			return 1;
	}

	return 0;
}


void SendAtWaitRsq(u8 delay, u8 retry, u8 reset, char *fmt, ...)
{
	uint8_t 	ct=0;
	va_list 	arg;
		
	__va_start(arg, fmt);
	vsnprintf(atBuff, 80, fmt, arg);
	
	while( !Flag_Power_Down )
	{
		FeedWatchdog();
		SendAtCommand((u8 *)atBuff);
		module_WaitResponse(delay);

		if(tc35data[g_rsq]=='0' || tc35data[g_rsq]=='4' 
			|| tc35data[g_rsq]=='O' || CheckTc35Respond("+CME", g_rsq)==1
			|| CheckTc35Respond("+CMS", g_rsq)==1 
			|| (ct>=2 && tc35data[g_rsq]!=0) )
			
		{
			break;
		}
		
		ct++;
		if(ct == retry)
		{
			if( reset )
				SoftReset();
			break;
		}
		
		delay_50ms(60);
	}
	
	delay_ms(1);
	__va_end(arg);
}





 
void module_WaitResponse(uint8_t time)
{

	dlyct2 = time; 
	while(!Flag_Power_Down)
	{
		if(Flag_EndWithCr==1)
		{
			break;
		}
		else if(dlyct2==0)
		{

			break;
		}
				
		FeedWatchdog();
	}

	if(!Flag_Power_Down)
		delay_ms(10);
}








 
uint8_t CheckTc35Respond(uint8_t *respond, uint16_t offset)
{ 
  uint16_t i=0, j=offset;
  
  while(*(respond+i)!='\0')
  {
    if(*(respond+i)==tc35data[j++])
      i++;
    else
      return(0);   
  }
  return(1); 
}


void module_PowerOn(void)
{  
	ModulePowerOn(1); 
	delay_50ms(5);
	ModulePowerOn(0); 
}	

void module_Init()
{	
#line 366 "module.c"






	SendAtWaitRsq(50, 6, 0, "AT+CMEE=1;+CFUN=1;+CGFUNC=18,1\r\n");
	SendAtCmdRsq("AT+CGMR\r\n", "+CGMR");
}




uint8_t Module_CheckRegister(void)
{	
	uint8_t	*p;
	
	FeedWatchdog();
	SendAtCommand("AT+CREG?\r\n");
	module_WaitResponse(20);
	p= &tc35data[g_rsq];
	
	if((CheckTc35Respond("+CREG", g_rsq)==1) && (p[9]=='1'||p[9]=='5') )
		return 1; 
	else 
		return 0;
}
























 
void ModemNetworkInit()
{	
	if( Flag_Power_Down )
		return;
	
	SendAtWaitRsq(50, 6, 0, "AT+CNAOP=2\r\n");
	
	SendAtWaitRsq(50, 6, 0, "AT+CNMP=2\r\n");		
	
	








	SendAtWaitRsq(50, 6, 0, "AT+CNSDP=2\r\n");

	SendAtWaitRsq(50, 6, 0, "AT+CLIP=1\r\n");
	SendAtWaitRsq(50, 6, 0, "AT+COPS=0\r\n");	
	
	SendAtWaitRsq(50, 6, 0, "AT+CTZU=1\r\n");	

}

void ModemVolumeInit()
{
	if( Flag_Power_Down )
		return;
	
	SwitchVoiceChannel(3);	
	SendAtCommand("AT+CVLVL=1,-1200;+CVLVL=2,-600;+CVLVL=3,-200;+CVLVL=4,100;+CVLVL=5,400;+CVLVL=6,800;+CVLVL=7,1000\r\n");
	module_WaitResponse(20);
	AdjustVolume(curVolume);

}

void ModemAudioInit(void)
{
	SendAtWaitRsq(50, 6, 0, "AT+CTXGAIN=13000;+CTXVOL=10000;+CRXGAIN=10000;+CRXVOL=50\r\n");		
  SendAtWaitRsq(50, 6, 0, "AT+SIDET=0;+CMICAMP1=1;+CECM=0\r\n");
}





 
void HuangupCall(void)
{	
	SendAtCommand("AT+CHUP\r\n");
	module_WaitResponse(50);
	delay_ms(500);

}

void HuangupAllCall(void)
{	
	SendAtWaitRsq(50, 6, 0, "AT+CHUP\r\n");
	delay_ms(500);

}










 

uint8_t GetSimPinStatus(void)
{
	uint8_t i, *p;	

	i = 8;		
	while(!Flag_Power_Down && i--)
	{		
		delay_50ms(20);
			
		SendAtCommand("AT+CPIN?\r\n");	
		module_WaitResponse(100);
		p = &tc35data[g_rsq];
		
		if(p[0]=='4' && i--)
		{
			return(0);
		}
		else if(CheckTc35Respond("+CME ERROR: 1", g_rsq)==1)
		{
			if(p[13]=='4' && (i==0))
			{	
				return(4);
			}
			else if(p[13]=='3')
			{	
				return(0);
			}
			else if(p[13]=='1')
			{	
				return(2);
			}
			else if(p[13]=='2')
			{	
				return(3);
			}
			else if(i == 0)
			{
				return(4);
			}
			
		}
		else if(CheckTc35Respond("+CPIN: READY", g_rsq)==1)
		{
			return(1);
		}
		else if(CheckTc35Respond("+CPIN: SIM PIN", g_rsq)==1)
		{
			return(2);
		}
		else if(CheckTc35Respond("+CPIN: SIM PUK", g_rsq)==1)
		{
			return(3);
		}
		else if(p[0] == '0')
		{
			return(1);
		}
	}

	return(4);
}









 
#line 589 "module.c"










 























 







 
uint8_t signal_quality(void)
{	
	uint8_t signal = 99;	

	FeedWatchdog();
	SendAtCommand("AT+CSQ\r\n");
	module_WaitResponse(10);
	if(CheckTc35Respond("+CSQ:", g_rsq)==1)
	{
		signal=tc35data[6+g_rsq]-0x30;
		if(tc35data[7+g_rsq]!=',')
			signal=signal*10+(tc35data[7+g_rsq]-0x30);
		ModuleNoAck = 0;
	}
	else
	{
		ModuleNoAck++;
	}
	
	return signal;
}


void SwitchVoiceChannel(uint8_t ch)
{
	if( ch == 3)
	{
		if(progress == TEST_LOOP)
			SendAtWaitRsq(50, 6, 0, "AT+CSDVC=3;+CLOOPBACK=3,1\r\n");
		else
			SendAtWaitRsq(50, 6, 0, "AT+CSDVC=3;+CNSM=0\r\n");
	}
	else
	{
		if(progress == TEST_LOOP)
			SendAtWaitRsq(50, 6, 0, "AT+CSDVC=1;+CLOOPBACK=1,1\r\n");
		else
			SendAtWaitRsq(50, 6, 0, "AT+CSDVC=1\r\n");
	}
}











 




















 










  



#line 741 "module.c"

void GpsStop(void)
{
	if( Flag_Power_Down )
		return;
	
	SendAtWaitRsq(40, 6, 0, "AT+CGPS=0\r\n");	
}

void GpsStart_2(void)
{
	if( Flag_Power_Down || Flag_SimExist==0 || custermParam.param.agps == '1')
		return;

	if(custermParam.param.agps == '2')
	{
		SendAtWaitRsq(100, 6, 0, "AT+CGPSMD=0\r\n");	
		SendAtWaitRsq(100, 6, 0, "AT+CGPS=1,2\r\n");
	}
	else
	{
		SendAtWaitRsq(50, 6, 0, "AT+CGPS=1\r\n"); 
	}
		

	Flag_GpsStart = 1;
	if( state != STATE_TEST || progress==TEST_GPS)
		TimerGps = 15;
}


void SockOpen()
{
	if( isCheckingBattery || (state==STATE_TEST && progress==TEST_VERSION) )
		return;
	
	if(sockState == SOCKSTATE_NULL)
	{

		if( witchApn == 1 )
		{
			SendAtWaitRsq(100, 6, 0, "AT+CGSOCKCONT=3,\"IP\",%s\r\n",custermParam.param.apn);
			if( custermParam.param.user_pw[0] )
				SendAtWaitRsq(100, 6, 0, "AT+CSOCKAUTH=3,1,%s\r\n", custermParam.param.user_pw);
			else
				SendAtWaitRsq(100, 6, 0, "AT+CSOCKAUTH=3,0\r\n");
		}
		else
		{
			SendAtWaitRsq(100, 6, 0, "AT+CGSOCKCONT=2,\"IP\",%s\r\n",custermParam.param.apn2);
			if( custermParam.param.user_pw2[0] )
				SendAtWaitRsq(100, 6, 0, "AT+CSOCKAUTH=2,1,%s\r\n", custermParam.param.user_pw2);
			else
				SendAtWaitRsq(100, 6, 0, "AT+CSOCKAUTH=2,0\r\n");
		}





		if( witchApn == 1 )
			SendAtWaitRsq(100, 6, 0, "AT+CSOCKSETPN=3\r\n");
		else
			SendAtWaitRsq(100, 6, 0, "AT+CSOCKSETPN=2\r\n");
		

		if(custermParam.param.agps == '1')
		{
		
		
				
			SendAtWaitRsq(100, 6, 0, "AT+CGPSURL=%s\r\n", custermParam.param.gps_url);
			SendAtWaitRsq(100, 6, 0, "AT+CGPSSSL=0\r\n");
		
			SendAtWaitRsq(100, 6, 0, "AT+CGPSMD=1\r\n");	
			SendAtWaitRsq(100, 6, 0, "AT+CGPS=1,2\r\n");

			Flag_GpsStart = 1;
			if( state != STATE_TEST || progress==TEST_GPS)
				TimerGps = 10;
		}

		sockState = SOCKSTATE_CONFIG;
		TimerSock = 40;	
	}
	else
	{
		sockState = SOCKSTATE_OPENNING;

		if( custermParam.param.agps == '1' || Flag_GpsStart == 1 )

		{
			SendAtCommand("AT+NETOPEN=,,1\r\n");
			module_WaitResponse(60);
			TimerSock = 255;
		}
		else
		{
			TimerSock = 20;
		}
		
	}
}


void SockClose()
{
	sockState = SOCKSTATE_CLOSING;
	SendAtCommand("AT+NETCLOSE\r\n");
	module_WaitResponse(20);
}


void SockConnect()
{


	SendAtWaitRsq(50, 6, 0, "AT+CIPHEAD=1\r\n");
	SendAtWaitRsq(50, 6, 0, "AT+CIPSRIP=1\r\n");
	SendAtWaitRsq(50, 6, 0, "AT+CIPCCFG=3,0,0,1,1\r\n");
	SendAtWaitRsq(50, 1, 0, "AT+CIPOPEN=0,\"UDP\",,,%s\r\n", custermParam.param.local_port);
	TimerSock = 80;
#line 870 "module.c"
}




const uint8_t *VOLUME_VOL[] = 
{
	"1\r\n",
	"2\r\n",
	"3\r\n",
	"4\r\n",
	"5\r\n",
	"6\r\n",
	"7\r\n",
	"8\r\n",
};

void AdjustVolume(uint8_t volume)
{
	SendAtCommand("AT+CLVL=");
	SendAtCommand((uint8_t *)VOLUME_VOL[volume]);
	module_WaitResponse(2);
}









  
uint8_t GetModuleIMEI(unsigned char *imei, uint8_t length)
{	
	uint8_t  	i, retry = 3;
	uint16_t	j;
	
	while(retry--)
	{
		SendAtCommand("AT+GSN\r\n");
		module_WaitResponse(100);
		if(Flag_EndWithCr==1)
		{
			length--;
			for(i=0,j=g_rsq; tc35data[j]!='\r' && i<length; i++,j++)
				imei[i]=tc35data[j];		
			imei[i]='\0';
			
			return i;
		}
		
		delay_50ms(40);
	} 

	return 0;
}






 
uint8_t GetIccid(char *iccid, uint8_t length)
{	
	if( SendAtCmdRsq("AT+CICCID\r\n", "+ICCID:") == 1 
		&& GetString((char *)&tc35data[g_rsq], " ", "\r", iccid, length) )
	{
		return 1;
	}
	
	return 0;
}


uint8_t ChgPinCode(uint8_t *oldPin, uint8_t *newPin)
{	
	SendAtCommand("AT+CPWD=\"SC\",\"");
	SendAtCommand(oldPin);
	SendAtCommand("\",\"");
	SendAtCommand(newPin);
	SendAtCommand("\"\r\n");	
	module_WaitResponse(250);
	
	if(tc35data[g_rsq]=='0' || tc35data[g_rsq]=='O')
		return 1;
	else if(CheckTc35Respond("+CME ERROR: 1", g_rsq)==1)
	{
#line 966 "module.c"
		if(tc35data[13+g_rsq]=='2')	
		{
			return 3;
		}
		else if(tc35data[13+g_rsq]=='6')	
		{
			return 2;
		}
	}
	else if(tc35data[g_rsq]=='4')
	{
		return 2;
	}
	
	return 5;
}

uint8_t LockPinCode(uint8_t lock, uint8_t *pin)
{	
	SendAtCommand("AT+CLCK=\"SC\",");
	if( lock )
		SendAtCommand("1,\"");
	else
		SendAtCommand("0,\"");
		
	SendAtCommand(pin);
	SendAtCommand("\"\r\n");	
	module_WaitResponse(250);
	if(tc35data[g_rsq]=='0' || tc35data[g_rsq]=='O')
		return 1;
	else if(CheckTc35Respond("+CME ERROR: 1", g_rsq)==1)
	{
#line 1005 "module.c"
		if(tc35data[13+g_rsq]=='2')	
		{
			return 3;
		}
		else if(tc35data[13+g_rsq]=='6')	
		{
			return 2;
		}
	}
	else if(tc35data[g_rsq]=='4')
	{
		return 2;
	}
	
	return 5;
}

uint8_t ActiveSimLock(uint8_t *puk, uint8_t *newPin)
{	
	SendAtCommand("AT+CPIN=\"");
	SendAtCommand(puk);
	if( newPin && (newPin[0]!=0) )
	{
		SendAtCommand("\",\"");
		SendAtCommand(newPin);
	}
	SendAtCommand("\"\r\n");	
	module_WaitResponse(250);
	if(tc35data[g_rsq]=='0' || tc35data[g_rsq]=='O')
		return 1;
	else if(CheckTc35Respond("+CME ERROR: 1", g_rsq)==1)
	{
#line 1044 "module.c"
		if(tc35data[13+g_rsq]=='2')	
		{
			return 3;
		}
		else if(tc35data[13+g_rsq]=='6')	
		{
			return 2;
		}
	}
	else if(tc35data[g_rsq]=='4')
	{
		return 2;
	}
	
	return 5;
}


uint8_t Communication(uint8_t max)
{	
	while(!Flag_Power_Down)
	{
		SendAtCommand("ATE0V0\r\n");
		module_WaitResponse(40);
		if(tc35data[g_rsq]=='0')
		{
			break;
		}
		else
		{
			if( --max == 0) 
				return 0;
		}

		dlyct1 = 20;
		while(dlyct1)FeedWatchdog();
	}

	return 1;
}

#line 1100 "module.c"

void AccountGet()
{
	static	u8	empty = 0;
	char	*p, *p2;
	u8		j;
	
	if ((gPhoneNumOk != PHONE_NUM_BUSY) || (Flag_SimExist==0))
		return;

	
	SendAtCommand("AT+CNUM\r\n");
	module_WaitResponse(40);
	p = strstr((char *)&tc35data[g_rsq], "+CNUM");

	if ( p )
	{
		empty = 0;
		p = strstr((char *)&tc35data[g_rsq],",\"");
		if( !p ) return;
		
		p2 = strstr(p+2, "\"");
		if( !p2 ) return;
		
		j = p2 - p - 2;
		if (j > 10)
		{
			p += (j - 10);  
			j = 10;		
		}
		
		memcpy(&gSia[10-j], p+2, j);
		gPhoneNumOk = PHONE_NUM_READY;
	}
	else if(tc35data[g_rsq]=='0' || tc35data[g_rsq]=='O')
	{
		if( ++empty > 2)
		{
			gPhoneNumOk = PHONE_NUM_EMPTY;
			
		}
	}
	else
	{
		empty = 0;
	}
}

u8 PhoneNumberSet(char *ph )
{

	u8		temp = Flag_MsgDebug;
	Flag_MsgDebug = 0;

	SendAtWaitRsq(60, 6, 0, "AT+CPBS=\"ON\"\r\n");
	if(tc35data[g_rsq]=='0' || tc35data[g_rsq]=='O')
	{
		delay_ms(10);
		SendAtWaitRsq(150, 6, 0, "AT+CPBW=1,\"%s\"\r\n", ph);
		Flag_MsgDebug = temp;
		return (tc35data[g_rsq]=='0' || tc35data[g_rsq]=='O');
	}

	Flag_MsgDebug = temp;
	return 0;
}


