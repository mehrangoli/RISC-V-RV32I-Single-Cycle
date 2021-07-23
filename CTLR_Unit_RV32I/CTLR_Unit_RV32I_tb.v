/* 
Single cycle RISC-V CPU (RV32I)
Author: Mehran Goli
Version: 1.0
Date: 01-10-2020
*/


`timescale 1ns/1ns


module CTLR_Unit_RV32I_tb ();
	reg [6:0] op_code_tb, func7_tb;
	reg [2:0] func3_tb;
	wire jump_tb, mem_wr_tb, stor_sel_tb, alu_src_tb, wr_reg_tb;
	wire [2:0] to_reg, branch, alu_op;

	CTLR_Unit_RV32I DUT (op_code_tb, func7_tb, func3_tb, jump_tb, mem_wr_tb, stor_sel_tb, alu_src_tb, wr_reg_tb, to_reg, branch, alu_op);

	initial begin 
		#10 
		op_code_tb=7'b0110011; func7_tb = 7'b0100000;  func3_tb = 3'b000;#20 
		$display("time=%0t, jump_tb= %0b, mem_wr_tb = %0b, stor_sel_tb = %0b, alu_src_tb = %0b, wr_reg_tb = %0b, to_reg = %0b, branch = %0b, alu_op = %0b",
				 $time, jump_tb, mem_wr_tb, stor_sel_tb, alu_src_tb, wr_reg_tb, to_reg, branch, alu_op);
		
		op_code_tb=7'b0110011; func7_tb = 7'b0100000;  func3_tb = 3'b010;#20 
		$display("time=%0t, jump_tb= %0b, mem_wr_tb = %0b, stor_sel_tb = %0b, alu_src_tb = %0b, wr_reg_tb = %0b, to_reg = %0b, branch = %0b, alu_op = %0b",
				 $time, jump_tb, mem_wr_tb, stor_sel_tb, alu_src_tb, wr_reg_tb, to_reg, branch, alu_op);
		
		op_code_tb=7'b0110011; func7_tb = 7'b0100000;  func3_tb = 3'b111;#20 
		$display("time=%0t, jump_tb= %0b, mem_wr_tb = %0b, stor_sel_tb = %0b, alu_src_tb = %0b, wr_reg_tb = %0b, to_reg = %0b, branch = %0b, alu_op = %0b",
				 $time, jump_tb, mem_wr_tb, stor_sel_tb, alu_src_tb, wr_reg_tb, to_reg, branch, alu_op);
		
		op_code_tb=7'b0010011; func7_tb = 7'b000_000_1;  func3_tb = 3'b100;#20 
		$display("time=%0t, jump_tb= %0b, mem_wr_tb = %0b, stor_sel_tb = %0b, alu_src_tb = %0b, wr_reg_tb = %0b, to_reg = %0b, branch = %0b, alu_op = %0b",
				 $time, jump_tb, mem_wr_tb, stor_sel_tb, alu_src_tb, wr_reg_tb, to_reg, branch, alu_op);		
		
		
      	$stop;
	end

endmodule