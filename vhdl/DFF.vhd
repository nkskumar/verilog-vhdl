library ieee;
use ieee.std_logic_1164.all;

entity DFF is port(
	d, clk, reset	:	in std_logic;
	q				: 	out std_logic);
end entity DFF;

--architecture
--could use (clk'event and clk = '1')
architecture DFF_Arch of DFF is
	begin dff_proc_1 : process(clk)
		begin
			if(rising_edge(clk)) then
				if (reset = '1') then q <= '0';
					-- Sync reset
				else 				  q <= d;
				end if;
			end if;
	end process dff_proc_1;
end architecture DFF_Arch;	
			
	