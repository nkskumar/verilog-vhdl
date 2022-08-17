library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--entity
entity regFile is
	generic (Dwidth : integer := 8;
			 Awidth : integer := 2);
	port (
		clk, wren : in std_logic;
		wdata	  : in std_logic_vector(Dwidth-1 to 0);
		waddr, raddr : in std_logic_vector(Awidth-1 to 0);
		rdata		 : out std_logic_vector(Dwidth-1 to 0)
);
end entity regFile;

--architecture
architecture RFile_Arch of regFile is
	type array_type (0 to 2**Awidth-1) of std_logic_vector (Dwidth-1 downto 0);
	signal array_reg : array_type;
  begin rf_proc : process (clk, wren, wdata, waddr, raddr)
	begin
		if (rising_edge(clk))	then
			if (wren = '1')		then
				array_reg(to_integer(unsigned(waddr))) <= wdata;
			end if;
			rdata <= array_reg(to_integer(unsigned(raddr)));
		end if;
  end process rf_proc;
end architecture RFile_Arch;

	