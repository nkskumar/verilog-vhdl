//2 input muxes in parallel
//

module bus_mux(a, b, sel, outp);
	parameter n = 2;
	input [n-1:0] a;
	input [n-1:0] b;
	input sel;
	output outp;
	wire [n-1:0] sel_bus;
assign sel_bus = {n{sel}}; //replicates 2 times

assign outp = (~sel_bus & a) | (sel_bus & b);

endmodule.