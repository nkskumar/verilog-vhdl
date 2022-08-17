//gates : vector reduction
//

module gates (					//module and name
	input [3:0] vA, vB, vC, vD,
	output W, U, X, Y, Z);
	assign W = & vA;			// Vector reduction AND gate
	assign U = ~| vB;			//Vector reduction NOR gate
	assign X = ^ vC;			//Vector reduction XOR gate
	assign Y = | vA & vB;		//bitwise or reduction?
	assign Z = | (vA & vB);		//bitwise AND, reduction OR
endmodule
	