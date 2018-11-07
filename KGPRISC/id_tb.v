`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:56:17 11/02/2018
// Design Name:   instr_decoder
// Module Name:   /home/sarthak/KGPRISC/id_tb.v
// Project Name:  KGPRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instr_decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module id_tb;

	// Inputs
	reg [31:0] instr;
	reg clk;
	reg start;

	// Outputs
	wire Branch;
	wire MemRead;
	wire MemtoReg;
	wire ALUop;
	wire MemWrite;
	wire ALUsrc;
	wire RegWrite;
	wire ra_RegWrite;

	// Instantiate the Unit Under Test (UUT)
	instr_decoder uut (
		.instr(instr), 
		.clk(clk), 
		.start(start), 
		.Branch(Branch), 
		.MemRead(MemRead), 
		.MemtoReg(MemtoReg), 
		.ALUop(ALUop), 
		.MemWrite(MemWrite), 
		.ALUsrc(ALUsrc), 
		.RegWrite(RegWrite), 
		.ra_RegWrite(ra_RegWrite)
	);

	initial begin
		// Initialize Inputs
		instr = 0;
		clk = 0;
		start = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		instr = 32'b00001010101000000000000000000100;
		start=1;
		
		#100
		instr = 32'b00000010101101011010100000000000;
	end
      
	always
	 #22 clk=!clk;
	 
endmodule

