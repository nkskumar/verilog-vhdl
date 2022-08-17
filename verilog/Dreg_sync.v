//Data Register
//
module Dreg (
	input wire [3:0] d,
	input wire clk, reset, load,
	output reg [3:0] q
	);
	always @(posedge clk or negedge reset)
	begin
		if (!reset) //asynchronous reset
			q <= 0;
		else if (load == 1)
			q <= d;
	end
endmodule