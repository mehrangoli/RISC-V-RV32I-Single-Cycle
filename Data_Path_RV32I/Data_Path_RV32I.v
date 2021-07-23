/* 
Single cycle RISC-V CPU (RV32I)
Author: Mehran Goli
Version: 1.0
Date: 01-10-2020
*/


module Data_Path_RV32I #(parameter n = 32) 
	(input clk, rst,
	 input jump, wr_mem, store_sel, alu_src, wr_reg,
	 input [2:0] mux_sel_reg_file, branch, alu_opcode,
	 output [6:0] op_code, func7,
	 output [2:0] func3);

	wire [n-1:0] pc_in, pc_out, pc_out4; //data in and data out from PC
	wire [n-1:0] instruction; // readed instruction from Instruction Memory
	wire [n-1:0] reg_data1, reg_data2; // readed data from Register File
	wire [n-1:0] alu_out, datain_mem, dataout_mem; // ALU result and datain/dataout to/from memory 
	wire [n-1:0] imm; // generated immediate
	wire [n-1:0] data_in_reg, alu_op2;
	wire [n-1:0] offset, reg_data2_anded, new_addr_for_pc, shifted;
	//wire [2:0] mux_sel_reg_file, branch, alu_opcode ;
	
	wire sign_flag, zero_flag, carry_flag;
	//wire jump, wr_mem, store_sel, alu_src, wr_reg, pc_src;
	wire pc_src;
	
	assign op_code = instruction[6:0];
	assign func7 = instruction[31:25];
	assign func3 = instruction[14:12];

	
	
	
	Instruction_Memory inst_mem (pc_out[15:0], instruction); // pc_out is 32-bit, Instruction Memory is 64KB
	
	Data_Memory data_mem (clk, wr_mem, alu_out, datain_mem, dataout_mem);
	
	PC pc (clk, rst, pc_in, pc_out);
	
	Register_File reg_file (clk, wr_reg, instruction[19:15], instruction[24:20], instruction[11:7], data_in_reg, reg_data1, reg_data2);
	
	ALU_RV32I alu_rv32i (reg_data1, alu_op2, alu_opcode, alu_out, zero_flag, sign_flag, carry_flag);
	
	
	MUX_to_ALU: assign alu_op2 = alu_src ? reg_data2 : imm;
	MUX_to_Data_Memory: assign datain_mem = store_sel ? reg_data2_anded : reg_data2;
	
	MUX_to_Reg_File mux_to_reg (alu_out, dataout_mem, dataout_mem, pc_out, {n{1'b0}}, pc_out4, mux_sel_reg_file, data_in_reg);
	
	MUX_for_Jump: assign offset = jump ? alu_out : imm;
	MUX_for_PC: assign pc_in = pc_src ? new_addr_for_pc : pc_out4;
	
	
	Branch_CTLR branch_ctlr (branch, zero_flag, sign_flag, pc_src);
	
	Immediate_Gen imm_gen (instruction, imm);
	
	
		
	assign reg_data2_anded = reg_data2 & 32'h000000ff;
	assign pc_out4 = pc_out + 1'b1;
	assign shifted = {offset[30:0], 1'b0};
	assign new_addr_for_pc = pc_out + shifted;
	
	

endmodule
	
	