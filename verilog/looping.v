//And scalar g with vector A
//
module scalarAnd
	#(parameter N = 4);
	 (input g,
	  input [N-1:0] a,
	  output [N-1:0] y);
	 reg [N-1:0] tmp, y;
	 integer i; //loop index, not signal
	 always @(a or g)
	 begin
		for(i=0;i<N;i=i+1)
			begin
				tmp[i] = a[i] & g;
			end
		y = tmp;
	end
endmodule