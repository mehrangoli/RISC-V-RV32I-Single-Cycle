/* 
Single cycle RISC-V CPU (RV32I)
Author: Mehran Goli
Version: 1.0
Date: 01-10-2020
*/

`timescale 1ns/1ns
	
module Data_Memory #(parameter m = 16, n = 32) 
	(input clk,w_en,
	 input [m-1:0] addr,
	 input [n-1:0] din,
	 output [n-1:0] dout);

	parameter mem_size = 65536; // 2^m
	reg [n-1:0] RAM [0:mem_size-1];
	
	always@(posedge clk) begin
		if (w_en)
			RAM[addr] <= din;	
	end
	
	assign dout = RAM[addr];

endmodule
	
	
	