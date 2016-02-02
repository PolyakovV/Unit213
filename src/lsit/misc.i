#line 1 "misc.c"
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



 

#line 2 "misc.c"




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

#line 7 "misc.c"
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

#line 8 "misc.c"
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





















#line 9 "misc.c"

#line 1 "Ext_var.h"



#line 5 "Ext_var.h"

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



#line 11 "misc.c"
#line 1 "interrupt.h"



void Module_Uart_Handler(uint32_t u32IntStatus);
void Debug_Uart_Handler(uint32_t u32IntStatus);
void SysTick_Handler(void);
uint8_t GetKeyHelp(void);
uint8_t GetKeyBatt(void);



#line 12 "misc.c"

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

#line 14 "misc.c"
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



 

#line 15 "misc.c"
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



#line 16 "misc.c"
#line 17 "misc.c"
#line 1 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\time.h"
 
 
 
 









 





 













#line 41 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\time.h"


  
  typedef unsigned int size_t;








    
 
#line 65 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\time.h"





typedef unsigned int clock_t;     
typedef unsigned int time_t;      

#pragma push
#pragma anon_unions

struct tm {
    int tm_sec;   
 
    int tm_min;    
    int tm_hour;   
    int tm_mday;   
    int tm_mon;    
    int tm_year;   
    int tm_wday;   
    int tm_yday;   
    int tm_isdst;  
    union {        
        struct {
            int __extra_1, __extra_2;
        };
        struct {
            long __extra_1_long, __extra_2_long;
        };
        struct {
            char *__extra_1_cptr, *__extra_2_cptr;
        };
        struct {
            void *__extra_1_vptr, *__extra_2_vptr;
        };
    };
};

#pragma pop

   



 

extern __declspec(__nothrow) clock_t clock(void);
   





 
extern __declspec(__nothrow) double difftime(time_t  , time_t  );
   


 
extern __declspec(__nothrow) time_t mktime(struct tm *  ) __attribute__((__nonnull__(1)));
   













 
extern __declspec(__nothrow) time_t time(time_t *  );
   






 

extern __declspec(__nothrow) char *asctime(const struct tm *  ) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) char *_asctime_r(const struct tm *  ,
                                char * __restrict  ) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) char *asctime_r(const struct tm *  ,
                               char * __restrict  ) __attribute__((__nonnull__(1,2)));

   



 
extern __declspec(__nothrow) char *ctime(const time_t *  ) __attribute__((__nonnull__(1)));
   




 
extern __declspec(__nothrow) struct tm *gmtime(const time_t *  ) __attribute__((__nonnull__(1)));
   



 
extern __declspec(__nothrow) struct tm *localtime(const time_t *  ) __attribute__((__nonnull__(1)));
extern __declspec(__nothrow) struct tm *_localtime_r(const time_t * __restrict  ,
                                       struct tm * __restrict  ) __attribute__((__nonnull__(1,2)));

extern __declspec(__nothrow) struct tm *localtime_r(const time_t * __restrict  ,
                                      struct tm * __restrict  ) __attribute__((__nonnull__(1,2)));

   



 
extern __declspec(__nothrow) size_t strftime(char * __restrict  , size_t  ,
                       const char * __restrict  ,
                       const struct tm * __restrict  ) __attribute__((__nonnull__(1,3,4)));
   











































 











#line 272 "C:\\Keil\\ARM\\ARMCC\\bin\\..\\include\\time.h"



 

#line 18 "misc.c"














enum SmsTypeEnum
{
	SMSTYPE_GET,
	SMSTYPE_SET,
	
	SMSTYPE_NULL
};

u8	ModuleNoAck = 0;

static u8	SmsIndex;
static char	SmsContent[221];
char	SmsResponse[141];
u8	Flag_SmsConfig = 0;
u8	Flag_SmsHave = 0;
u8	TimerSms = 60;
u8	smsMax = 0;

u8  sms_index[4];
u8 smsc[20];

uint8_t Flag_ObtainCpsi = 0;
uint8_t SignalIntensity = 99;


typedef struct ThresHoldTag
{
	uint16_t		downValue;
	uint16_t		upValue;
} ThresHold;









uint8_t Flag_Custerm;
uint8_t Custerm_Set[90+1];
uint8_t count_custerm;
uint8_t	Flag_DisabeDoubleButton = 0;
uint8_t	Flag_SmsInit = 0;

uint8_t	TimerModemSleep = 0;
uint8_t	IsModemSleep;

uint8_t	SecondPoll = 0;
	
void Str2Speech(char *str);
void LogSendBySms(void);














const ThresHold  BATTERY_GAUGE[] =
{
	{0,				2410}, 
	{2404,			2504}, 
	{2497,			2559}, 
	{2553,			2597}, 
	{2590,			2630}, 
	{2626,			2855}, 
};

#line 132 "misc.c"

const Custerm_Item  CustermTable[] =
{
		
	{"BATTLOW",		  Custerm_BattLowLev	      },
	{"BATTEMPTY",		Custerm_BattEmptyLev	 		},
	{"LOWBATREP",		Custerm_BattReplaceLev	  },
	{"LOWBATDISC",	Custerm_BattDischargeLev	},
	
	{"APN", 		Custerm_Apn			},
	{"USERPW", 		Custerm_UserPw		},		
	{"IP1", 		Custerm_Ip1			},
	{"IP2", 		Custerm_Ip2			},	
	{"PHONE1", 		Custerm_Phone1 		},
	{"PHONE2", 		Custerm_Phone2 		},
	{"LOCALPORT", 	Custerm_LocalPort	},	
	{"DEFAULT",		Custerm_Default		},
	{"DELAY",		Custerm_Delay		},
	{"SIA",			Custerm_Sia			},
	{"FIBRO", 		Custerm_Fibro  		}, 
	{"CGSN",		Custerm_Imei		},
	{"DEBUG",		Custerm_Debug		},
	{"AGPS",		Custerm_Agps		},	
	{"VERSION",		Custerm_Version		},
	{"GPSURL", 		Custerm_Url			},	
	{"SMSPW", 		Custerm_SmsPw		},
	{"CCSQ", 		Custerm_Csq			},
	{"LOG",			Custerm_Log 		},
	{"GPSINFO",		Custerm_GpsInfo		},
	{"CALL",		Custerm_Call		},
	{"END",			Custerm_End			},
	{"CLEANLOG",	Custerm_LogClean	},
	{"BAT",			Custerm_Bat			},
	{"ICCID",		Cutterm_Iccid		},

	
	{0, 0}
};

static void DelayUntil(uint8_t delay, char * rsq);
static void PhoneInit(void);
void findUdp(void);
double StrToDouble(char* Str, uint8_t Len);
static void saveSmsIndex(u8 * str);
static void BatteryIndicate(uint16_t adc);
static uint8_t StandbyTimerHandle(uint8_t	s);
static void CallActive(void);
static uint8_t EndCall(void);
static u8 GetGsmSigal(void);
static void CsqPlay(u8 level);


void WatchdogInit(void)
{
	((WDT_T *) ((( uint32_t)0x40000000) + 0x4000))->WTCR = (((1ul << 7) | (1ul << 3) | (1ul << 0) | ((6) << 8)) | (1ul << 6) | (1ul << 1));
}


void FeedWatchdog(void)
{
	(((WDT_T *) ((( uint32_t)0x40000000) + 0x4000))->WTCR |= (1ul << 0));
}

void SoftReset(void)
{



	debug("SoftReset");


	


	Flag_Power_Down = 1;
	TimerPowerDown = 100;
	TimerStandby = 0;

}

void delay_ms(uint16_t ms)
{
	volatile uint16_t 	i;
	volatile uint16_t	j;
	
	for(i=0; i<ms; i++)
	{



		for(j=0; j<430; j++)  

		{
			__nop();__nop();__nop();__nop();__nop();
			__nop();__nop();__nop();__nop();__nop();
			__nop();__nop();__nop();__nop();__nop();
			__nop();__nop();__nop();
		}
	}
}

#line 257 "misc.c"

void delay_50ms(uint8_t ms)
{
	sdly = ms;
	while(sdly && !Flag_Power_Down)
	{
		FeedWatchdog();
	}
}



void SendDebug(uint8_t *atcmd, uint8_t length)
{ 
	while(length--)
	{
	    while( (((((UART_T *) ((( uint32_t)0x40000000) + 0x50000)))->FSR & (1ul << 23))>>23) == 1 );
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->DATA = *atcmd++;
	}
} 

void SendDebugString(uint8_t *atcmd)
{ 
	while(*atcmd!='\0')
	{
	    while( (((((UART_T *) ((( uint32_t)0x40000000) + 0x50000)))->FSR & (1ul << 23))>>23) == 1 );
		((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->DATA = *atcmd++;
	}
} 

void debug(unsigned char *string)
{ 	
	SendDebugString(string);
	SendDebugString("\r\n");
}

#line 328 "misc.c"

void debug_16(u8 *string, u16 value, u8	lf)
{ 	
	u8	i;
	u8	txt[3]={0};
	
	SendDebugString(string);
	SendDebugString(":");
	i = value >> 8;
	Hex2Txt(i, txt);
	SendDebugString(txt);
	i = (u8)(value & 0xff);
	Hex2Txt(i, txt);
	SendDebugString(txt);
	if( lf )
		SendDebugString("\r\n");
}

void debug_8(unsigned char *string, u8 value, u8	lf)
{ 	
	u8	txt[3] = {0,0,0};
	
	SendDebugString(string);
	SendDebugString(":0x");
	Hex2Txt(value, txt);
	SendDebugString(txt);
	if( lf )
		SendDebugString("\r\n");
}

#line 374 "misc.c"

const u8  table[16]=
{	'0','1','2','3','4','5','6','7',
		'8','9','A','B','C','D','E','F'	
};	

void Hex2Txt(u8 hex, u8 *txt)
{
	txt[0] = table[hex>>4];
	txt[1] = table[hex&0x0f];
}

void Hex2String(u8 *hexStr, u8 hexLen, u8 *str)
{
	u8	hex, j=0;
	u8 	i;
	
	for(i=0; i<hexLen; i++)
	{
		hex = hexStr[i];
		str[j++] = table[hex>>4];
		str[j++] = table[hex&0x0f];
	}
	str[j] = 0;
}


#line 408 "misc.c"

u8 Str2Hexs(u8 *str, u8 hexMax, u8 *hexs)
{ 	
	u8	i, j, k=0;
	u8 	len = strlen((char *)str);
	
	hexMax <<= 1;
	len = (len > hexMax) ? hexMax : len;
	
	for(i=0; i<len; i++)
	{
		j = str[i];
		if ( j >= '0' && j <= '9' )
			j = j - '0';
		else if( j >= 'A' && j <= 'F' )

			j =  j - 'A' + 10;
		else if( j >= 'a' && j <= 'f' )
			j = j - 'a' + 10;
		else
			return 0;
		if( i & 1)
			hexs[k++] += j;
		else
			hexs[k] = j << 4;
	}

	
	return 1;
}

void Dec2Txt(u8 dec, u8 *txt, u8 fill)
{	
	u8	i = 0;
	

	if(dec >= 100)
	{
		txt[0] = table[dec/100];
		dec %= 100;
		txt[1] = table[dec/10];
		txt[2] = table[dec%10];
		txt[3] = 0;
	}
	else if(dec>=10)
	{
		if( fill  >= 3)
			txt[i++]= '0';
		txt[i++] = table[dec/10];
		txt[i++] = table[dec%10];
		txt[i] = 0;
	}
	else
	{
		if( fill >= 2 )
		{
			txt[i++]= '0';
			if( fill >= 3 )
				txt[i++]= '0';
		}
		txt[i++] = table[dec];
		txt[i] = 0;
	}
}

void DEC2Txt(u16 dec, u8 *txt, u8 fill)
{	
	
	u8	i = 0;
	
		if(dec >= 1000)
	{
		txt[0] = table[dec/1000];
		dec %= 1000;
		txt[1] = table[dec/100];
		dec %= 100;
		txt[2] = table[dec/10];
		txt[3] =  table[dec%10];
		txt[4] = 0;
	} else
	if(dec >= 100)
	{
		txt[0] = table[dec/100];
		dec %= 100;
		txt[1] = table[dec/10];
		txt[2] = table[dec%10];
		txt[3] = 0;
	}
	else if(dec>=10)
	{
		if( fill  >= 3)
			txt[i++]= '0';
		txt[i++] = table[dec/10];
		txt[i++] = table[dec%10];
		txt[i] = 0;
	}
	else
	{
		if( fill >= 2 )
		{
			txt[i++]= '0';
			if( fill >= 3 )
				txt[i++]= '0';
		}
		txt[i++] = table[dec];
		txt[i] = 0;
	}

}

void ClkInit(void)
{
	 SYS_UnlockReg();
	 
#line 557 "misc.c"

	((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->PWRCON = (1ul << 0) | (1ul << 3);
	SYS_WaitingForClockReady( (1ul << 0) | (1ul << 3) );

	 
	((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKSEL0 = 0x00UL | 0x00UL;

	 
	((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->PLLCON |= (1ul << 16);
	((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->PLLCON |= (1ul << 18);

	 		 
	((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->APBCLK =  (1ul << 28) | 0 |
						(1ul << 17) | (1ul << 16) | 
						(1ul << 6) |	(1ul << 0); 

	 
	((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKSEL1 =  0x00000000UL |
						 0x00000008UL | 0x00000003UL;

	((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKSEL2 = 0x00000000UL;

		
	 
	((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->CLKDIV = (((7)-1) << 16) |  
						(((1)-1) << 8) | 
						((1)-1);	

	 
	 
	SystemCoreClockUpdate(); 
	

}

void UartInit(void)
{
	 
	(((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->P3_MFP = (((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->P3_MFP & (~0x00000101UL)) | (0x00000001UL));
	(((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->P3_MFP = (((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->P3_MFP & (~0x00000202UL)) | (0x00000002UL));



	((((UART_T *) ((( uint32_t)0x40000000) + 0x50000)))->FUNSEL = ((0x0 << 0)));
     



 	((UART_T *) ((( uint32_t)0x40000000) + 0x50000))->BAUD = ((1ul << 29) | (1ul << 28)) | ((((12000000UL) + (115200/2)) / 115200)-2);

    ((((UART_T *) ((( uint32_t)0x40000000) + 0x50000)))->LCR = ((3) | (0x0 << 3) | (0x0 << 2)));

	((((UART_T *) ((( uint32_t)0x40000000) + 0x50000)))->IER |= (((1ul << 0) | (1ul << 4))));
	NVIC_EnableIRQ(UART0_IRQn);



     
	(((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->P1_MFP = (((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->P1_MFP & (~0x00000404UL)) | (0x00000400UL));
	(((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->P1_MFP = (((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->P1_MFP & (~0x00000808UL)) | (0x00000800UL));
	
	((((UART_T *) ((( uint32_t)0x40100000) + 0x50000)))->FUNSEL = ((0x0 << 0)));



	((UART_T *) ((( uint32_t)0x40100000) + 0x50000))->BAUD = ((1ul << 29) | (1ul << 28)) | ((((12000000UL) + (115200/2)) / 115200)-2);

	((((UART_T *) ((( uint32_t)0x40100000) + 0x50000)))->LCR = ((3) | (0x0 << 3) | (0x0 << 2)));

	((((UART_T *) ((( uint32_t)0x40100000) + 0x50000)))->IER |= (((1ul << 0) | (1ul << 4))));
	NVIC_EnableIRQ(UART1_IRQn);

	(((FMC_T *) ((( uint32_t)0x50000000) + 0x0C000))->ISPCON |= (1ul << 0));
}

void AdcInit(void)
{
    ADC_ResetIP();

    NVIC_DisableIRQ(ADC_IRQn);

	 
	((GPIO_T *) (((( uint32_t)0x50000000) + 0x4000) + 0x0040))->OFFD = (1UL << ((0)+16));
	 
	(((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->P1_MFP = (((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->P1_MFP & (~0x00000101UL)) | (0x00000001UL));

	 
	((ADC_T *) ((( uint32_t)0x40000000) + 0xE0000))->ADCR = ((0UL<<2) | (0UL<<10) | (1UL<<0));
	 
	(((ADC_T *) ((( uint32_t)0x40000000) + 0xE0000))->ADCHER |= ((((ADC_T *) ((( uint32_t)0x40000000) + 0xE0000))->ADCHER&~(0xFFul << 0))|(0)));           
}

void ModulePowerOn(uint8_t on)
{
	if( on )
	{

		(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x200)+(0x20*(2))) + ((5)<<2)))) = 1;
	}
	else
	{

		(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x200)+(0x20*(2))) + ((5)<<2)))) = 0;
	}
}


void LedTigger(void)
{
	(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x200)+(0x20*(1))) + ((4)<<2)))) = !(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x200)+(0x20*(1))) + ((4)<<2))));
}


void ModuleOn(uint8_t on)
{
	if( on )
	{
		(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x200)+(0x20*(0))) + ((1)<<2)))) = 1;

	}
	else
	{
		(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x200)+(0x20*(0))) + ((1)<<2)))) = 0;

	}
}


void LockPower(uint8_t enable)
{



		(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x200)+(0x20*(3))) + ((6)<<2)))) = enable;






}

uint8_t PressBatter(void)
{
	if ( !(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x200)+(0x20*(3))) + ((4)<<2)))) )
	{
		delay_ms(3);
		return( !(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x200)+(0x20*(3))) + ((4)<<2)))) );
	}

	return 0;
}

uint8_t PressHelp(void)
{
	if ( !(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x200)+(0x20*(3))) + ((5)<<2)))) )
	{
		delay_ms(3);
		return( !(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x200)+(0x20*(3))) + ((5)<<2)))) );
	}

	return 0;
}



void ModemSleep(uint8_t on)
{

	debug_8("sleep", on, 1);

	IsModemSleep = on;
 	if( on )
	{
		(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x200)+(0x20*(0))) + ((4)<<2)))) = 0;
	}
	else
	{
		(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x200)+(0x20*(0))) + ((4)<<2)))) = 1;
	}

}	
	
void AdcStart(void)
{	
	 
	(((ADC_T *) ((( uint32_t)0x40000000) + 0xE0000))->ADSR = (1ul << 0));
	(((ADC_T *) ((( uint32_t)0x40000000) + 0xE0000))->ADCR |= (1ul << 1));
	NVIC_EnableIRQ(ADC_IRQn);
	(((ADC_T *) ((( uint32_t)0x40000000) + 0xE0000))->ADCR |= (1ul << 11));
}

void WhatToDo(void)
{
	while( !PressHelp() && !PressBatter() ){
	}

	
	


#line 768 "misc.c"
}

void WaitLockPower(void)
{
	module_PowerOn();


	if( PressHelp() )
	{
		isCheckingBattery = 0;
	}
	else
	{
		isCheckingBattery = 1;
	}


	if( isCheckingBattery )
	{
		dlyct1 = 52;
	}
	else 
	{
		dlyct1 = 35;
	}
	
	while(dlyct1)
	{
		if( PressHelp() && PressBatter() )
		{
			isCheckingBattery = 0;
			state = STATE_TEST;
			
		}
	}	
	
	
LockPower(1);
	
	debug("0.29");
	
	
	
			if (custermParam.param.lockState && !PressBatter()) {
																						LedDark();
																					}
  
																					else {LedBlink();}
	
	
  
	
	if(state == STATE_TEST)
	{
		Flag_DisabeDoubleButton = 1;
		debug("test mode");
	}
}

void MeasurePower(uint8_t cnt)
{
	uint8_t		i = 0, Interval = 15;
	uint16_t	ad = 0;


	AdcStart();
	dlyct1 = Interval;
	do
	{
		if( dlyct1 == 0 )
		{
			
			ad += adc_result;
			i++;
			if( i < cnt )
			{
				AdcStart();
				dlyct1 = Interval;
			}
		}
		
	} while( i < cnt );

	adc_result = ad / cnt;
	

}

void PowerOn(void)
{
	uint16_t temp = adc_result;

	adc_result = 0;
	
	if(state == STATE_TEST)
	{ 
		
		
		
		progress = TEST_VERSION;
		TimerGps = 0;
		enter_test_mode(progress);
	}
	else if( isCheckingBattery )
	{
		delay_50ms(40);
		
		BatteryIndicate(temp);
		
		TimerWait = 200;	
		state = STATE_BATT_DISPLAY;
	}
	else
	{

		if(temp < custermParam.param.battDischargeLev)
		{ PlayVoice("\"batteryLow.wav\",2\r");
			delay_50ms(40);
			PlayVoice("\"replaceBattery.wav\",2\r");
			Flag_Power_Down = 1;
			TimerWait = 100;
		}
		else
		if(temp < custermParam.param.battEmptyLev)
		{ 
			PlayVoice("\"replaceBattery.wav\",2\r");
			delay_50ms(40);
			Flag_LowBat = 1;
			
			
		}
		else

		{	
			if(temp < custermParam.param.battLowLev)
			{
				PlayVoice("\"batteryLow.wav\",2\r");
				delay_50ms(40);
			}
			
			PlayVoice("\"h.wav\",2\r");			
			HelpKey = 1;
			PhoneInit();
			
			if( Flag_SimExist )
				UdpPacketInit();

			SendAtWaitRsq(100, 6, 0, "AT&W\r\n");
		}		
	}

}

#line 943 "misc.c"

void BatterCheck(void)
{
	static uint16_t adc_bak = 0;
	
	if( adc_result )
	{
		if( adc_bak )
			adc_bak = (adc_result + adc_bak) >> 1;
		else
			adc_bak = adc_result;

		LowValtageWarnning(adc_bak);

		adc_bak = adc_result;
		adc_result = 0;
	}
	
	if(TimerBattery == 0)
	{
		if( state==STATE_1ST_CALL
			|| state == STATE_REGISTER_OK
			|| state == STATE_POWERING_DOWN
			|| isCheckingBattery == 1
			|| state == STATE_TEST )
			return;
		
		TimerBattery = 180;
		AdcStart();
	}
}

void SecondHandle(void)
{	
	char 	*p;
	u8		i = 0, j=0;
	u8		st = 0;

	while(TimerSecond >= 20)
	{
		TimerSecond -= 20;
		i++;
	}
	
	if( i == 0 )
		return;

 
	if( StandbyTimerHandle(i) )
		return;
	
 
#line 1003 "misc.c"
	

 
	if( TimerGps   && Flag_GpsStart )
	{
		TimerGps = (TimerGps>i) ? (TimerGps-i) : 0;
		if( TimerGps==0 && Flag_SimExist  )
		{
			if( (state == STATE_TEST) || (state >= STATE_GSM_STEADY && state != STATE_STANDBY))
			{
				SendAtCommand("AT+CGPSINFO\r\n");
				module_WaitResponse(100);

				p = strstr((char *)(&tc35data[g_rsq]), "+CGPSINFO:");
				if( p )
				{

					if(p[10] != ',')

						GpsDataHandle();
				}
			}
				
			TimerGps = 20;
		}
	}

 
	TimerSms = (TimerSms>i) ? (TimerSms-i) : 0;

 
	j = i;

	while( i-- )
	{
		if(SystemTime == 0xff)
			break;
		
		SystemTime++;
		switch(SystemTime)
		{
#line 1050 "misc.c"

		case 14:
			GpsStart_2();
			break;

		case 12:
			SmsInit();
			break;

		default:
			break;
		}
#line 1091 "misc.c"
	}

	while( j-- )
	{
		SecondPoll++;
		if((progress==TEST_GPS) && (Flag_ObtainGps==0) && ((SecondPoll&0x1f)==0x1f))
		{
			PlayVoice("\"waitGPS.wav\",2\r");
		}

		if((state<STATE_CALL_PROMPT) && (state >=STATE_1ST_CALL) && ((SecondPoll&0x0f)==0x0f)) 
			PlayVoice("\"Pleasewait.wav\",2\r");

		if( IsInCall() && (SecondPoll % 6)==5 && st== 0 )	
		{
			QueryModuleSate();
			st = 1;
		}

		if( (gPhoneNumOk == PHONE_NUM_BUSY) && (SecondPoll & 0x0f)==0x0e  && (state < STATE_STANDBY) && (Flag_SimExist==1) )
			AccountGet();

		if( (progress>=TEST_GPS) 
			&& (Flag_ObtainCpsi==0) && (Flag_ObtainGps==0)
			&& (SystemTime & 3)==3 ) 
		{

			GetCpsiInfo();
			
		}
	}
	
}

void KeyHandle(void)
{ 


	if( LongHelpKey )
	{  
		LongHelpKey = 0;
		if((state==STATE_STANDBY) && (BattKey==0) && !PressBatter() )
		{  
			
			ModemSleep(0);
			TimerStandby = 0;
			callTimes = 0;
			logSet = 0;
			delay_50ms(40);
			udpParamInit();
			EnterCall();
			if(sockState >= SOCKSTATE_CONNECT_OK)
				sockState = SOCKSTATE_CONNECT_OK;
		}
	}


	if( LongBattKey )
	{
		LongBattKey = 0;
		if((state==STATE_STANDBY) && (HelpKey==0) && !PressHelp() )
		{
			
			ModemSleep(0);
			delay_50ms(40);
			MeasurePower(4);
			BatteryIndicate(adc_result);
			adc_result = 0;
			delay_50ms(40);
			ModemSleep(1);
			
		}
	}


	if( GetKeyBatt() )
	{							
		if(state == STATE_ACTIVE || state == STATE_ALERT)
		{
			curVolume = (curVolume + 1 ) % 7;
			AdjustVolume(curVolume);
			
		}
		else if( state==STATE_TEST )
		{
			enter_test_mode(++progress);
		}
	}

	if(GetKeyHelp() && isCheckingBattery==0)
	{
		switch( state )		
		{
		case STATE_ACTIVE:
		case STATE_ALERT:
			if( Flag_SimExist==0 || callTimes >= 10)
			{
				SendAtCommand("AT+VTS=1,0\r\n");
				module_WaitResponse(20);
			}
			else
			{
				ResendGpsSig();
			}
			break;
			
		case STATE_INCOMMING:
			callTimes = 0;
			logSet = 0;
			EnterAnswer();
			break;
			
		default:
			break;
		}		
		
	}
	
}

void enter_test_mode(uint8_t progress)
{
	u8	level;


			
	switch(progress)
	{ 
		
	case TEST_VERSION:
	  Flag_Power_Down = 0;
		Flag_async_Power_Down = 0;
		sockState = SOCKSTATE_NULL;
		state = STATE_TEST;
		delay_50ms(40);
		PlayVoice("\"unitInTest.wav\",2\r");	
		PhoneInit();
		
		
		Str2Speech("0.29");

		GetKeyBatt();
		GetKeyHelp();
		break;

	case TEST_GPS:
    
		TimerGps = 2;
		PlayVoice("\"waitGPS.wav\",2\r");
		SockOpen();
		break;

	case TEST_BATT:

	{ 
		char adcStr[5];
		MeasurePower(4);
		BatteryVoltage(adc_result, adcStr);
		Str2Speech(adcStr);
		break;
	}
	
	case TEST_CSQ:
		
		level = GetGsmSigal();
		CsqPlay(level);
		break;
		
	case TEST_LOOP:
		PlayVoice("\"loopTest.wav\",2\r\n");
		delay_50ms(40);	
		
		SendAtWaitRsq(50, 6, 0, "AT+CTXGAIN=65000;+CTXVOL=65000;+CRXGAIN=65000;+CRXVOL=100\r\n");
	  delay_50ms(40);
	  SendAtWaitRsq(50, 6, 0, "AT+CMICAMP1=1;+CLVL=7;+CECM=0\r\n");
		delay_50ms(40);
	  SendAtWaitRsq(80, 6, 0, "AT+CLOOPBACK=3,1\r\n");
		break;

	default:
		SendAtWaitRsq(50, 6, 0, "AT+CLOOPBACK=3,0\r\n");
		delay_50ms(40);
		ModemAudioInit();
		EnterPowerDown();
		break;

	}
}

void LowValtageWarnning(uint16_t batteryvoltage)
{

	static uint8_t lowValtageCnt = 0;
	static uint8_t cutoffCnt = 0;

	

	if(batteryvoltage < custermParam.param.battEmptyLev)
	{
		++lowValtageCnt;
		++cutoffCnt;
		
		if( (state != STATE_TEST) 
			&& (cutoffCnt > 3)
			&& (state < STATE_BYE) )
		{
			PlayVoice("\"replaceBattery.wav\",2\r");
			TimerStandby = 0;
			Flag_Power_Down = 1;
			TimerPowerDown = 80;
		}

	}
	else if(batteryvoltage<custermParam.param.battLowLev && Flag_LowBat==0)
	{
		++lowValtageCnt;
		cutoffCnt = 0;
		Flag_LowBat = 1;
		if( (state != STATE_TEST) 
			&& (lowValtageCnt > 2)
			&& (state < STATE_BYE) )
		{
			lowValtageCnt = 0;
			PlayVoice("\"batteryLow.wav\",2\r");
		}
	}
	else
	{
		cutoffCnt = 0;
		lowValtageCnt = 0;
	}

}

#line 1391 "misc.c"

#line 1419 "misc.c"

#line 1443 "misc.c"

void DisplaySignalLevel(uint8_t signallevel)
{
	static uint8_t	SignalLowCnt = 0;
	
	if(signallevel<6 || signallevel==99)
	{
		SignalLowCnt++;




	}	
	else
	{
		SignalLowCnt = 0;
		
	}
}

#line 1497 "misc.c"

const static uint8_t *MUSIC_FILE[] = 
{
	"\"h.wav\",2\r\n",	
	"\"e.wav\",2\r\n",	
	"\"a.wav\",2\r\n",	
	"\"f.wav\",2\r\n",	
	"\"h2.wav\",2\r\n",	

	"\"poweredOff.wav\",2\r\n",	
};

void PlayMusic(uint8_t index)
{
	if(index >= MUSIC_NUM)
		return;
	
	SendAtCommand("AT+CCMXPLAYWAV=");
	SendAtCommand((uint8_t *)(MUSIC_FILE[index]));
	module_WaitResponse(50);	
}


void EnterCall(void)
{

	callTimes++;
	debug_8("EntCall callTms: ", callTimes, 1);

	if(state >= STATE_CALL_PROMPT)
	{
		if(Flag_SimExist && (callTimes<=9))
			PlayMusic(MUSIC_HELP_CALL);
		else
			PlayMusic(MUSIC_911_CALL);
		
		TimerWait = 60;	
	}
	else
	{
		TimerWait = 1;
	}


	if(callTimes == 1)
		LogOnOff(0);
	
	state= STATE_CALL_PROMPT;
}

void EnterAnswer( void )
{
	u8	result = 0;
	u8	cnt = 2;
		
	while(result==0 && cnt-- )
	{
		SendAtCommand("ATA\r\n");

		sdly = 200;
		while(sdly && !Flag_Power_Down)
		{
			if( strstr((char *)&tc35data[g_rsq], "VOICE CALL: BEGIN") )
			{
				result = 1;
				break;
			}
			else if( strstr((char *)&tc35data[g_rsq], "MISSED_CALL") )
			{
				result = 2;
				break;
			}
			
			FeedWatchdog();
		}
	}

	switch( result )
	{
	case 1:
		CallActive();
		break;
		
	case 2:
		TimerStandby = custermParam.param.delay;
		EnterStandby();
		break;
		
	default:
		TimerStandby = custermParam.param.delay;
		HuangupCall();
		

		PlayMusic(MUSIC_FAIL);
		Flag_Power_Down = 1;
		TimerPowerDown = 60;

		break;
	}
		
}

void Redial(void)
{
	EnterCall();
}

void EnterStandby(void)
{
	

	if(state == STATE_STANDBY)
		return;

	state = STATE_STANDBY;

	

	GpsStop();
	if( TimerStandby )
	{




		if( sms_index[0] != 0xff )
			TimerModemSleep = 40;
		

	}
	

}


void EnterPowerDown(void)
{
	if(state == STATE_POWERING_DOWN)
		return;
	
	ModemSleep(0);
	delay_50ms(20);
	PlayMusic(MUSIC_PD);
	TimerWait = 60; 
	state = STATE_POWERING_DOWN;

	if( gLogPowerDownExpect )
		LogOnOff(1);
}

void Call(void)
{

	uint8_t	i = 20;

	debug_8("Call callTms: ", callTimes, 1);

	SendAtCommand("ATD");
	if(Flag_SimExist==0 || (callTimes > 9))
		SendAtCommand("911");
	else if(callTimes <= 3)
		SendAtCommand((uint8_t *)custermParam.param.phone1);
	else if(callTimes <= 6)
		SendAtCommand((uint8_t *)custermParam.param.phone2);
	else if(callTimes <= 9)
		SendAtCommand((uint8_t *)custermParam.param.phone1);

	SendAtCommand(";\r\n");
		
	TimerSecond = 0;
	while(!Flag_Power_Down)
	{
		if(TimerSecond >= 20)
		{
			TimerSecond -= 20;
			if(--i == 0)
				break;
		}
		
		if(Flag_EndWithCr==1)
		{
			if( strchr((char *)&tc35data[g_rsq], '0') || strchr((char *)&tc35data[g_rsq], '3') )
				break;	
			else
				Flag_EndWithCr = 0;
		}
		FeedWatchdog();
	}






	if( i && strstr((char *)&tc35data[g_rsq], "0\r") )
	{
		state = STATE_ALERT;
		TimerWait = 1800;	
	}
	else if(Flag_Power_Down==0)
	{
		EnterCallFail();
	}

}

void PowerDown()
{
	if( isCheckingBattery == 0 )
	{
		SendAtWaitRsq(50, 3, 0, "AT+CPOF\r\n");
		delay_50ms(65);
	}

	LedDark();
	LockPower(0);
	

	ModulePowerOn(1); 
	delay_50ms(16);
	ModulePowerOn(0);
	
	while(1)
	{
		
	}
}

void EnterEndCall(void)
{
	while( TimerPowerDown )
		FeedWatchdog();;
	

	if( Flag_TxInitOk )
	{
		state = STATE_BYE;
		SIAEventPacketCreate(Flag_ObtainGps, Flag_LowBat, 1);
		UdpSend();
	}
	else

	{
		EnterStandby();
	}
}

void EnterCallFail()
{
	state = STATE_NEXT_CALL;
	HuangupCall();		

	if(callTimes < 10)
	{
		TimerWait = 200; 
		PlayMusic(MUSIC_FAIL);
		if(sockState==SOCKSTATE_OPENNING&& Flag_SimExist)
			TimerSock = 20;
	}
	else
	{
		PlayMusic(MUSIC_AGAIN);
		TimerStandby = 0;
		Flag_Power_Down = 1;
		TimerPowerDown = 100;
	}

}


uint8_t GpsDataHandle(void)
{
	char 		*p, *ptr, *ptr1;
	char		Latitude[15];
	char		Longitude[15];
	uint8_t		i, j, k;
	uint32_t	f;

	p = (char *)(&tc35data[g_rsq]);
	
#line 1784 "misc.c"




	ptr = strchr(p, ',');
	if(ptr==0)
		return 0;

	i = 0;
	ptr1 = &p[10];
	if(ptr-ptr1 >= 15)
		return 0;
	
	while(ptr1 != ptr)
		Latitude[i++] = *(ptr1++);
	Latitude[i] = 0;





	ptr1 = strchr((char *)ptr+1, ',');
	if(ptr1==0)
		return 0;
	
	ptr = strchr((char *)ptr1+1, ',');
	if(ptr==0)
		return 0;

	i = 0;
	ptr1++;
	if(ptr-ptr1 >= 15)
		return 0;
	
	while(ptr1 != ptr)
		Longitude[i++] = *(ptr1++);
	Longitude[i] = 0;	





	i = 0;
	while(Latitude[i] && Latitude[i]!='.')
		i++;

	if(i<2 || Latitude[i]!='.')
		return 0;

	for(k=0; k<i-2; k++)
		gpsInfo[k] = Latitude[k];
	gpsInfo[k++] = '.';

	j = i;		
	while( Latitude[j] )
	{
		Latitude[j] =  Latitude[j+1];
		j++;
	}

	j = strlen(&Latitude[i-2]);
	f = StrToInt(&Latitude[i-2], j);	

	for(; j>7; j--)	
	{
		f /= 10;
	}	

	for(; j<7; j++)
		f = f * 10;
	
	f = f/6;
	
	sprintf(Latitude, "%06ld", f);
	strncpy((char *)&gpsInfo[k], Latitude, 6);
	k += 6;
	

	i = 0;
	while(Longitude[i] && Longitude[i]!='.')
		i++;

	if(i<2 || Longitude[i]!='.')
		return 0;

	gpsInfo[k++] = ',';
	gpsInfo[k++] = '-';
	for(j=0; j<i-2; j++)	
		gpsInfo[k++] = Longitude[j];
	gpsInfo[k++] = '.';

	j = i;		
	while( Longitude[j] )
	{
		Longitude[j] =  Longitude[j+1];
		j++;
	}

	j = strlen(&Longitude[i-2]);
	f = StrToInt(&Longitude[i-2], j);	

	for(; j>7; j--)	
	{
		f /= 10;
	}	

	for(; j<7; j++)
		f = f *10;

	f = f/6;

	sprintf(Longitude, "%06ld", f);
	strncpy((char *)&gpsInfo[k], Longitude, 6);
	k += 6;
	

	if( state==STATE_TEST && progress>=TEST_GPS && Flag_ObtainGps==0)
		PlayVoice("\"GPSreceived.wav\",2\r");
	
	LedLight(40);
	
	

	Flag_ObtainGps = 1;






	return 1;
}

static void AtProxy(uint8_t *str)
{
	char  *p;
	
	p = strchr((char *)str+2, '\r');
	if( p )
	{
		p[1] = 0;
		
		SendAtCommand(Custerm_Set);
		module_WaitResponse(100);
		delay_50ms(5);
		if( Flag_MsgDebug == 0)
			SendDebugString( &tc35data[g_rsq]);
	}
	else
	{
		SendDebugString( "ERR\r\n" );
	}
}

void MsgHandle(void)
{
	char  *p, *p2;
	
	if(Flag_EndWithCr==1)
	{
		if(state==STATE_ALERT && strstr((char *)tc35data, "VOICE CALL: BEGIN"))
		{





			CallActive();

		}
		else if( (state==STATE_ACTIVE || state==STATE_ALERT)
			&& strstr((char *)tc35data, "VOICE CALL: END"))
		{
#line 1968 "misc.c"
			EndCall();

			delay_50ms(20);
			TimerSock += 35;
		}
		else if(state == STATE_INCOMMING
			&& strstr((char *)tc35data, "MISSED_CALL:"))
		{
			TimerStandby = custermParam.param.delay;
			EnterStandby();
		}
		
		if( sockState == SOCKSTATE_OPENNING 
			&& ( strstr((char *)tc35data, "Network opened") 
				|| strstr((char *)tc35data, "Network is already opened")) )
		{
			sockState = SOCKSTATE_OPENED;
			SockConnect();
			if(state == STATE_GSM_STEADY )
				TimerWait = 100; 
		}	
		else if(  sockState == SOCKSTATE_OPENED			
			&&  strstr((char *)tc35data, "Connection is already created") ) 
		{ 
			sockState = SOCKSTATE_CONNECT_OK;
			TimerWait = 20;
		}	
			
#line 2004 "misc.c"

#line 2017 "misc.c"
	
		if(state >= STATE_REGISTER_OK
			&& strstr((char *)tc35data, "START"))
		{
			




		}

		
		
		
		p = strstr((char *)tc35data, "+CMTI: ");
		if( p )
		{	
			
			TimerSms = 1;
			
			p2 = strchr(p+8, ',');
			if( p2 )
			{
				saveSmsIndex((u8 *)p2+1); 
			}
			
			if( state == STATE_STANDBY )
			{
				TimerModemSleep += 40;
				if( IsModemSleep == 1 )
					ModemSleep( 0 );
			}
		}


		if( STATE_ACTIVE == state )
		{
			p = strstr((char *)tc35data, "+RXDTMF: ");
			if( p )
			{	
				switch(p[9])
				{
					case '4':
						if(curVolume < 7-1)
						{
							curVolume++;
							AdjustVolume(curVolume);
						}
						break;
						
					case '7':
						if(curVolume > 0)
						{
							curVolume--;
							AdjustVolume(curVolume);
						}
						break;
					case '9':
						
						
						PlayMusic(MUSIC_END);
					  EnterEndCall();
					  HuangupCall();
					  
						break;
					
				}
			}
		}
		



	}

	if( Flag_EndWithCr || Flag_FindCr )
	{
		if(sockState == SOCKSTATE_SENDDING)
		{	
			
			p = strstr((char *)tc35data, "RECV FROM:");
			if( p )
			{
				delay_ms(200);
				findUdp();
			}
			
			
		}

		ResetUartFlag();
	}
	
	if( Flag_Custerm ) 
	{
		if( strstr((char *)Custerm_Set, "AT") )
		{
			uint8_t	finish = 0;
			
			if( Custerm_Set[2] == '+' )
			{
				if( CustermHandle((char *)(Custerm_Set+3)) )
				{
					finish = 1;
				}					
			}
			
			if(finish == 0)
			{
				AtProxy(Custerm_Set);
			}
		}
		
		Flag_Custerm = 0;
		Custerm_Set[0] = 0;
		count_custerm = 0;
	}
		
	FeedWatchdog();
}




void findUdp(void)
{
	const char PREFIX[] = "+RECEIVE,";
	uint8_t	i, j, matchNum=0, length;
	uint8_t	buff[64];

	
	
	length = strlen(PREFIX);
	delay_ms(120);
	memcpy(buff, udp_buff+udp_buff_index, 64-udp_buff_index);
	memcpy(buff+(64-udp_buff_index), udp_buff, udp_buff_index);
	buff[64-1] = 0;
	
	
	for(i=0; i<64; i++)
	{
		if((64-i) < length)
		{
			return;
		}
		
		j = i;
		if(buff[j] == PREFIX[0])
		{
			for(j++,matchNum=1; matchNum<length; matchNum++,j++)
			{
				if(buff[j] != PREFIX[matchNum])
				{
					break;
				}
			}
			
			if(matchNum == length)
			{	
				for(; j<64; j++)
					if(buff[j] == ',')
						break;

				for(i=j; j<64; i++)
					if(buff[i] == ':')
						break;
					
				if(i>=64 || j-i > 3)
				{
					return;
				}	

				length = 0;
				for(j++; j<i; j++)
				{
					if(buff[j]>='0' && buff[j]<='9')
					{
						length = length*10 + (buff[j]-'0');
					}
					else
					{
						return;
					}
				}
				
				j += 3;		
				if(j >= 64)
				{
					return;
				}
				
				if(state != STATE_STANDBY)
				{
					udp_recv_length = (64-j > 18) ? 18 : 64-j;
					memcpy(udp_recv, buff+j, udp_recv_length);	
					Flag_RecvUdp = 1;
				}
				
				
				break;
			}

		}
	}
	
}


uint32_t StrToInt(char* Str, uint8_t Len)
{
	uint8_t		i, j;
	uint32_t	d = 0;
				
	if (Str == 0) 
	{
		return 0;
	}

	for(i=0; i<Len; i++)
	{
		if(Str[i]<'0' && Str[i]>'9') 
		{
			break;
		}
		else 
		{
			j = Str[i] - '0';
			d *= 10;
			d += j;
		}
	}
  
	return d;
}

uint8_t IsInCall(void)
{
	return ((state >= STATE_INCOMMING) && (state <= STATE_ACTIVE));
}

void InitMsgDebug(void)
{

	Flag_MsgDebug = (custermParam.param.debug=='0') ? 0 : 1;



}

void InitVariables(void)
{
	memset(udp_buff, 0, sizeof(udp_buff));
	udp_buff_index = 0;
	TimerSignal=0;
	ResetUartFlag();
	strcpy(gpsInfo, NOGPSINFO);
	strcpy(gMnc, "000");
	TimerSecond = 0;
	SystemTime = 0;

}


#line 2328 "misc.c"

#line 2343 "misc.c"

void PinStatusIndication(uint8_t status)
{
	switch( status )
	{
	case 2:
		Flag_SimExist = 0;
		PlayVoice("\"pinCodeIsWrong.wav\",2\r");
		debug("pin code err");
		break;
	
	case 3:
		Flag_SimExist = 0;
		PlayVoice("\"needPuk.wav\",2\r");
		debug("need puk !");
		break;

	case 1:
		break;
		
	default:
		Flag_SimExist = 0;
		PlayVoice("\"noSimCard.wav\",2\r");
		break;
	}
	
	if(status == 1 )
		DelayUntil(120, "+CPIN: READY");		
}


uint8_t PinHandle(uint8_t status)
{
	uint8_t	ret = status;

	delay_50ms(20);
	
	switch( status )
	{
	case 1:


		ret = LockPinCode(1, custermParam.param.pin_origin);
		if(1 == ret)
			ret = ChgPinCode(custermParam.param.pin_origin, custermParam.param.pin_use);

		PinStatusIndication( ret );
		break;
	
	case 4:
	case 0:

		
		
		
		PinStatusIndication( status );
		Flag_SimExist = 0;
		break;
		
	case 2:

		ret = ActiveSimLock(custermParam.param.pin_use, 0);

		PinStatusIndication( ret );
		break;
		
	case 3:
		
		
		
		debug("sim locked");
		PinStatusIndication( 3 );
		Flag_SimExist = 0;
		break;
	}
	


	return 1;
}

void Switch2Apn2(void)
{
	if( witchApn == 0)
	{
		SockClose();
		witchApn = 1;
		sockState = SOCKSTATE_NULL;
		SockOpen();
	}

}

static void PhoneInit(void)
{
	uint8_t		i;
	
	module_Init();
	i = GetSimPinStatus();
	ResetUartFlag();
	PinHandle( i );

	ModemNetworkInit();

	


	GpsStop();		
	ModemAudioInit();
}


static void DelayUntil(uint8_t delay, char * rsq)
{
	sdly = delay;
	while(sdly && !Flag_Power_Down)
	{
		if(Flag_EndWithCr==1)
		{
			if(strstr((char *)tc35data, rsq))
				break;
		}
		
		FeedWatchdog();
	}			
}	

#line 2478 "misc.c"

uint8_t Txt2Hex(uint8_t *txt)
{
	uint8_t	value;
	uint8_t	temp;

	temp = txt[0];
	if(temp >= 'A') 
		value = temp - 'A' + 0X0A;
	else
		value = temp - '0';
	value <<= 4;

	temp = txt[1];
	if(temp >= 'A') 
		value += (temp - 'A' + 0X0A);
	else
		value += (temp - '0');
	
	return value;

}

uint8_t Txt2Dec(char *txt, char length)
{
	uint8_t	value = 0;
	uint8_t	i;

	for(i=0; i<length; i++)
	{
		value *= 10;
		value += (txt[i]-'0');
	}
	
	return value;
}


void SmsInit(void)
{
	char  	*p, *p2;

	if( Flag_SimExist==0 || Flag_SmsInit==1)
		return;
	
	memset(sms_index, 0xff, 4);
		
	SendAtWaitRsq(50, 6, 0, "AT+CNMI=2,1,0,0,0\r\n");
	SendAtWaitRsq(50, 6, 0, "AT+CMGF=1\r\n"); 

	
	if( SendAtCmdRsq("AT+CPMS=\"SM\",\"SM\",\"SM\"\r\n", "+CPMS:") )
	{
		p = strchr((char *)(&tc35data[g_rsq]), ',');
		if( p != 0 )
		{
			p += 1;
			p2 = strchr((char *)p, ',');
			if( (p2 != 0) && (p2 - p <= 3) )
			{
				smsMax = Txt2Dec(p, p2-p);
			}
		}		
	}

	TimerSms = 12;


	if(smsMax > 0)
	{
		Flag_SmsInit = 1;
		SendAtWaitRsq(120, 6, 0, "AT+CMGD=,4\r\n");
	}
	debug_8("smsmax", smsMax, 1);
}

static void saveSmsIndex(u8 * str)
{
	u8	i, j;
	u8  temp[3];
	
	for(i=0; i<4; i++)
	{
		if(sms_index[i] == 0xff)
			break;
	}

	if(i >= 4)
	{
		
		return;
	}

	for(j=0; j<3; j++)
	{
		if(str[j] < '0' || str[j] > '9')
			break;
		temp[j] = str[j];
	}

	sms_index[i] = Txt2Dec((char *)temp, j);

}

void GetSmsContent(u8 index, char *pSms)
{
	u8	i;

	ResetUartFlag();
	SendAtCommand2("AT+CMGRD=", index);
	
	dlyct2 = 50; 
	while(!Flag_Power_Down)
	{
		if( Flag_EndWithCr==1 || dlyct2==0 )
		{
			 Flag_EndWithCr = 0;
			break;
		}
					
		FeedWatchdog();	
	}

	dlyct2 = 80; 
	while(!Flag_Power_Down)
	{
		if( Flag_EndWithCr==1 || dlyct2==0 )
		{
			 Flag_EndWithCr = 0;
			break;
		}
					
		FeedWatchdog();	
	}
	
	
	i = (Count_SL>220) ? 220 : Count_SL;
	memcpy(pSms, tc35data, i);
	pSms[i] = 0;
	
	debug_8("sms1", Count_SL, 1);
	debug((u8 *)pSms);
	debug("sms2");
}

u8	GetSmsMainBody(char	 *pSms)
{
	char		*p, *p2;
	uint16_t	length, offset, i, j;

	p = strchr(pSms, ',');
	if( !p )
		return 0;
	p++;
	if(*p++ != '\"')
		return 0;
	
	for(i=0; p[i]!='\"' && i<20; i++)
	{
		smsc[i] = p[i];
	}
	smsc[i] = 0;
	
	p2 = strchr(p, '\r');
	if( !p2 )
		return 0;
	length = strlen(pSms);
	offset = p2 - pSms;
	for(j=0,i=offset+1; i<length; )
	{
		pSms[j++] = pSms[i++];
	}
	pSms[j] = 0;
	
	return 1;
}


static char * GetNum(char *src, char *head, char *tail, u8 *num, u8 maxLength)
{
	char  		*p, *p2;
	
	p = strstr(src, head);
	if( p != 0 )
	{
		p += strlen(head);
		p2 = strstr(p, tail);
		if( (p2 != 0) && (p2 - p <= maxLength) )
		{
			*num = Txt2Dec(p, p2-p);
			return p2;
		}
	}	

	return 0;
}


u8	SmsHave()
{
	char  		*p, *p2;
	uint8_t		sum = 0;

	if( Flag_SmsInit == 0 )
	{
		SmsInit();
	}
	
	
	if( SendAtCmdRsq("AT+CPMS?\r\n", "+CPMS:") )
	{
		p = GetNum((char *)&tc35data[g_rsq], "\"SM\",", ",", &sum, 3);
		if( p )
		{
			if( smsMax == 0 )
			{
				p2 = p + 1;
				if( GetNum(p2, 0, ",", &smsMax, 3) == 0 )
					sum = 0;
			}
		}
		
	}

	debug_8("sms cnt", sum, 1);
	
	return sum;
}

u8 SmsExist(char *pSms)
{
	if( strncmp((const char *)pSms, "+CMS ERROR: 321", 15) == 0)
		return 0;

	return 1;
}

void SmsDel(u8 index)
{

	

	SendAtCommand2("AT+CMGD=", index);	
	module_WaitResponse(50);

}


u8 SmsAck(u8 *pSms)
{	
#line 2740 "misc.c"
	u8 end[3] = {0x1a, 0x0d, 0};

	SendAtCommand("AT+CMGS=\"");
	SendAtCommand( smsc );
	SendAtCommand("\"\r");

	if( WaitRsp(250, ">") == 0 )
		return 0;

	delay_ms(2);
	SendAtCommand(pSms);
	SendAtCommand(end);
	if( WaitRsp(250, "+CMGS") == 0 )
		return 0;

	return 1;


}

u8 SmsHeadVerify(char *pSms, u8 *offset)
{
	u8		SmsType = SMSTYPE_NULL;
	char	*p;
	u8		i = 0;
	
	if( strncmp((const char *)pSms, "SET", 3) == 0 )
	{
		SmsType = SMSTYPE_SET;
		i = 3;
	}
	else if( strncmp((const char *)pSms, "GET", 3) == 0 )
	{
		SmsType = SMSTYPE_GET;
		i = 3;
	}
	else
	{
		return SMSTYPE_NULL;
	}

	p = pSms + i;
	if( strncmp(p, custermParam.param.sms_pw, strlen(custermParam.param.sms_pw)) )
	{
		return SMSTYPE_NULL;
	}

	p += 4;
	if( !strchr((const char *)p, '#') )
	{
		return SMSTYPE_NULL;
	}
	
	*offset = i + 4 + 1;
	return SmsType;
	
}



void ConfigureBySms(char *pSms)
{
	u8	SmsType;
	char *p, *p2, *p3;
	u8	offset;

	SmsType = SmsHeadVerify(pSms, &offset);
	if( SmsType == SMSTYPE_NULL )
		return;

	debug_8("valid type", SmsType, 1);

	SmsResponse[0] = 0;
	Flag_SmsConfig = 1;
	p = pSms + offset;
	while( *p )
	{
		
		
		
		p2 = strchr(p, '#');
		if( !p2 )
			break;
		
		
		
		if( SmsType == SMSTYPE_GET )
		{
			*p2 = '?';
			p3 = p2;
		}
		else
		{
			p3 = strchr((char *)p2+1, '#');
			if( !p3 )
				break;
			
			
			
			*p2 = '=';
			*p3 = '\r';
		}
		
		if( !CustermHandle( p ) )
			break;
		p = p3 + 1;
		
	}

	if( SmsResponse[0] )
	{
		SmsAck( (u8 *)SmsResponse );
	}

	Flag_SmsConfig = 0;
}

void SmsHandle(void)
{
	u8	i;
	
	if( TimerSms || IsModemSleep==1 || (state==STATE_TEST && progress==TEST_VERSION))
		return;

	debug_8("SmsHandle", LogCnt, 1);
	
	TimerSms = 6;	

	if( LogCnt )
	{
		LogSendBySms();
		TimerSms = 20;	
		return;
	}
	
	if(sms_index[0] == 0xff)
	{
		if( SmsHave() )
		{
			if( !Flag_SmsHave )
			{
				SmsIndex = 0;
				Flag_SmsHave = 1;
			}
			else
			{
				SmsIndex = (SmsIndex+1) % smsMax;
			}
		}
		else
		{
			TimerSms = 45;	
			return;
		}
	}
	else
	{
		SmsIndex = sms_index[0];
		for(i=0; i<4-1; i++)
		{
			sms_index[i] = sms_index[i+1];
		}
		sms_index[i] = 0xff;

		if(sms_index[0] == 0xff)
			TimerSms = 45;	
	}
	
	GetSmsContent(SmsIndex, SmsContent);
	if( SmsExist( SmsContent ) && GetSmsMainBody(SmsContent))
	{
		debug(smsc);
		ConfigureBySms( (char *)SmsContent );
		
	}
	
}


void PlayVoice(const uint8_t *voice)
{
	SendAtCommand("AT+CCMXPLAYWAV=");
	SendAtCommand((uint8_t *)voice);
	module_WaitResponse(50);	
}

const static uint8_t *digit_files[] = 
{
	"\"0.wav\",2\r",
	"\"1.wav\",2\r",
	"\"2.wav\",2\r",
	"\"3.wav\",2\r",
	"\"4.wav\",2\r",
	"\"5.wav\",2\r",
	"\"6.wav\",2\r",
	"\"7.wav\",2\r",
	"\"8.wav\",2\r",
	"\"9.wav\",2\r",
	"\"dot.wav\",2\r"
};







 
void Str2Speech(char *ver)
{
	u8	j = strlen(ver);
	u8	i;
	
	for(i=0; i<j; i++)
	{
		if(ver[i] == '.')
			PlayVoice(digit_files[10]);
		else
			PlayVoice(digit_files[ver[i]-'0']);

		sdly = 50;
		while(sdly && !Flag_Power_Down)
		{
			if( strstr((char *)&tc35data[g_rsq], "stop") != 0 )
				break;
			FeedWatchdog();
		}
		
	}

}

const static uint8_t *strong_file[] = 
{
	"\"20per.wav\",2\r",
	"\"40per.wav\",2\r",
	"\"60per.wav\",2\r",
	"\"80per.wav\",2\r",
	"\"100per.wav\",2\r"
};

void StrongPlay(u8	i)
{
	if( i < 1 || i > 5 )
		PlayVoice(strong_file[i]);
}

void SmsRsqAdd(char *str)
{
	if(strlen(SmsResponse) + strlen(str) > 140)
		return;
	
	strcat(SmsResponse, str);
}

void LedLight(uint8_t ms_50)
{
	SysTick_DisableInt();

	LedMode = LEDMODE_LIGHT;
	(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x200)+(0x20*(1))) + ((4)<<2)))) = 0;	
	TimerLed = ms_50;
	
	SysTick_EnableInt();
}

void LedBlink()
{
	LedMode = LEDMODE_BLINK;
}

void LedDark()
{
	if(LedMode != LEDMODE_DARK)
	{
		LedMode = LEDMODE_DARK;
		(*((volatile uint32_t *)(((((( uint32_t)0x50000000) + 0x4000) + 0x200)+(0x20*(1))) + ((4)<<2)))) = 1;	
		TimerLed = 0;
	}
}

char * GetString(char *src, char *head, char *tail, char *str, u8 maxLength)
{
	char  		*p, *p2;
	u8			length;
	
	p = strstr(src, head);
	if( p != 0 )
	{
		p += strlen(head);
		p2 = strstr(p, tail);
		if( (p2 != 0) && (p2 - p <= maxLength) )
		{
			length = p2 - p;
			memcpy(str, p, length);
			str[length] = 0;
			return p2;
		}
	}	

	return 0;
}

void GetCpsiInfo(void)
{	

	char *p, *p2;
	char mnc[4];
	char lac[5];
	char cell[10];
	




	if( SendAtCmdRsq("AT+CPSI?\r\n", "+CPSI:") == 0 )
		return;

	p = GetString((char *)&tc35data[g_rsq], "-", ",", mnc, 3);
	if( !p )
	{
		p = GetString((char *)&tc35data[g_rsq], "-", " ", mnc, 3);
		if( !p )
			return;
	}


	
	p2 = GetString(p, "0x", ",", lac, 4);
	if( !p2 )
		return;


	p = GetString(p2, ",", ",", cell, 9);
	if( !p )
		return;
	

	
	Flag_ObtainCpsi = 1;

	strcpy(gpsInfo, mnc);
	strcpy(gMnc, mnc);
	strcat(gpsInfo, ".");
	strcat(gpsInfo, lac);
	strcat(gpsInfo, ",-");
	strcat(gpsInfo, cell);
	

}

static void BatteryIndicate(uint16_t adc)
{
	
	if(adc < custermParam.param.battEmptyLev)
		PlayVoice("\"replaceBattery.wav\",2\r");
	else if(adc < custermParam.param.battLowLev)
		PlayVoice("\"batteryLow.wav\",2\r");
	else
		PlayVoice("\"batteryOK.wav\",2\r");
}


void BatteryVoltage(uint16_t adc, char *voltageStr)
{
	uint8_t		i;
	
	adc = (adc * 10) / 62;
	voltageStr[0] = adc / 100 + '0';
	voltageStr[1] = '.';

	i = adc % 100;
	voltageStr[2] = i / 10 + '0';
	voltageStr[3] = i % 10 + '0';
	voltageStr[4] = 0;

}

static uint8_t StandbyTimerHandle(uint8_t s)
{	
	if( state != STATE_STANDBY )
		return 0;
	
	TimerModemSleep = (TimerModemSleep>s) ? (TimerModemSleep-s) : 0;
	if( TimerModemSleep==0 && IsModemSleep==0 )
	{
		if( SmsHave() || LogCnt )
			TimerModemSleep = 40;	
		else
			ModemSleep(1);
	}
		

	TimerStandby = (TimerStandby>s) ? (TimerStandby-s) : 0;

	
	if( TimerModemSleep && (TimerStandby<40) )
	{
		TimerStandby += 40;
	}
	else if( TimerStandby == 0 )
	{
		EnterPowerDown();
		return 1;
	}

	return 0;
}


uint8_t GetDateTime(char *time, uint8_t length)
{
	if( SendAtCmdRsq("AT+CCLK?\r\n", "+CCLK:") == 0 )
		return 0;

	if( GetString((char *)&tc35data[g_rsq], "\"", "+", time, length) )
		return 1;

	if( GetString((char *)&tc35data[g_rsq], "\"", "-", time, length) )
		return 1;
	
	return 0;
}

#line 3191 "misc.c"

void LogSendBySms(void)
{
	char buf[128];
	
	if( ReadLog(buf) == LOG_VALID )
	{
		strcpy(SmsResponse, "+LOG=");
		SmsRsqAdd(buf);
		SmsRsqAdd("#");
		SmsAck( (u8 *)SmsResponse );
	}
}

void QueryModuleSate(void)
{
	char 	*p;
	char 	ret[2];
	
	
	
	
	if( SendAtCmdRsq("AT+CLCC\r\n", "+CLCC:") == 1 )
	{
		if(tc35data[g_rsq]=='0' || tc35data[g_rsq]=='O' )
		{
			if( EndCall() == 1)
				return;
		}
			
		p = strchr((char *)&tc35data[g_rsq], ',');
		if( !p )
			return;
		
		p = GetString(p+1, ",", ",", ret, 1);
		if( !p )
			return;

		if( state==STATE_ALERT && ret[0]=='0' )
		{
			CallActive();
		}
	}


	
}

void CallActive(void)
{
	if(sockState == SOCKSTATE_NULL)
		TimerSock = 0;
	state = STATE_ACTIVE;
}

uint8_t EndCall(void)
{
	uint8_t	ret = 1;

	if(state==STATE_ACTIVE)
	{
		TimerStandby = custermParam.param.delay;
		Flag_Power_Down = 1;
		ret = 1;
	}
	else if(state==STATE_ALERT)
	{
		EnterCallFail();
		ret = 1;
	}
#line 3269 "misc.c"

	return ret;
}


#line 3294 "misc.c"

void RegisterWait(void)
{
	uint8_t signal;
	
	if( Flag_SimExist == 0 )	
		signal = signal_quality();
	else
		signal = Module_CheckRegister();
	
	if( signal > 0 && signal != 99 )
	{
		state = STATE_REGISTER_OK;
		TimerWait = 100;
	}
	else
	{
		TimerWait = 40;
	}

}


void PowerDownHandle(void)
{
	if( Flag_Power_Down )
	{
		Flag_Power_Down = 0;
	
		if( IsInCall() )
			HuangupAllCall();
	
		if( state == STATE_STANDBY )
		{
			EnterPowerDown();
		}
		else if(state < STATE_STANDBY)
		{
			if (state==STATE_ACTIVE || state==STATE_INCOMMING )
			{
				PlayMusic(MUSIC_END);
				
				
				TimerPowerDown = 40;
			}
								
			if(Flag_async_Power_Down == 1)
			{
				Flag_async_Power_Down = 0;
	
				if ((state!=STATE_ACTIVE) && (state!=STATE_INCOMMING))
				{
					TimerPowerDown = 0;
				}
			
				if( state == STATE_ACTIVE )
					TimerStandby = custermParam.param.delay;
				else
					TimerStandby = 0;
			}
	
			if( Flag_SimExist==0 )
				TimerStandby = 0;
			
			EnterEndCall();
		}
		
	}

}





 






















 

static u8 IsUnder3G(void)
{
	char	mode[2];
	
	if( SendAtCmdRsq("AT+CNSMOD?\r\n", "+CNSMOD:") == 1 
		&& GetString((char *)&tc35data[g_rsq], ",", "\r", mode, 2) )
	{
		debug((u8 *)mode);
		return (mode[0] > '4');
	}
	
	return 1;
}

static u8 GetGsmSigal(void)
{	
	u8	signal = signal_quality();
	u8	level = 0;
	
	if( IsUnder3G())
	{
		
		if( signal == 99 || signal < 2 )
			level = 0;
		else if( signal >= 17 )
			level = 5;
		else if( signal >= 12 )
			level = 4;
		else if( signal >= 7 )
			level = 3;
		else if( signal >= 4 )
			level = 2;
		else
			level = 1;
	}
	else
	{
		
		if( signal == 99 || signal < 2 )
			level = 0;
		else if( signal >= 17 )
			level = 5;
		else if( signal >= 12 )
			level = 4;
		else if( signal >= 8 )
			level = 3;
		else if( signal >= 5 )
			level = 2;
		else
			level = 1;
	}
	
	return level;
}


const static uint8_t *csq_files[] = 
{
	"\"oneBar.wav\",2\r", 
	"\"oneBar.wav\",2\r",
	"\"twoBars.wav\",2\r",
	"\"threeBars.wav\",2\r",
	"\"fourBars.wav\",2\r",
	"\"fiveBars.wav\",2\r"
};

static void CsqPlay(u8 level)
{
	if( level < 6 )
		PlayVoice(csq_files[level]);
}

