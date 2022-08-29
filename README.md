![](../../workflows/wokwi/badge.svg)

(Original readme for the template repository [here](https://github.com/mattvenn/wokwi-verilog-gds-test/blob/main/README.md))

Here is a very small implementation of the [first Project Euler problem](https://projecteuler.net/problem=1) on an ASIC using only 0.1mm x 0.1mm area.

Making it's way to silicon is possible thanks to [TinyTapeout Project](https://tinytapeout.com), I highly recommend it for your first tapeout!

To run the testbench you need to go to the [src](src/) directory and run `make`, you need [Icarus Verilog](http://iverilog.icarus.com/) to execute the simulation.

To build the 100um x 100um macro you need [OpenLane](https://github.com/The-OpenROAD-Project/OpenLane) installed.

