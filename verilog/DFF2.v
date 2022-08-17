//D Flip Flops 2
//
module DFF (d, clk, clr, reset, qld, qlda, qlds);
	input d, clk, clr, reset;
	output reg qld, qlda, qlds;
	always @(posedge clk) 		//with posedge!
	begin
		qld <= d;	//standard FF
		if(reset == 0)
			qlds <= 0;
		else
			qlds <= d; // FF with sync reset
	end
	always @(posedge clk or negedge clr)
	begin
		if(clr == 0)
			qlda <= 0;
		else
			qlda <= d; //FF with async reset
	end
endmodule