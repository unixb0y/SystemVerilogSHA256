# SystemVerilogSHA256

SystemVerilog SHA256 Hardware Design / FPGA Bitcoin Miner  


The design can now hash as many bytes as is needed for the application.
This means it's ready to hash a Bitcoin block, as well (for example).

The module `sha_256.sv` is a parametrized SHA256 calculator which allows you to hash any data. Usage can be seen in the testbench `sha_256_tb.sv`.  

`miner.sv` is basically a Bitcoin miner, a module that implements two instances of `sha_256.sv` and byte-reversing the result. It is specifically made for this task, so you don't have to pass any parameters, just connect the 80-byte block header, a clock and a reset signal, as well as a flag to know whether the hash is calculated and a register to store the hash in.

All testbenches are running fine in Icarus Verilog and the modules return the right results.  
As I use this open-source software, that doesn't support System Verilog natively, the modules are always converted to Verilog files with a few simple commands. Because of that I couldn't use exclusive System Verilog features, so it's basically plain Verilog.

Update on the display part: I figured it's easiest to have that part done by an Arduino Nano / 328P, getting the number to display via some pins as there's a great library (Adafruit_SSD1331) that worked perfectly in just a few minutes.
My Verilog controller for the PmodOLEDrgb is going to be done some time later on!

Next steps are:
- [X] Getting raw data of the Bitcoin Genesis block (#1)
- [X] Hashing that (#2)
- [ ] Executing on FPGA
- [ ] Try a combination with a UART USB bridge
- [X] Display hashes via LCD / VGA
- [ ] Lots of optimization / making it both more efficient and the code more readable


Useful resources that I used:  
(#1):  
https://en.bitcoin.it/wiki/Genesis_block#cite_note-block-1  
https://webbtc.com/block/000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f.hex  
(#2):  
https://www.reddit.com/r/Bitcoin/comments/6gl8ol/how_to_manually_verify_a_hash_from_a_block/


# How to use the miner?
The miner_tb.sv tesbench is the easiest way to use / test the main module.  
Put a 80 byte BTC block header in the `message` register and execute the simulation!  
Icarus Verilog will also output the computed result to the command line.  
As an example, take the first 80 bytes of the block found [here](https://webbtc.com/block/000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f.hex) and compare them to the hash found when you remove the '.hex' from the link, [here](https://webbtc.com/block/000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f).

#

|Communication|
|:-----------:|
| [![Find me on Pnut](https://img.shields.io/badge/Pnut-unixb0y-yellowgreen.svg)](http://pnut.io/@unixb0y) [![Find me on Twitter](https://img.shields.io/badge/Twitter-unixb0y-00aced.svg)](https://twitter.com/unixb0y) [![Send me an Email](https://img.shields.io/badge/E--Mail-unixb0y-lightgrey.svg)](mailto:unixb0y@protonmail.com) [![Website](https://img.shields.io/badge/Web-unixb0y-red.svg)](http://unixb0y.github.io)|
