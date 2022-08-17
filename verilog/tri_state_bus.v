//Tri-state bus
//
module Tri (
	input wire [3:0] Dout,
	input wire OE,
	output wire [3:0] Pinout
	);
	assign Pinout = (OE == 1) ? Dout : 
					(OE == 0) ? 4'bz : 4'bx;
endmodule