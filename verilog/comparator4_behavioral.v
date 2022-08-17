//behavioral model

module COMPARATOR
	(input [3:0] A,B ,
	output Y);
	
	integer N;
	reg Y;
	
	always @(A or B)
	 begin: COMPARE
		Y = 0;
		if (A == B)
			Y = 1;
	 end
endmodule