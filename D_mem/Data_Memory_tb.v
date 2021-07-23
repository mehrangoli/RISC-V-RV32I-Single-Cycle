/* 
Single cycle RISC-V CPU (RV32I)
Author: Mehran Goli
Version: 1.0
Date: 01-10-2020
*/

`timescale 1ns/1ns
	
module Data_Memory_tb ();
  	parameter m = 16, n = 32;
	reg clk_tb = 0;
  	reg w_en_tb = 0;
	reg [m-1:0] addr_tb;
	reg [n-1:0] din_tb;
	wire [n-1:0] dout_tb;
  
	Data_Memory DUT (clk_tb,w_en_tb,addr_tb,din_tb,dout_tb);
	
	always #10 clk_tb = ~clk_tb;
	
	initial begin 
      	addr_tb = 16'h0000; #10
      	$display("dout_tb = ", dout_tb);
		#10 w_en_tb = 1; din_tb=32'h0004; addr_tb = 16'h0000;
		#20 w_en_tb = 1; din_tb=32'h0006; addr_tb = 16'h0001;
		#20 w_en_tb = 1; din_tb=32'h0008; addr_tb = 16'h0002;
		#20 w_en_tb = 0;
		$display("dout_tb = ", dout_tb);
		addr_tb = 16'h0000;#30 
		$display("dout_tb = ", dout_tb);
		addr_tb = 16'h0001;#40 
		$display("dout_tb = ", dout_tb);
      	$stop;
	end

endmodule		