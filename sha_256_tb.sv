`default_nettype none
`timescale 1 ns / 10 ps

module sha_256_tb;
	logic[31:0] message;
	logic [255:0] hashed;
	logic clk, rst, done;

	function automatic [31:0] padded_size;
		input [31:0] message_size;
		padded_size = (message_size+1 > 448) ? ((message_size < 512) ? 1024 : padded_size(message_size-512)+512) : 512;
	endfunction

	sha_256 #(.MSG_SIZE(32), .PADDED_SIZE(padded_size(32))) uut (.message(message), .hashed(hashed), .clk(clk), .rst(rst), .done(done));

	initial begin
    	$dumpfile("sha_256_tb.vcd");
    	$dumpvars;
    	// assign message = "abc";
    	assign message = "Dave";
    	assign clk = 0;
    	assign rst = 1; #5
    	assign rst = 0;
    	while(done !== 1'b1) begin
    		assign clk = ~clk;
    		#5;
    	end
    	$display("FINISHED sha_256_tb");
    	$display("Hash: %h", hashed);
    	$finish;
	end
endmodule