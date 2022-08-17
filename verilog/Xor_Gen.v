//Generate n XOR gates
//
module XorGen
	#(parameter width = 4,
				delay = 10);
	 (output [1:width] xout,
	  input [1:width] xin1, xin2
	 );
	 generate
		genvar i;
		for (i=1; i < width; i=i+1)
		begin
			assign #delay
				xout[i] = xin1[i] ^ xin2[i];
		end
	 endgenerate
endmodule