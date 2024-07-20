#include <8051.h>
#include "Sensors.h"

// Define the bits for the ports
sbit P1_0 = P1 ^ 0; // Start button
sbit P1_1 = P1 ^ 1; // Presence of an empty bottle at the filling point
sbit P1_2 = P1 ^ 2; // Cylinder 1 empty status
sbit P1_3 = P1 ^ 3; // Cylinder 2 empty status
sbit P1_4 = P1 ^ 4; // Empty bottle detection
sbit P1_5 = P1 ^ 5; // Maximum filling point
sbit P1_6 = P1 ^ 6; // Correct type of bottle
sbit P1_7 = P1 ^ 7; // Bottle opening free check
