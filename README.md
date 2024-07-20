# Fluid Filling Machine (FFM) Project

## Overview

This project involves designing and implementing a Fluid Filling Machine (FFM) using the 8051 microcontroller. The FFM is used for filling bottles with fluids such as fruit drinks and water. It includes functionalities for detecting the presence of bottles, checking fluid levels, and managing filling processes.

## Project Structure
```
Fluid_Filling_Machine/
├── src/
│ ├── FFM.c
│ ├── FFM.h
│ ├── Motor.c
│ ├── Motor.h
│ ├── Valve.c
│ ├── Valve.h
│ ├── Sensors.c
│ ├── Sensors.h
│ └── Delay.c
│ └── Delay.h
└── .vscode/
  └── c_cpp_properties.json
└── FFM_8051.asm
```

- `src/` contains the source code and header files for the FFM system.
- `.vscode/` contains the Visual Studio Code configuration files.

## Installation

1. **Clone the Repository**

   ````
   git clone https://github.com/NelushGayashan/Fluid_Filling_Machine.git
    ````
2. **Open the Project**

    Open the project folder in your preferred IDE or text editor.

3. **Configure the Environment**

    Ensure that you have the necessary tools and compilers installed.

## MCU 8051 IDE Setup

1. **Install MCU 8051 IDE**

    Download and install the MCU 8051 IDE from MCU 8051 IDE official site.

2. **Import the Project**
    - Open MCU 8051 IDE.
    - Go to File -> Open Project and select the project folder.

3. Add Source Files
    - Make sure all source files (*.c and *.h) are added to the project.
    - Right-click on the project in the IDE and select Add Existing Files to include your .c and .h files.

4. Configure Build Options
    - Go to Project -> Build Options and ensure that the correct compiler and linker settings are configured.

5. Compile and Run
    - Click on Build to compile the code.
    - Click on Run or Debug to simulate the code on the MCU 8051 IDE.

## Files

- FFM.c and FFM.h: Core implementation and interface for the Fluid Filling Machine.
- Motor.c and Motor.h: Functions to control the DC motor.
- Valve.c and Valve.h: Functions to control the electro-mechanical valves.
- Sensors.c and Sensors.h: Functions to read sensor data.
- Delay.c and Delay.h: Delay routines used for timing purposes.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- The project was developed as part of an academic exercise in microprocessor interfacing.
- Thanks to the MCU 8051 IDE community for their support and tools.

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests to improve the project.