//MUX4 using mux2
//mux2 file: mux_dataflow.v

module mux4(a,b,sel,y);
	input [3:0] a,b;
	input sel;
	output [3:0] y;
	
	wire [3:0] low, high;
	mux2 lowmux(a,b,s[0],low);
	mux2 highmux(c,d,s[0],high);
	mux2 outmux(low,high,s[1],y);
endmodule

//we could have also made this by nesting conditional statements