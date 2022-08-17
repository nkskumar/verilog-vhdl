library ieee;
use ieee.std_logic_1164.all;

--entity
entity ROM is
	generic (D_Width : integer := 8;
			 A_Width : integer := 3 ); --2**3 = 8 address
	port (
		clk : in std_logic;
		addr : in std_logic_vector(A_Width-1 downto 0);
		data : out std_logic_vector(D_Width-1 downto 0) );
end entity ROM;

--Architecture
architecture ROM_Arch of ROM is
	signal rom_d, data_reg : std_logic_vector(D_Width-1 downto 0);
	signal addr_sel : std_logic_vector(2 downto 0);
	
	begin
		addr_sel <= addr;
		
		rom_proc : process (clk) begin
			data_reg <= rom_d;
		end process rom_proc;
		
		lookup_proc : process begin --Lookup Table
			case(addr_sel) is
				when "000" => rom_d <= "10000000"; when "100" => rom_d <= "00000000";
				when "001" => rom_d <= "10101010"; when "101" => rom_d <= "10011001";
				when "010" => rom_d <= "01010101"; when "110" => rom_d <= "10000001";
				when "011" => rom_d <= "10000011"; when "111" => rom_d <= "11110000";
				when others => rom_d <= "00000000"; --+700 cases possible, X, U
			end case;
		end process lookup_proc;
		
		data <= data_reg;
end architecture ROM_Arch;