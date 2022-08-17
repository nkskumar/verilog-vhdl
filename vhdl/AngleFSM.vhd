library ieee;
use ieee.std_logic_1164.all;

--entity
entity AngleFSM is 
	generic (
		S_Width : integer := 3; --State Width
		An0		: std_logic_vector(3 downto 0) := "000";
		An45	: std_logic_vector(3 downto 0) := "001";
		An90	: std_logic_vector(3 downto 0) := "010";
		An135	: std_logic_vector(3 downto 0) := "011";
		An180	: std_logic_vector(3 downto 0) := "100";
		An225	: std_logic_vector(3 downto 0) := "101";
		An270	: std_logic_vector(3 downto 0) := "110";
		An315	: std_logic_vector(3 downto 0) := "111" );
	port (
		clk, reset, MoveCw, MoveCCw	: in std_logic;
		PhyPosition	: in std_logic_vector(S_Width-1 downto 0);
		DesPosition, PosError : out std_logic_vector(S_Width-1 downto 0));
end entity AngleFSM;

--architecture
architecture FSM_Arch of AngleFSM is
	signal CurrentState, NextState : std_logic_vector(S_Width-1 downto 0);
begin
	comb_proc : process (MoveCw, MoveCCw, PhyPosition, CurrentState)
	begin
		case(CurrentState) is
			when An0 =>
				if    (MoveCw  = '1') then NextState <= An45;
				elsif (MoveCCw = '1') then NextState <= An315;
				else 				  then NextState <= An0;
			when An45 =>
				if    (MoveCw  = '1') then NextState <= An90;
				elsif (MoveCCw = '1') then NextState <= An0;
				else 				  then NextState <= An45;
			when An90 =>
				if    (MoveCw  = '1') then NextState <= An135;
				elsif (MoveCCw = '1') then NextState <= An45;
				else 				  then NextState <= An90;
			when An135 =>
				if    (MoveCw  = '1') then NextState <= An180;
				elsif (MoveCCw = '1') then NextState <= An90;
				else 				  then NextState <= An135;
			when An180 =>
				if    (MoveCw  = '1') then NextState <= An225;
				elsif (MoveCCw = '1') then NextState <= An135;
				else 				  then NextState <= An180;
			when An225 =>
				if    (MoveCw  = '1') then NextState <= An270;
				elsif (MoveCCw = '1') then NextState <= An180;
				else 				  then NextState <= An225;
			when An270 =>
				if    (MoveCw  = '1') then NextState <= An315;
				elsif (MoveCCw = '1') then NextState <= An225;
				else 				  then NextState <= An270;
			when An315 =>
				if    (MoveCw  = '1') then NextState <= An0;
				elsif (MoveCCw = '1') then NextState <= An270;
				else 				  then NextState <= An315;
			when others =>				   NextState <= An0;
		end case;
	end process comb_proc;
	clk_proc : process (clk, reset) begin
		if (reset = '1') then CurrentState <= PhyPosition;
		elsif (rising_edge(clk)) then CurrentState <= NextState;
	end process clk_proc;
	--Output Logic
	--Moore Output
	DesPosition <= CurrentState;
	--Mealy Output
	PosError <= DesPosition - PhyPosition;
end architecture FSM_Arch;