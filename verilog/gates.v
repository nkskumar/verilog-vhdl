//gates
//

module gates (						//module and name
	input A, B, C, D,
	input [3:0] vA, vB,
	output W, U, X, Y, Z,
	output [3:0] vX, vY);
	
	assign W = A & B;				//scalar AND gate
	assign U = ~(A | B);			//scalar NOR gate
	assign X = C ^ D;				//scalar XOR gate
	assign Y = C ~^ D;				//scalar XNOR gate
	assign Z = (A & B) | (C & D);	// AND-OR Gates
	assign vX = vA & vB;			//vector bitwise AND
	assign vY = vA | vB;			//vector bitwise OR

endmodule
	