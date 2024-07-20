#include "FFM.h"
#include "Motor.h"
#include "Valve.h"
#include "Sensors.h"
#include "Delay.h"

void initFFM(FFM *ffm)
{
    ffm->rejectedBottles = 0;
    ffm->acceptedBottles = 0;
}

void runFFM(FFM *ffm)
{
    while (1)
    {
        while (!P1_0)
            ; // Wait for the start button to be pressed

        startMotor();
        delay1();

        while (!P1_1)
            ; // Wait for an empty bottle at the filling point
        stopMotor();
        delay1();

        if (!P1_6 || !P1_7)
        {
            incrementRejectedBottles(ffm);
            continue;
        }

        if (!P1_2)
        {
            P2_2 = 0; // Clear cylinder 1 status bit
        }
        else if (!P1_3)
        {
            P2_3 = 0; // Clear cylinder 2 status bit
        }
        else
        {
            P2_5 = 1; // Set alarm
            continue;
        }

        if (!P1_2)
        {
            while (!P1_4)
                ; // Wait for an empty bottle
            fillFromCylinder1();
            incrementAcceptedBottles(ffm);
        }
        else
        {
            while (!P1_4)
                ; // Wait for an empty bottle
            fillFromCylinder2();
            incrementAcceptedBottles(ffm);
        }
    }
}

void incrementRejectedBottles(FFM *ffm)
{
    ffm->rejectedBottles++;
}

void incrementAcceptedBottles(FFM *ffm)
{
    ffm->acceptedBottles++;
}
