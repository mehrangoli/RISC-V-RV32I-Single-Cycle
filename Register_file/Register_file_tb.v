/* 
Single cycle RISC-V CPU (RV32I)
Author: Mehran Goli
Version: 1.0
Date: 01-10-2020
*/

`timescale 1ns/1ns

module Register_File_tb ();
	
	parameter m = 5, n = 32;
	reg clk_tb = 0, w_en_tb = 0;
	reg [m-1:0] rs1_tb, rs2_tb, rd_tb;
	reg [n-1:0] din_tb;
	wire [n-1:0] read_data1_tb, read_data2_tb;

	Register_File DUT (clk_tb, w_en_tb,rs1_tb, rs2_tb, rd_tb, din_tb, read_data1_tb, read_data2_tb);
	
	always #10 clk_tb = ~clk_tb;
	
	initial begin 
		#10 
		w_en_tb = 1; din_tb=32'h0004; rs1_tb = 5'b00001; rd_tb = 5'b00001;#20 
		$display("time=%0t, read_data1_tb= %0h, read_data2_tb = %0h", $time, read_data1_tb,read_data2_tb);
		$display("time=%0t, REG=%p", $time, DUT.REG);
		
		w_en_tb = 1; din_tb=32'h0006; rs2_tb = 5'b00000; rd_tb = 5'b00010;#20 
		$display("time=%0t, read_data1_tb= %0h, read_data2_tb = %0h", $time, read_data1_tb,read_data2_tb);
      	$display("time=%0t, REG=%p", $time, DUT.REG);
		
		w_en_tb = 1; din_tb=32'h0008; rs1_tb = 5'b00010; rd_tb = 5'b00011;
		$display("time=%0t, read_data1_tb= %0h, read_data2_tb = %0h", $time, read_data1_tb,read_data2_tb);#20 
      	$display("time=%0t, REG=%p", $time, DUT.REG);
		
		w_en_tb = 1; din_tb=32'h00010; rs2_tb = 5'b00011; rd_tb = 5'b00011;#20
		$display("time=%0t, read_data1_tb= %0h, read_data2_tb = %0h", $time, read_data1_tb,read_data2_tb);
      	$display("time=%0t, REG=%p", $time, DUT.REG);
		
      	$stop;
	end

endmodule