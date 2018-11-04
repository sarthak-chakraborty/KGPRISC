/*
SINGLE CYCLE CPU (KGPRISC)
ASSIGNMENT: 7
GROUP: 32
NAME: Nikhil Nayan Jha (16CS30022)
	   Sarthak Chakraborty (16CS30044)
*/

`timescale 1ns / 1ps
module instr_decoder(
    input [31:0] instr,
    input clk,
	 input start,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg ALUop,
    output reg MemWrite,
    output reg ALUsrc,
    output reg RegWrite,
	 output reg ra_RegWrite
    );

	always@(*)
	begin
		if (start == 1)
		begin
			case (instr[31:26])
				6'b000000: begin			// R-Types (Arithmetic, Logical and Shift Instr.)
								Branch=0;
								MemRead=0;
								MemtoReg=0;
								ALUop=1;
								MemWrite=0;
								ALUsrc=0;
								RegWrite=1;
								ra_RegWrite=0;
							  end
				6'b000100: begin			// Addi
								Branch=0;
								MemRead=0;
								MemtoReg=0;
								ALUop=1;
								MemWrite=0;
								ALUsrc=1;
								RegWrite=1;
								ra_RegWrite=0;
							  end
				6'b000101: begin			// Compi
								Branch=0;
								MemRead=0;
								MemtoReg=0;
								ALUop=1;
								MemWrite=0;
								ALUsrc=1;
								RegWrite=1;
								ra_RegWrite=0;
							  end
			  6'b000010: begin			// lw
								Branch=0;
								MemRead=1;
								MemtoReg=1;
								ALUop=0;
								MemWrite=0;
								ALUsrc=1;
								RegWrite=1;
								ra_RegWrite=0;
							  end
			 6'b000011: begin				// sw
								Branch=0;
								MemRead=0;
								MemtoReg=0;
								ALUop=0;
								MemWrite=1;
								ALUsrc=1;
								RegWrite=0;
								ra_RegWrite=0;
							  end
				6'b010000: begin			// b
								Branch=1;
								MemRead=0;
								MemtoReg=0;
								ALUop=0;
								MemWrite=0;
								ALUsrc=0;
								RegWrite=0;
								ra_RegWrite=0;
							  end
				6'b010001: begin			// br
								Branch=1;
								MemRead=0;
								MemtoReg=0;
								ALUop=0;
								MemWrite=0;
								ALUsrc=0;
								RegWrite=0;
								ra_RegWrite=0;
							  end
				6'b010010: begin			// bz
								Branch=1;
								MemRead=0;
								MemtoReg=0;
								ALUop=0;
								MemWrite=0;
								ALUsrc=0;
								RegWrite=0;
								ra_RegWrite=0;
							  end
				6'b010011: begin			// bnz
								Branch=1;
								MemRead=0;
								MemtoReg=0;
								ALUop=0;
								MemWrite=0;
								ALUsrc=0;
								RegWrite=0;
								ra_RegWrite=0;
							  end
				6'b010100: begin			// bcy
								Branch=1;
								MemRead=0;
								MemtoReg=0;
								ALUop=0;
								MemWrite=0;
								ALUsrc=0;
								RegWrite=0;
								ra_RegWrite=0;
							  end
				6'b010101: begin			// bncy
								Branch=1;
								MemRead=0;
								MemtoReg=0;
								ALUop=0;
								MemWrite=0;
								ALUsrc=0;
								RegWrite=0;
								ra_RegWrite=0;
							end
				6'b010110: begin			// bs
								Branch=1;
								MemRead=0;
								MemtoReg=0;
								ALUop=0;
								MemWrite=0;
								ALUsrc=0;
								RegWrite=0;
								ra_RegWrite=0;
							  end
				6'b010111: begin			// bns
								Branch=1;
								MemRead=0;
								MemtoReg=0;
								ALUop=0;
								MemWrite=0;
								ALUsrc=0;
								RegWrite=0;
								ra_RegWrite=0;
							  end
				6'b011000: begin			// bv
								Branch=1;
								MemRead=0;
								MemtoReg=0;
								ALUop=0;
								MemWrite=0;
								ALUsrc=0;
								RegWrite=0;
								ra_RegWrite=0;
							  end
				6'b011001: begin			// bnv
								Branch=1;
								MemRead=0;
								MemtoReg=0;
								ALUop=0;
								MemWrite=0;
								ALUsrc=0;
								RegWrite=0;
								ra_RegWrite=0;
							  end
				6'b000110: begin			// Call
								Branch=1;
								MemRead=0;
								MemtoReg=0;
								ALUop=0;
								MemWrite=0;
								ALUsrc=0;
								RegWrite=0;
								ra_RegWrite=1;
							  end
				6'b000111: begin			// Ret
								Branch=1;
								MemRead=0;
								MemtoReg=0;
								ALUop=0;
								MemWrite=0;
								ALUsrc=0;
								RegWrite=0;
								ra_RegWrite=0;
							  end
			
				endcase
			
			end
			else	//Initial
			begin	
				Branch=0;
				MemRead=0;
				MemtoReg=0;
				ALUop=0;
				MemWrite=0;
				ALUsrc=0;
				RegWrite=0;
			end
		end
endmodule
