/*
SINGLE CYCLE CPU (KGPRISC)
ASSIGNMENT: 7
GROUP: 32
NAME: Nikhil Nayan Jha (16CS30022)
	   Sarthak Chakraborty (16CS30044)
*/

`timescale 1ns / 1ps
module sign_extend_26to32(
   input [25:0] in,
   output [31:0] out
    );

	wire [5:0] a = {6{in[25]}};
	assign out = {a , in};

endmodule
