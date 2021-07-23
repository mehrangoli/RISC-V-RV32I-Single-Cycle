/* 
Single cycle RISC-V CPU (RV32I)
Author: Mehran Goli
Version: 1.0
Date: 01-10-2020
*/

`timescale 1ns/1ns
	
module Instruction_Memory_tb #(parameter m = 16, n = 32) ();
	reg [m-1:0] addr_tb; 
	wire [n-1:0] inst_tb;

	Instruction_Memory DUT (addr_tb,inst_tb);
	
	initial begin 
		addr_tb = 16'h0000;
		$display("inst_tb = ", inst_tb);
		#10 addr_tb = 16'h0001;
		$display("inst_tb = ", inst_tb);
		#10 addr_tb = 16'h0002;
		$display("inst_tb = ", inst_tb);
	end
endmodule
	
	