#include <8051.h>
#include "Valve.h"
#include "Delay.h"

sbit P2_0 = P2 ^ 0;
sbit P2_1 = P2 ^ 1;

void fillFromCylinder1()
{
    P2_0 = 0;
    delay2();
    P2_0 = 1;
}

void fillFromCylinder2()
{
    P2_1 = 0;
    delay2();
    P2_1 = 1;
}
