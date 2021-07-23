/* 
Single cycle RISC-V CPU (RV32I)
Author: Mehran Goli
Version: 1.0
Date: 01-10-2020
*/

module RV32I_Top #(parameter n = 32) 
	(input clk, rst);
	
	wire [6:0] op_code, func7;
	wire [2:0] func3;
	wire jump, mem_wr, stor_sel, alu_src, wr_reg;
	wire [2:0] to_reg, branch, alu_op;
		
	Data_Path_RV32I DUT_data_path (clk, rst, jump, mem_wr, stor_sel, alu_src, wr_reg, to_reg, branch, alu_op, op_code, func7, func3);
	CTLR_Unit_RV32I DUT_ctlr_unit (op_code, func7, func3, jump, mem_wr, stor_sel, alu_src, wr_reg, to_reg, branch, alu_op);
	
	
endmodule
	
	