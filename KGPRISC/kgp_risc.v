/*
SINGLE CYCLE CPU (KGPRISC)
ASSIGNMENT: 7
GROUP: 32
NAME: Nikhil Nayan Jha (16CS30022)
	   Sarthak Chakraborty (16CS30044)
*/

`timescale 1ns / 1ps
module kgp_risc(
	 input [31:0] instr,
	 input [31:0] doutd,
	 input start,
    input clk,
	 output [31:0] PC,
	 output [31:0] DA,
	 output [31:0] write_data,
	 output [3:0] wea
	 );

	wire [31:0] rd1, rd2, ra, rd, ra1;
	wire [4:0] rr1;
	wire [31:0] data;
	wire [31:0] pc_4;
	wire [31:0] alu_data;
	wire [31:0] sign_extended_imm;
	wire [31:0] label;
	
	wire [31:0] alu_out;
	wire carryflag;
	wire zflag;
	wire overflowflag;
	wire signflag;
	
	wire Branch;		//Whether to branch or not
	wire MemRead;		//To read from memory or not (in case of lw)
	wire MemtoReg;   //Register write is done either by lw or using the result of ALU
	wire ALUop;			//ALU operational
	wire MemWrite;  //sw
	wire ALUsrc;    //ALU calculation using R-Type instr or I-Type instr
	wire RegWrite;		//To write in register or not
	wire ra_RegWrite;   //write in register ra
	
	assign wea = {4{MemWrite}};	//If MemWrite is 1, then we need to write in memory, so wea=1111
	instr_decoder D(instr, clk, start, Branch, MemRead, MemtoReg, ALUop, MemWrite, ALUsrc, RegWrite, ra_RegWrite);
	RegBank R(instr[25:21], instr[20:16], clk, RegWrite, ra_RegWrite, (MemtoReg || MemWrite), instr[25:21], data, pc_4, start, rd1, rd2, ra, write_data);
	sign_extend S1(instr[15:0], sign_extended_imm);
	mux_32bit M2(ALUsrc, rd2, sign_extended_imm, alu_data);	//Choose immediate value or value of 2nd register to calculate in ALU
	alu A(clk, ALUop, ALUsrc, instr[26], rd1, alu_data, instr[3:0], instr[10:6], alu_out, carryflag, zflag, overflowflag, signflag, DA);
	mux_32bit M3(MemtoReg, alu_out, doutd, data);	//Register write using ALU output or Memory output
	sign_extend_26to32 S2(instr[25:0], label);
	branch B(clk, branch, instr[31:26], rd1, ra, label, zflag, carryflag, overflowflag, signflag, start, PC, pc_4);	//Program Counter (PC=label if appr branching conditions satisfied, else PC=PC+4)

endmodule
