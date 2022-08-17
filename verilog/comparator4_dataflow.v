//dataflow model

module COMPARATOR
	(A, B, Y);		//Verilog-1995 syntax
	input [3:0] A,B,
	output Y;
	
	assign Y = & ( (A~^B));
endmodule