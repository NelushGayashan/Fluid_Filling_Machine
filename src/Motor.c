#include <8051.h>
#include "Motor.h"

sbit P2_4 = P2 ^ 4;

void startMotor()
{
    P2_4 = 0;
}

void stopMotor()
{
    P2_4 = 1;
}
