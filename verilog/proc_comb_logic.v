//procedural combinational logic
//

module always_combo (
	input A, B, C, D,
	output reg Y);
	
	always @(A or B or C or D)
	begin
		if((C==1) && (D==1))
			Y <= 0;
		else if ((A==1) || (B==1))
			Y <= 1;
		else
			Y <= 0;
	end
endmodule