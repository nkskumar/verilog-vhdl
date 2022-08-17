// D flip flop
//
module DFF (
	input D, Ck,
	output reg Q
);
	always @(posedge Ck)
		Q <= D;
endmodule