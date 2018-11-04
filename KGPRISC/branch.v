/*
SINGLE CYCLE CPU (KGPRISC)
ASSIGNMENT: 7
GROUP: 32
NAME: Nikhil Nayan Jha (16CS30022)
	   Sarthak Chakraborty (16CS30044)
*/

`timescale 1ns / 1ps
module branch( input clk,
					input branch,
					input [5:0] instr,
					input [31:0] rd1,
					input [31:0] ra,
					input [31:0] label,
					input zflag,
				   input carryflag,
				   input overflowflag,
				   input signflag,
					input start,
					output reg [31:0] PC,
					output reg [31:0] pc_4
				   
    );

	always@(posedge clk)
	begin
		if(!start)
			PC = 32'b0;
		else
		begin
			case (instr)
				6'b010000:	//b
					begin
						PC=label;
					end
				6'b010001:	//br
					begin
						PC=rd1;
					end
				6'b010010:	//bz
					begin
						if(zflag)
							PC=label;
						else
							PC=PC+4;
					end
				6'b010011:	//bnz
					begin
						if(!zflag)
							PC=label;
						else
							PC=PC+4;
					end
				6'b010100:	//bcy
					begin
						if(carryflag)
							PC=label;
						else
							PC=PC+4;
					end
				6'b010101:	//bncy
					begin
						if(!carryflag)
							PC=label;
						else
							PC=PC+4;
					end
				6'b010110:	//bs
					begin
						if(signflag)
							PC=label;
						else
							PC=PC+4;
					end
				6'b010111:	//bns
					begin
						if(!signflag)
							PC=label;
						else
							PC=PC+4;
					end
				6'b011000:	//bv
					begin
						if(overflowflag)
							PC=label;
						else
							PC=PC+4;
					end
				6'b011001:	//bnv
					begin
						if(!overflowflag)
							PC=label;
						else
							PC=PC+4;
					end
				6'b000110:  //Call
					begin
						pc_4 = PC+4;
						PC=label;
					end
				6'b000111:   //Ret
					begin
						PC=ra;
					end
				default:
					begin
						PC=PC+4;
					end	
			endcase
		end
	end
	
endmodule
