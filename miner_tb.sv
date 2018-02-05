`default_nettype none
`timescale 1 ns / 10 ps

module miner_tb;
	logic[639:0] message;
	logic [255:0] hashed;
	logic clk, rst, done;

	miner uut (.block(message), .hashed(hashed), .clk(clk), .rst(rst), .done(done));

	initial begin
    	$dumpfile("miner_tb.vcd");
    	$dumpvars;
    	assign message = 640'h0100000000000000000000000000000000000000000000000000000000000000000000003ba3edfd7a7b12b27ac72c3e67768f617fc81bc3888a51323a9fb8aa4b1e5e4a29ab5f49ffff001d1dac2b7c;
    	assign clk = 0;
    	assign rst = 1; #5
    	assign rst = 0;
    	while(done !== 1'b1) begin
    		assign clk = ~clk;
    		#5;
    	end
    	$display("FINISHED miner_tb");
    	$display("Hash: %h", hashed);
    	$finish;
	end
endmodule