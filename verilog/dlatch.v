//D Latch
//
module DLatches (d, clk, aclr, qldc, qld);
	input d, clk, aclr;
	output reg qldc, qld;
	always @(clk or d)
	begin
		if (clk == 1)
			qld <= d;
	end
	always @(clk or d or aclr)
	begin
		if(aclr == 1) 
			qldc <= 0;
		else if (clk == 1)
			qldc <= d;
	end
endmodule