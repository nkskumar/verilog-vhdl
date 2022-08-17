library ieee;
use ieee.std_logic_1164.all;

architecture XorGen_Arch of XorGen is begin

	Gen_proc : for i in 0 to 7 generate
		Xout(i) <= Ain(i) xor Bin(i);
	end generate Gen_proc;

end architecture XorGen_Arch;
