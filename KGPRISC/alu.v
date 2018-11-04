/*
SINGLE CYCLE CPU (KGPRISC)
ASSIGNMENT: 7
GROUP: 32
NAME: Nikhil Nayan Jha (16CS30022)
	   Sarthak Chakraborty (16CS30044)
*/

`timescale 1ns / 1ps
module alu( input clk,
				input ALUop,
				input ALUsrc,
				input ac, 
				input signed [31:0] x,
				input signed [31:0] y,
				input [3:0] func,
				input [4:0] shamt,
				output reg [31:0] out,
				output reg carryflag,
				output reg zflag,
				output reg overflowflag,
				output reg signflag,
				output [31:0] DA
			);
			
reg unsigned [31:0] X,Y;
assign DA = x+y;

always@(*)
begin
	if(ALUop)
	begin
		if(!ALUsrc)
		begin
			case(func)
			  4'b0000 : begin 	//Add
								X=x;
								Y=y;
								{carryflag,out} = X + Y;
								zflag = (out == 32'b0)? 1'b1 : 1'b0 ;
								signflag = out[31];
								overflowflag = ((x[31]==y[31]) && (out[31] != x[31])) ? 1'b1 : 1'b0 ;
							end
			  4'b0001 : begin 	//Comp
								out = ~y+1;
								zflag = (out == 32'b0)? 1'b1 : 1'b0 ;
								signflag = out[31];
							end
			  4'b0010 : begin 	//And
								out = x & y;
								zflag = (out == 32'b0)? 1'b1 : 1'b0 ;
								signflag = out[31];
							end
			  4'b0011 : begin		//Xor
								out = x ^ y;
								zflag = (out == 32'b0)? 1'b1 : 1'b0 ;
								signflag = out[31];
							end
			  4'b0100 : begin		//shll
								out = x << shamt;
								zflag = (out == 32'b0)? 1'b1 : 1'b0 ;
								signflag = out[31];
							end
			  4'b0101 : begin		//shrl
								out = x >> shamt;
								zflag = (out == 32'b0)? 1'b1 : 1'b0 ;
								signflag = out[31];
							end
			  4'b0110 : begin		//shllv
								out = x << y;
								zflag = (out == 32'b0)? 1'b1 : 1'b0 ;
								signflag = out[31];
							end
			  4'b0111 : begin		//shrlv
								out = x >> y;
								zflag = (out == 32'b0)? 1'b1 : 1'b0 ;
								signflag = out[31];
							end
			  4'b1000 : begin		//shra
								out = x >>> shamt;
								zflag = (out == 32'b0)? 1'b1 : 1'b0 ;
								signflag = out[31];
							end
			  4'b1001 : begin 	//shrav
								out = x >>> y;
								zflag = (out == 32'b0)? 1'b1 : 1'b0 ;
								signflag = out[31];
							end
			endcase
		end
		else
		begin
			case(ac)
				0: begin		//addi
						X=x;
						Y=y;
						{carryflag,out} = X + Y;
						zflag = (out == 32'b0)? 1'b1 : 1'b0 ;
						signflag = out[31];
						overflowflag = ((x[31]==y[31]) && (out[31] != x[31])) ? 1'b1 : 1'b0 ;
					end
				1: begin		//compi
						out = ~y+1;
						zflag = (out == 32'b0)? 1'b1 : 1'b0 ;
						signflag = out[31];
					end
			endcase
		end
	end
end

endmodule
