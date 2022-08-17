library ieee;
use ieee.std_logic_1164.all;

--entity
entity Data_Reg is port (
	clk, load, reset 	: 	in std_logic;
	d					: 	in std_logic_vector(3 downto 0);
	q					: 	out std_logic_vector(3 downto 0));
end entity Data_Reg;

--architecture
architecture Reg_Arch of Data_Reg is
	begin dreg_proc : process (clk, reset, load)
		begin
			if (reset = '0')	then q <= '0000';		--Asynchronous
			elsif (rising_edge(clk)) then 				--Synchronous
				if (load = '1')			then q <= d;
				end if;
			end if;
	end process dreg_proc;
end architecture Reg_Arch;
	