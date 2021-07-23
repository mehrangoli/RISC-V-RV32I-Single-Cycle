/* 
Single cycle RISC-V CPU (RV32I)
Author: Mehran Goli
Version: 1.0
Date: 01-10-2020
*/


`timescale 1ns/1ns


module Immediate_Gen_tb ();
	parameter n = 32; 
	reg [n-1:0] instruct_tb;
	wire [n-1:0] immediate_tb;
	

	Immediate_Gen DUT (instruct_tb, immediate_tb);

	initial begin 
		#10 
		instruct_tb=32'b11001_01101_10110_11001_10110_0010011;#20 
      $display("time=%0t, immediate_tb= %0b", $time, immediate_tb);
		
		instruct_tb=332'b01001_01101_10110_11001_10110_0000011;#20 
      $display("time=%0t, immediate_tb= %0b", $time, immediate_tb);
		
		instruct_tb=32'b01001_01101_10110_11001_10110_0100011;#20 
      $display("time=%0t, immediate_tb= %0b", $time, immediate_tb);
		
		instruct_tb=32'b11001_01101_10110_11001_10110_1100011;#20 
      $display("time=%0t, immediate_tb= %0b", $time, immediate_tb);
		
		instruct_tb=32'b01001_01101_10110_11001_10110_1100111;#20 
      $display("time=%0t, immediate_tb= %0b", $time, immediate_tb);
		
		instruct_tb=32'b11001_01101_10110_11001_10110_1101111;#20 
      $display("time=%0t, immediate_tb= %0b", $time, immediate_tb);		
		
      	$stop;
	end

endmodule