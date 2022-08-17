//4-bit adder
//

module add4 (				  //   module and name
	input [3:0] A, B, //I. port declarations
	input Cin,
	output Cout,
	output wire [3:0] Sum );
	
	assign {Cout, Sum} = A + B + Cin;

endmodule