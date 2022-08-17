library ieee;
use ieee.std_logic_1164.all;

--Testbench entity : no port list
entity Counter_tb is end entity Counter_tb;

--Testbench architecture
architecture Counter_arch of Counter_tb is
	component Counter port (
		d : in std_logic_vector(3 downto 0);
		clk, reset, load, en : in std_logic;
		q : out std_logic_vector(3 downto 0));
	end component Counter;
	
	constant delay : integer := 10; --wait
	constant n	   : integer := 4; --width counter
	constant T     : time 	 := 20ns; --clock period
	signal clock   : std_logic := '0'; --clock generator
	signal reset   : std_logic := '0'; --reset generator
	signal data_tb : std_logic_vector(n-1 downto 0) := "0000";
	signal load	   : std_logic := '0'; --stimulus
	signal en 	   : std_logic := '0'; --stimulus
	signal q_tb	   : std_logic_vector(3 downto 0); --output
	signal check   : std_logic_vector(n-1 downto 0) := "0000"; --compare to counter
	
	begin
	--DUT Instantiation
	DUT : Counter port map (
		d	 => data_tb,
		clk  => clock,	reset => reset,
		load => load,	en	  => en,
		q 	 => q_tb );
	
	clk_gen : process begin
		clock <= '0';
		wait for T/2; --10 nsec of 0
		clock <= '1';
		wait for T/2; --10 nsec of 1, for  20 nsec period
	end process;
	
	reset <= '1', '0' after 10ns; --10 nsec
	
	test_proc : process
		variable line_o : line;
	begin
		wait until falling_edge(reset); -- wait for reset
		wait until falling_edge(clock); -- wait for a clock
		load <= '1'; en <= '0';
		data_tb <= "1010";
		wait until falling_edge(clock);
		if (q_tb /= "1010") then
			write(line_o, string'("Load fail "));
			write(line_o, q_tb);
			writeline(output, line_o);
		end if;
	check <= "1010";
	load  <= '0';
	en    <= '1';

	for i in 1 to 2**n loop
		check <= check + 1;
		wait until falling_edge(clock);
		if(q_tb /= check) then
			report "count fail at time count" & time'image(now) & integer'image(i);
		end if;
	end loop;
	wait;
	end process test_proc;
end architecture Counter_arch;