/*
SINGLE CYCLE CPU (KGPRISC)
ASSIGNMENT: 7
GROUP: 32
NAME: Nikhil Nayan Jha (16CS30022)
	   Sarthak Chakraborty (16CS30044)
*/

`timescale 1ns / 1ps
module top( input clk, input clkf, input start, output stop
    );

wire [3:0] wea;
wire [31:0] douti;
wire [31:0] doutd;
wire rst=~start;
wire [31:0] PC;
wire [31:0] DA;
wire [31:0] dina=32'bx;
wire [31:0] write_data;

instr_memory I(		//Instruction Memory - douti(i.e. instructions) are fetched from address PC at every clock pulse
		.clka(clkf), 
		.rsta(rst), 
		.wea(4'b0), 
		.addra(PC), 
		.dina(dina), 
		.douta(douti)
	);

data_memory D(		//Data Memory - doutd(i.e. data) are fetched from address DA at every clock pulse.
		.clka(clkf),//					 write_data is written at address DA when wea=1111.
		.rsta(rst), 
		.wea(wea), 
		.addra(DA), 
		.dina(write_data), 
		.douta(doutd)
	);
	
kgp_risc K(douti, doutd, start, clk, PC, DA, write_data, wea);

endmodule
