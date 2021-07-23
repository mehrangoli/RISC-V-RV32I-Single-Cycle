/* 
Single cycle RISC-V CPU (RV32I)
Author: Mehran Goli
Version: 1.0
Date: 01-10-2020
*/

`timescale 1ns/1ns


module Branch_CTLR_tb ();
	reg [2:0] branch_in_tb;
	reg zero_flag_tb, sign_flag_tb;
	wire pc_src_tb;

	Branch_CTLR DUT (branch_in_tb, zero_flag_tb, sign_flag_tb, pc_src_tb);

	initial begin 
		#10 
		branch_in_tb=3'b001; zero_flag_tb = 0;  sign_flag_tb = 0;#20 
      $display("time=%0t, pc_src_tb= %0b, ", $time, pc_src_tb);
		
		branch_in_tb=3'b010; zero_flag_tb = 1;  sign_flag_tb = 1;#20 
      $display("time=%0t, pc_src_tb= %0b, ", $time, pc_src_tb);
		
		branch_in_tb=3'b011; zero_flag_tb = 1;  sign_flag_tb = 1;#20 
      $display("time=%0t, pc_src_tb= %0b, ", $time, pc_src_tb);
		
		branch_in_tb=3'b110; zero_flag_tb = 0;  sign_flag_tb = 0;#20 
      $display("time=%0t, pc_src_tb= %0b, ", $time, pc_src_tb);
		
      	$stop;
	end

endmodule