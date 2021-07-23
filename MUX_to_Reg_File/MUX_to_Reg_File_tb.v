/* 
Single cycle RISC-V CPU (RV32I)
Author: Mehran Goli
Version: 1.0
Date: 01-10-2020
*/

`timescale 1ns/1ns

module MUX_to_Reg_File_tb ();
	parameter n = 32, m=3; 
	reg [n-1:0] in1_tb, in2_tb, in3_tb, in4_tb, in5_tb, in6_tb;
	reg [m-1:0] sel_tb;
	wire[n-1:0] out_tb;
	
	MUX_to_Reg_File DUT (in1_tb, in2_tb, in3_tb, in4_tb, in5_tb, in6_tb, sel_tb, out_tb);
	
	
	initial begin 
		in1_tb = 32'h0fffff00 ; in2_tb = 32'hf0ffff00; in3_tb = 32'hff0fff00; in4_tb = 32'hffff0f00; in5_tb = 32'hfffff000; in6_tb = 32'hffff0000; sel_tb = 3'b000;#10 
      	$display("time=%0t, out_tb= %0h", $time, out_tb);

		in1_tb = 32'h0fffff00 ; in2_tb = 32'hf0ffff00; in3_tb = 32'hff0fff00; in4_tb = 32'hffff0f00; in5_tb = 32'hfffff000; in6_tb = 32'hffff0000; sel_tb = 3'b001;#10 
      	$display("time=%0t, out_tb= %0h", $time, out_tb);

		in1_tb = 32'h0fffff00 ; in2_tb = 32'hf0ffff00; in3_tb = 32'hff0fff00; in4_tb = 32'hffff0f00; in5_tb = 32'hfffff000; in6_tb = 32'hffff0000; sel_tb = 3'b100;#10 
      	$display("time=%0t, out_tb= %0h", $time, out_tb);
		
		in1_tb = 32'h0fffff00 ; in2_tb = 32'hf0ffff00; in3_tb = 32'hff0fff00; in4_tb = 32'hffff0f00; in5_tb = 32'hfffff000; in6_tb = 32'hffff0000; sel_tb = 3'b101;#10 
      	$display("time=%0t, out_tb= %0h", $time, out_tb);		
		
      	$stop;
	end

endmodule
