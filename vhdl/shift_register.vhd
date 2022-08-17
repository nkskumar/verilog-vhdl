library ieee;
use ieee.std_logic_1164.all;

--entity
entity Shift_Reg is port(
	clk, reset, shift, d0 : in std_logic;
	q : out std_logic_vector(3 downto 0));
end entity Shift_Reg;

--Architecture (Could be SLL or shift_left(q,1)
architecture SREG_Arch of Shift_Reg is 
	begin 
	sreg_proc : process(clk,reset)
	begin
		if (reset = '0')		then q <= '0000'; --Async
		elsif (rising_edge(clk)) then			  --Sync
			if (shift = '1') then
				q(0) <= d0;
				q(1) <= q(0);
				q(2) <= q(1);
				q(3) <= q(2);
			end if;
		end if;
	end process sreg_proc;
end architecture SREG_Arch;
