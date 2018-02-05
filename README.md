# SystemVerilogSHA256

SystemVerilog SHA256 Hardware Design
The design can now hash as many bytes as is needed for the application.
This means it's ready to hash a Bitcoin block, as well (for example).
Next steps are:
* Getting raw data of the Bitcoin Genesis block
* Hashing that
* Executing on FPGA
* Try a combination with a UART USB bridge
* Display hashes via LCD / VGA
