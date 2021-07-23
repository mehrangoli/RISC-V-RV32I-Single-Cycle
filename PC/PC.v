/* 
Single cycle RISC-V CPU (RV32I)
Author: Mehran Goli
Version: 1.0
Date: 01-10-2020
*/

`timescale 1ns/1ns
	
module PC #(parameter n = 32) 
	(input clk, rst,
	 input [n-1:0] din,
	 output reg [n-1:0] dout);

	always @ (posedge clk) begin
      if (!rst)
			dout <= {n{1'b0}};	
		else
			dout <= din;
	end

endmodule
	
	