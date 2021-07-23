/* 
Single cycle RISC-V CPU (RV32I)
Author: Mehran Goli
Version: 1.0
Date: 01-10-2020
*/

`timescale 1ns/1ns

module PC_tb ();
	parameter n = 32;
	reg clk_tb = 0, rst_tb;
	reg [n-1:0] din_tb;
	wire [n-1:0] dout_tb;
	
	PC DUT (clk_tb, rst_tb, din_tb, dout_tb);
	
	always #10 clk_tb = ~clk_tb;
	
	initial begin 
		rst_tb = 0;#10 
      	$display("time=%0t, dout_tb= %0h", $time, dout_tb,);
		
		rst_tb = 1; din_tb=32'h0004;#20 
		$display("time=%0t, dout_tb= %0h", $time, dout_tb,);
		
		rst_tb = 1; din_tb=32'h0005;#20 
		$display("time=%0t, dout_tb= %0h", $time, dout_tb,);
		
		rst_tb = 1; din_tb=32'h0006;#20 
		$display("time=%0t, dout_tb= %0h", $time, dout_tb,);
		
		
      	$stop;
	end

endmodule
