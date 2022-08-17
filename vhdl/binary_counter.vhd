library ieee;
use ieee.std_logic_1164.all;

--entity
entity Counter is port (
	clk, reset, load, en : in std_logic;
	d 		  : in std_logic_vector(3 downto 0);
	q		  : out std_logic_vector(3 downto 0));
end entity Counter;

--architecture
architecture Counter_Arch of Counter is begin
	count_proc : process (clk,reset,load,en)
	begin 
		if (reset = '1')	then q <= "0000";
		elsif (rising_edge(clk)) then
			if (load = '1')	then q <= d;
			elsif (en = '1') then q <= q + 1;
									--2008
			end if;
		end if;
	end process count_proc;
end architecture Counter_Arch;