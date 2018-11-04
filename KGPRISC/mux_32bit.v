/*
SINGLE CYCLE CPU (KGPRISC)
ASSIGNMENT: 7
GROUP: 32
NAME: Nikhil Nayan Jha (16CS30022)
	   Sarthak Chakraborty (16CS30044)
*/

`timescale 1ns / 1ps
module mux_32bit(input select,
					  input [31:0] a,
					  input [31:0] b,
					  output [31:0] out
    );

	assign out = select?b:a;

endmodule
