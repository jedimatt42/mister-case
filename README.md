# Custom MiSTer FPGA case

Designed to hold DE-10 Nano & slim 128MB SDRAM XS-D v2.5 boards

* With panel mount cables to bring ports to the back.
  * 3x powered USB
  * Ethernet
  * HDMI
  * 5v Power In
  * Power Switch
* Fan with airflow through the case.
* Zero4U USB 2.0 powered USB hub
* 5v 30mm fan

Stylish front panel design with standard MiSTer switches and LEDs.

Note wiring of switches and LEDs from ioboard schematic:

https://github.com/MiSTer-devel/Hardware_MiSTer/blob/master/releases/iobrd_6.1.pdf

## LED

The GPIO pins appear to be active LOW, so the GND or cathode connects to the GPIO.
The anode is connected to 5v through individual 200-560 ohm resisters.

* `user` : GPIO1 pin 1
* `disk` : GPIO1 pin 3
* `power` : GPIO1 pin 5

## Switches

switches are momentary, connecting the DE10 nano GPIO pin to GND when pressed.

* `reset` : GPIO1 pin 17
* `OSD`   : GPIO1 pin 13
* `user`  : GPIO1 pin 15

LOGO for Mister 
