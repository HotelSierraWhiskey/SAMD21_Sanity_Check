#include "nvic.h"
#include "io.h"


int main(void)
{
    
    IO_pin_gpio_init(IO_PIN_PA02);
    IO_pin_gpio_init(IO_PIN_PA03);
    IO_pin_gpio_init(IO_PIN_PA04);

    IO_pin_assert(IO_PIN_PA02);
    IO_pin_assert(IO_PIN_PA03);
    IO_pin_assert(IO_PIN_PA04);

    while (true)
    {
        continue;
    }
}