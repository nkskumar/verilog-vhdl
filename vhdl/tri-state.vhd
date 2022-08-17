library ieee;
use ieee.std_logic_1164.all;

--entity
entity y_tri is port (
	OE	: in std_logic;
	Dout : in std_logic_vector(3 downto 0);
	Pinout : out std_logic_vector(3 downto 0));
end entity y_tri;

--Architecture
architecture tri_arch of y_tri is
begin
	Pinout <= Dout when (OE = '1') else "ZZZZ";
end architecture tri_arch;
