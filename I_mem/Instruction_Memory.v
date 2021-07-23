/* 
Single cycle RISC-V CPU (RV32I)
Author: Mehran Goli
Version: 1.0
Date: 01-10-2020
*/

`timescale 1ns/1ns
	
module Instruction_Memory #(parameter m = 16, n = 32) 
			(input [m-1:0] addr, 
			 output [n-1:0] inst);

	//parameter mem_size = 65536; // 2^m
	parameter mem_size = 512; // 2^m
	reg [n-1:0] ROM [0:mem_size-1] = {"00000000_00000000_00000000_00000000","00000000_00010010_10000010_10010011",
									  "00000000_00010010_10000010_10010011","01000000_01110010_10000001_10110011"};	
	// initial $readmemb("binary_code.mem", ROM);
	
	
	assign inst = ROM[addr];

endmodule
	
	
	