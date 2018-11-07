/*
SINGLE CYCLE CPU (KGPRISC)
ASSIGNMENT: 7
GROUP: 32
NAME: Nikhil Nayan Jha (16CS30022)
      Sarthak Chakraborty (16CS30044)
*/

`timescale 1ns / 1ps
module clock_divider(
    input clkf,
	 input start,
    output reg clk
    );

reg [1:0] breaker;
always @(clkf)
begin
	if (start==0)
		clk=1;
	else if (breaker==0)
		breaker=1;
	else if (breaker==1)
		breaker=2;
	else if (breaker==2)
		breaker=3;
	else
	begin
		breaker=0;
		clk=!clk;
	end
end

endmodule
