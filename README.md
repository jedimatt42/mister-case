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
The anode is connected to 3.3v pin GPIO1[29] through individual 220-560 ohm resisters.

* `user` : GPIO1 pin 1  - RED
* `disk` : GPIO1 pin 3  - GREEN
* `power` : GPIO1 pin 5 - YELLOW

Connect a common lead from pin 29 to 3 resisters, each of which goes to an led, and then the negative terminal on the LED goes to the specific GPIO pin.

## Switches

switches are momentary, connecting the DE10 nano GPIO pin to GND (GPIO1[12]) when pressed.

* `reset` : GPIO1 pin 17
* `OSD`   : GPIO1 pin 13
* `user`  : GPIO1 pin 15

The left hand panel has room for 2 push button momentary switches, designed for the classic red button type: 

https://smile.amazon.com/DIYhz-Momentary-Pushbutton-Switches-Normally/dp/B08B1PWJ21/ref=sr_1_15?dchild=1&keywords=red+momentary+push+button+switch&qid=1599929494&sr=8-15

For myself, I wire the top switch to OSD, and the bottom to USER which generally acts as in-core reset. For full MiSTer reset, the power switch on the back seems sufficient, or use the in menu option.

## LOGO for Mister

This projects uses an SVG MiSTer logo found on a forum... 

https://www.dropbox.com/s/gym92g5i8eauhdw/MISTER%20FPGA%20Logo.svg

