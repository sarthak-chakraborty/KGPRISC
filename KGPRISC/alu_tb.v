`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:27:21 11/02/2018
// Design Name:   alu
// Module Name:   /home/sarthak/KGPRISC/alu_tb.v
// Project Name:  KGPRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_tb;

	// Inputs
	reg ALUop;
	reg ALUsrc;
	reg ac;
	reg [31:0] x;
	reg [31:0] y;
	reg [3:0] func;
	reg [4:0] shamt;

	// Outputs
	wire [31:0] out;
	wire carryflag;
	wire zflag;
	wire overflowflag;
	wire signflag;
	wire [31:0] DA;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.ALUop(ALUop), 
		.ALUsrc(ALUsrc), 
		.ac(ac), 
		.x(x), 
		.y(y), 
		.func(func), 
		.shamt(shamt), 
		.out(out), 
		.carryflag(carryflag), 
		.zflag(zflag), 
		.overflowflag(overflowflag), 
		.signflag(signflag), 
		.DA(DA)
	);

	initial begin
		// Initialize Inputs
		ALUop = 0;
		ALUsrc = 0;
		ac = 0;
		x = 0;
		y = 0;
		func = 0;
		shamt = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

