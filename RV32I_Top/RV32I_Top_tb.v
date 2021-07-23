/* 
Single cycle RISC-V CPU (RV32I)
Author: Mehran Goli
Version: 1.0
Date: 01-10-2020
*/


`timescale 1ns/1ns

module RV32I_Top_tb ();
	reg clk_tb = 0, rst_tb = 0;
		
	RV32I_Top DUT (clk_tb, rst_tb);
	
	task dis();
      $display("time=%0t, pc.din= %0b", $time, DUT.DUT_data_path.pc.din);
      $display("time=%0t, pc.dout= %0b", $time, DUT.DUT_data_path.pc.dout);
      $display("time=%0t, inst_mem.inst= %0b", $time, DUT.DUT_data_path.inst_mem.inst);
      $display("time=%0t, DUT_data_path.inst= %0b", $time, DUT.DUT_data_path.instruction);
      $display("time=%0t, DUT_data_path.reg_data1= %0b", $time, DUT.DUT_data_path.reg_data1);
      $display("time=%0t, DUT_data_path.reg_data2= %0b", $time, DUT.DUT_data_path.reg_data2);
      $display("time=%0t, DUT_data_path.reg_file.read_data2= %0b", $time, DUT.DUT_data_path.reg_file.read_data2);
      $display("time=%0t, DUT_data_path.reg_file.rs2= %0b", $time, DUT.DUT_data_path.reg_file.rs2);
      $display("time=%0t, DUT_data_path.reg_file.w_en= %0b", $time, DUT.DUT_data_path.reg_file.w_en);
      $display("time=%0t, DUT_data_path.alu_src= %0b", $time, DUT.DUT_data_path.alu_src);
      $display("time=%0t, DUT_data_path.op1= %0b", $time, DUT.DUT_data_path.reg_data1);
      $display("time=%0t, DUT_data_path.alu_op2= %0b", $time, DUT.DUT_data_path.alu_op2);
      $display("time=%0t, DUT_data_path.alu_opcode= %0b", $time, DUT.DUT_data_path.alu_opcode);
      $display("time=%0t, DUT_data_path.alu_out= %0b", $time, DUT.DUT_data_path.alu_out);
      $display("time=%0t, DUT_data_path.mux_sel_reg_file= %0b", $time, DUT.DUT_data_path.mux_sel_reg_file);
      $display("time=%0t, DUT_data_path.data_in_reg= %0b", $time, DUT.DUT_data_path.data_in_reg);
      $display("time=%0t, DUT_data_path.mux_to_reg.in1= %0b", $time, DUT.DUT_data_path.mux_to_reg.in1);
      $display("time=%0t, DUT_data_path.pc_src= %0b", $time, DUT.DUT_data_path.pc_src);
      $display("time=%0t, DUT_data_path.pc_out4= %0b", $time, DUT.DUT_data_path.pc_out4);
      $display("time=%0t, DUT_data_path.new_addr_for_pc= %0b", $time, DUT.DUT_data_path.new_addr_for_pc);
      $display("time=%0t, DUT_data_path.pc_in= %0b", $time, DUT.DUT_data_path.pc_in);
      $display("time=%0t, pc.din= %0b", $time, DUT.DUT_data_path.pc.din);
      $display("time=%0t, imm= %0b", $time, DUT.DUT_data_path.imm);
      $display("time=%0t, jump= %0b", $time, DUT.DUT_data_path.jump);
      $display("time=%0t, REG= %0p", $time, DUT.DUT_data_path.reg_file.REG);
      $display("time=%0t, ROM= %0p", $time, DUT.DUT_data_path.inst_mem.ROM);
	endtask
	
	
	
	always #4 begin
      clk_tb = ~clk_tb;
      if (clk_tb)
		dis();
    end
	
	initial begin
		rst_tb = 0; #5
		rst_tb = 1;
      
	
		#1000 
		$dumpfile("test.vcd");
		$stop;
		
	end
	
endmodule
	
//0100000_00111_00101_000_00011_0110011		sub x3, x7, x5
//0000000_00111_00110_111_00101_0110011		and x5, x6, x7
//0000000000010100000001000_0010011       	addi x8,x8,1                     48-4B
//1111111_01000_00010_001_11001_1100011       -- bne x2,x8, BRANCHES              4C-4F 

