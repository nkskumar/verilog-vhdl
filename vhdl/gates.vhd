library ieee;
use ieee.std_logic_1164.all;


--entity
entity gates is port(
	vA, vB	  : in std_logic_vector(3 downto 0);
	A,B,C,D	  : in std_logic;
	W,U,X,Y,Z : out std_logic;
	vX, vY	  : out std_logic_vector(3 downto 0);
);
end entity gates;

--Architecture
--RTL
architecture RTL of gates is
begin
	W <= A and B; 	U <= A nor B;	--AND, NOR
	X <= C xor D;	Y <= C xnor D;	--XOR, XNOR
	Z <= (A and B) or (C and D);	--AND-OR
	vX <= vA and vB;				--Bitwise AND
	vY <= vA or vB;					--Bitwise OR
end architecture RTL;

	