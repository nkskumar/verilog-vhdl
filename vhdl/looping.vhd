library ieee;
use ieee.std_logic_1164.all;

--Architecture
architecture Loop_Arch of my_loop is begin
	while (I <= 8) loop
		if (B = '1') then
			Z(I) <= A(I);
		end if;
		I := I + 1;
	end loop;

end architecture Loop_Arch;