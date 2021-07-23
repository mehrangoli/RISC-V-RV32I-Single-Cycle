/* 
Single cycle RISC-V CPU (RV32I)
Author: Mehran Goli
Version: 1.0
Date: 01-10-2020
*/


module Branch_CTLR
	(input [2:0] branch_in,
	 input zero_flag, sign_flag,
	 output reg pc_src);
	
	wire BEQ, BNQ, BLT, BGT;
	
	always@(branch_in, BEQ, BNQ, BLT, BGT) begin
		
		case (branch_in)
			3'b001: pc_src = BEQ; // branch equal
			3'b010: pc_src = BNQ; // branch not equal
			3'b011: pc_src = BLT; //branch less than
			3'b100: pc_src = BGT; //branch greater than (rs1 >= rs2)
			3'b101: pc_src = 1'b1;	// jump and link instruction (JAL)
			3'b110: pc_src= 1'b1;	// jump-and-link-register instruction (JALR)
			default: pc_src = 1'b0;	
		endcase	
	end
	
	assign BEQ = zero_flag? 1'b1 : 1'b0;
	assign BNQ = zero_flag? 1'b0 : 1'b1;
	assign BLT = sign_flag? 1'b1 : 1'b0;
	assign BGT = sign_flag? 1'b0 : 1'b1;

endmodule
	
	