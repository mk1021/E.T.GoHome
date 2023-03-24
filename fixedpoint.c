//Working filtered (fixed point) 

 

 

#include "system.h" 

#include "altera_up_avalon_accelerometer_spi.h" 

#include "altera_avalon_timer_regs.h" 

#include "altera_avalon_timer.h" 

#include "altera_avalon_pio_regs.h" 

#include "sys/alt_irq.h" 

#include <stdlib.h> 

  

#define OFFSET -32 

#define PWM_PERIOD 16 

#define FILTER_ORDER 49 

  

alt_8 pwm = 0; 

alt_u8 led; 

int level_x, level_y; 

  

void led_write(alt_u8 led_pattern) { 

    IOWR(LED_BASE, 0, led_pattern); 

} 

  

void convert_read(alt_32 acc_read_x, alt_32 acc_read_y, int * level_x, int * level_y, alt_u8 * led) { 

    acc_read_x += OFFSET; 

    acc_read_y += OFFSET; 

    alt_u8 val_x = (acc_read_x >> 6) & 0x07; 

    alt_u8 val_y = (acc_read_y >> 6) & 0x07; 

    * led = (8 >> val_x) | (8 << (8 - val_y)); 

    * level_x = (acc_read_x >> 1) & 0x1f; 

    * level_y = (acc_read_y >> 1) & 0x1f; 

} 

  

void sys_timer_isr() { 

    IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_BASE, 0); 

  

    if (pwm < abs(level_x) || pwm < abs(level_y)) { 

  

        if (level_x < 0) { 

            led_write(led << 1); 

        } else if (level_y < 0) { 

            led_write(led >> 1); 

        } else { 

            led_write(led); 

        } 

  

    } else { 

        led_write(led); 

    } 

  

    if (pwm > PWM_PERIOD) { 

        pwm = 0; 

    } else { 

        pwm++; 

    } 

  

} 

  

void timer_init(void * isr) { 

  

    IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_BASE, 0x0003); 

    IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_BASE, 0); 

    IOWR_ALTERA_AVALON_TIMER_PERIODL(TIMER_BASE, 0x0900); 

    IOWR_ALTERA_AVALON_TIMER_PERIODH(TIMER_BASE, 0x0000); 

    alt_irq_register(TIMER_IRQ, 0, isr); 

    IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_BASE, 0x0007); 

  

} 

  

alt_32 average(alt_32 *m, int beta[]){ 

int sum = 0; 

for(int i=0; i<FILTER_ORDER; i++){ 

sum += (int)m[i]* beta[i]; 

} 

sum /= 1000; 

return (alt_32)sum; 

} 

  

void fixed(float coefficients_f[], int *coefficients_i[]){ 

for(int i=0; i<FILTER_ORDER; i++){ 

coefficients_i[i] = (int)(coefficients_f[i] * 10000); 

} 

} 

  

  

  

int main() { 

  

    alt_32 x_read, y_read; 

    alt_up_accelerometer_spi_dev * acc_dev; 

    acc_dev = alt_up_accelerometer_spi_open_dev("/dev/accelerometer_spi"); 

    if (acc_dev == NULL) { // if return 1, check if the spi ip name is "accelerometer_spi" 

        return 1; 

    } 

  

    alt_32 x_output, y_output; 

    int coefficients_i[FILTER_ORDER]; 

    float coefficients_f[] = {0.0046,    0.0074,   -0.0024,   -0.0071,    0.0033,    0.0001,   -0.0094,    0.0040,    0.0044,   -0.0133 ,  0.0030,    0.0114,   -0.0179,   -0.0011,    0.0223,   -0.0225,   -0.0109,    0.0396,   -0.0263,   -0.0338,   0.0752,   -0.0289,   -0.1204,    0.2879,    0.6369,    0.2879,   -0.1204,   -0.0289,    0.0752,   -0.0338,   -0.0263,    0.0396,   -0.0109,   -0.0225,    0.0223,   -0.0011,   -0.0179,    0.0114,    0.0030,   -0.0133,   0.0044,    0.0040,   -0.0094,    0.0001,    0.0033,   -0.0071 ,  -0.0024 ,   0.0074,    0.0046 }; 

    fixed(coefficients_f, coefficients_i); 

    alt_32 *x_mem = malloc(FILTER_ORDER*sizeof(alt_32)); 

    alt_32 *y_mem = malloc(FILTER_ORDER*sizeof(alt_32)); 

  

    timer_init(sys_timer_isr); 

    while (1) { 

  

        alt_up_accelerometer_spi_read_x_axis(acc_dev, & x_read); 

  

        for(int i=4; i>0; i--){ 

        x_mem[i] = x_mem[i-1]; } 

        x_mem[0] = x_read; 

        x_output = average(x_mem, coefficients_i); 

  

        alt_up_accelerometer_spi_read_y_axis(acc_dev, & y_read); 

        for(int i=4; i>0; i--){ 

                y_mem[i] = y_mem[i-1]; } 

                y_mem[0] = y_read; 

                y_output = average(y_mem, coefficients_i); 

  

  

        alt_printf("x: %x , y: %x\n", x_output, y_output); 

        convert_read(x_output, y_output, & level_x, & level_y, & led); 

  

    } 

    free(x_mem); 

    free(y_mem); 

    return 0; 

} 