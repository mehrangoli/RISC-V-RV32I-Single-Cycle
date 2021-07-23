/* 
Single cycle RISC-V CPU (RV32I)
Author: Mehran Goli
Version: 1.0
Date: 01-10-2020
*/


`timescale 1ns/1ns

module ALU_RV32I_tb ();
	
	parameter n = 32;
	reg [n-1:0] op1_tb, op2_tb;
	reg [2:0] op_code_tb;
	wire [n-1:0] dout_tb;
	wire zero_flag_tb, sign_out_tb;
	wire cry_out_tb;

	ALU_RV32I DUT (op1_tb, op2_tb, op_code_tb, dout_tb, zero_flag_tb, sign_out_tb, cry_out_tb);

	initial begin 
		#10 
		op1_tb=32'hffffffff; op2_tb = 5'b00001;  op_code_tb = 3'b100;#20 
      $display("time=%0t, dout_tb= %0b, cry_out_tb = %0b, zero_flag_tb = %0b, sign_out_tb = %0b", $time, dout_tb,cry_out_tb,zero_flag_tb, sign_out_tb);
		
		op1_tb=32'h0001; op2_tb = 5'b00010;  op_code_tb = 3'b101;#20 
      $display("time=%0t, dout_tb= %0b, cry_out_tb = %0b, zero_flag_tb = %0b, sign_out_tb = %0b", $time, dout_tb,cry_out_tb,zero_flag_tb, sign_out_tb);
      
		op1_tb=32'h0001; op2_tb = 5'b00001;  op_code_tb = 3'b101;#20 
      $display("time=%0t, dout_tb= %0b, cry_out_tb = %0b, zero_flag_tb = %0b, sign_out_tb = %0b", $time, dout_tb,cry_out_tb,zero_flag_tb, sign_out_tb);      
		
		op1_tb=32'hffffffff; op2_tb = 5'b00101;  op_code_tb = 3'b110;#20 
      $display("time=%0t, dout_tb= %0b, cry_out_tb = %0b, zero_flag_tb = %0b, sign_out_tb = %0b", $time, dout_tb,cry_out_tb,zero_flag_tb, sign_out_tb);

		op1_tb=32'hffffffff; op2_tb = 32'hffff001f;  op_code_tb = 3'b111;#20 
      $display("time=%0t, dout_tb= %0h, cry_out_tb = %0b, zero_flag_tb = %0b, sign_out_tb = %0b", $time, dout_tb,cry_out_tb,zero_flag_tb, sign_out_tb);
		
		op1_tb=32'hffffffff; op2_tb = 32'hffff00f1;  op_code_tb = 3'b000;#20 
      $display("time=%0t, dout_tb= %0b, cry_out_tb = %0b, zero_flag_tb = %0b, sign_out_tb = %0b", $time, dout_tb,cry_out_tb,zero_flag_tb, sign_out_tb);	
		
      	$stop;
	end

endmodule