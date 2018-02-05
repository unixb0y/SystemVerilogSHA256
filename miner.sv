`default_nettype none
`timescale 1 ns / 10 ps

module miner (input logic [639:0] block,
			input logic clk, rst,
			output logic [255:0] hashed,
			output logic done);
	
	logic [255:0] first_hash;
	logic [255:0] secnd_hash;

	logic second_run_rst;
	logic done_first_hash;
	logic done_secnd_hash;

	sha_256 #(.MSG_SIZE(640), .PADDED_SIZE(1024)) first (.message(block), .hashed(first_hash), .clk(clk), .rst(rst), .done(done_first_hash));
	sha_256 #(.MSG_SIZE(256), .PADDED_SIZE(512)) second (.message(first_hash), .hashed(secnd_hash), .clk(clk), .rst(second_run_rst), .done(done_secnd_hash));

	// always @* second_run_rst <= 1'b0;

	always @(posedge clk) begin
		if (done_first_hash === 1'bX) second_run_rst <= 1'b1;
		else if (done_first_hash == 1'b1) second_run_rst <= 1'b0;
	end

	assign done = done_secnd_hash;
	assign hashed = {secnd_hash[7:0], secnd_hash[15:8], secnd_hash[23:16], secnd_hash[31:24], secnd_hash[39:32], secnd_hash[47:40], secnd_hash[55:48], secnd_hash[63:56], secnd_hash[71:64], secnd_hash[79:72], secnd_hash[87:80], secnd_hash[95:88], secnd_hash[103:96], secnd_hash[111:104], secnd_hash[119:112], secnd_hash[127:120], secnd_hash[135:128], secnd_hash[143:136], secnd_hash[151:144], secnd_hash[159:152], secnd_hash[167:160], secnd_hash[175:168], secnd_hash[183:176], secnd_hash[191:184], secnd_hash[199:192], secnd_hash[207:200], secnd_hash[215:208], secnd_hash[223:216], secnd_hash[231:224], secnd_hash[239:232], secnd_hash[247:240], secnd_hash[255:248]};

endmodule