--Joining and Splitting buses.

library ieee;
use ieee.std_logic_1164.all;

--entity
entity bus_js is port (
	A	: in std_logic_vector(4 downto 0);
	B	: in std_logic_vector(2 downto 0);
	X,Y : out std_logic;
	Dout : out std_logic_vector(5 downto 0) );
end entity bus_js;

--Architecture
architecture js_arch of bus_js is
	begin js_proc : process(A,B) begin
		Dout <= (B(2) & B(1) & B(0) &
				 A(2) & A(1) & A(0));
		X <= A(3);
		Y <= A(4);
	end process js_proc;
end architecture js_arch;
		