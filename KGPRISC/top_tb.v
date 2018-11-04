/*
SINGLE CYCLE CPU (KGPRISC)
ASSIGNMENT: 7
GROUP: 32
NAME: Nikhil Nayan Jha (16CS30022)
	   Sarthak Chakraborty (16CS30044)
*/

`timescale 1ns / 1ps
module top_tb;

	// Inputs
	reg clk;
	reg clkf;
	reg start;

	// Outputs
	wire stop;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.clkf(clkf),
		.start(start), 
		.stop(stop)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clkf=0;
		start = 0;

		// Wait 100 ns for global reset to finish
		#10
      start=1; 
		// Add stimulus here

	end
      
	always
	#3 clk=!clk;
		
	always
	#1 clkf = !clkf;
endmodule

