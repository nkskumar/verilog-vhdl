library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

--entity : no port list!
entity tb_adder is 	end entity tb_adder;

--Architecture
architecture test_arch of tb_adder is 
	component Add4 port (
		Data1,Data2 : in std_logic_vector(3 downto 0);
		Cin			: in std_logic;
		Cout		: out std_logic;
		Sum			: out std_logic_vector(3 downto 0));
	end component Add4;
	
	signal a_tb, b_tb : std_logic_vector(3 downto 0); --INPUT
	signal Cin		  : std_logic;					  --INPUT
	signal Sum_tb	  : std_logic_vector(3 downto 0);  --OUTPUT
	signal Cout_tb	  : std_logic;					  --OUTPUT
	signal expect	  : std_logic_vector(3 downto 0); --expected
	
	begin
		--DUT Instantiation
		DUT : Add4 port map(
			Data1 => a_tb, Data2 => b_tb,
			Cin => Cin, Cout => Cout_tb, Sum => Sum_tb);
		--Stimulus by hand drawn waves, poor coverage
		stim_proc : process begin
		 wait for 0ns;
			a_tb <= "0010"; b_tb <= "0010"; Cin <= '0'; expect <= "0100";
		 wait for 10ns;
			a_tb <= "1111"; b_tb <= "0000"; Cin <= '1'; expect <= "0000";
		 wait for 10ns;
			a_tb <= "0010"; b_tb <= "0100"; Cin <= '1'; expect <= "0111";
		 wait;
		end process stim_proc;
	--Monitor, use ieee.std_logic_textio.all;
	--		 use std.textio.all;
	txt_out : process (Sum_tb, Cout_tb)
		variable str_o : line;
	begin
		write(str_o, string'(" a=")); write(str_o,a_tb);
		write(str_o, string'(" b=")); write(str_o,b_tb);
		write(str_o, string'(" cin=")); write(str_o,Cin);
		write(str_o, string'(" sum=")); write(str_o,Sum_tb);
		write(str_o, string'(" cout=")); write(str_o,Cout_tb);
		write(str_o, string'(" expect=")); write(str_o,expect);
		assert false report time'image(now) & str_o.all
			severity note;
	end process txt_out;
end architecture text_arch;