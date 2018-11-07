/*
SINGLE CYCLE CPU (KGPRISC)
ASSIGNMENT: 7
GROUP: 32
NAME: Nikhil Nayan Jha (16CS30022)
	   Sarthak Chakraborty (16CS30044)
*/

`timescale 1ns / 1ps
module RegBank( input [4:0] rr1,
					  input [4:0] rr2,
					  input clk,
					  input we,
					  input ra_we,
					  input mem,
					  input [4:0] wr,
					  input [31:0] data,
					  input [31:0] pc_4,
					  input start,
					  output [31:0] rd1,
					  output [31:0] rd2,
					  output [31:0] ra,
					  output [31:0] write_data,
					  output reg stop
					);
	reg [31:0] register [31:0];
	
	assign rd1 = mem?register[rr2]:register[rr1];	//Choose for lw/sw instr.
	assign rd2 = register[rr2];
	assign ra = register[31];		//Return address in 31st register
	assign write_data = register[rr1];

	always@(posedge clk)
	begin
		if((register[1]<register[2]) && (register[2]<register[3]) && (register[3]<register[4]))
			stop = 1;
		else
			stop = 0;
	end

	always@(posedge clk)
	begin
		if(start)
		begin
			if(we)	//If write enable, then write in register no. wr
				register[wr] = data;
			if(ra_we)
				register[31] = pc_4;
		end
		else
		begin		//Initial
			register[0] = 0;
			register[1] = 0;
			register[2] = 0;
			register[3] = 0;
			register[4] = 0;
			register[5] = 0;
			register[6] = 0;
			register[7] = 0;
			register[8] = 0;
			register[9] = 0;
			register[10] = 0;
			register[11] = 0;
			register[12] = 0;
			register[13] = 0;
			register[14] = 0;
			register[15] = 0;
			register[16] = 0;
			register[17] = 0;
			register[18] = 0;
			register[19] = 0;
			register[20] = 0;
			register[21] = 0;
			register[22] = 0;
			register[23] = 0;
			register[24] = 0;
			register[25] = 0;
			register[26] = 0;
			register[27] = 0;
			register[28] = 0;
			register[29] = 0;
			register[30] = 0;
			register[31] = 0;
		end
	end

endmodule
