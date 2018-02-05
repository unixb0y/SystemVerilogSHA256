# SystemVerilogSHA256

SystemVerilog SHA256 Hardware Design
The design can now hash as many bytes as is needed for the application.
This means it's ready to hash a Bitcoin block, as well (for example).
Next steps are:
- [X] Getting raw data of the Bitcoin Genesis block (#1)
- [X] Hashing that (#2)
- [ ] Executing on FPGA
- [ ] Try a combination with a UART USB bridge
- [ ] Display hashes via LCD / VGA


Useful resources that I used:  
(#1):  
https://en.bitcoin.it/wiki/Genesis_block#cite_note-block-1  
https://webbtc.com/block/000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f.hex  
(#2):  
https://www.reddit.com/r/Bitcoin/comments/6gl8ol/how_to_manually_verify_a_hash_from_a_block/
