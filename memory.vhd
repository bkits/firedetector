library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memory is
    Port(rst     : in std_logic;
        next_val : in std_logic;
        mem_out  : out std_logic_vector(7 downto 0));
end memory;

architecture memory_beh of memory is

type ram_type is array (0 to 19) of std_logic_vector(7 downto 0);

signal ROM_mem : ram_type := (X"15", X"16", X"16", X"1F", X"20", X"20", X"2D", X"2D", X"3C", X"22", X"22", X"15", X"15", X"17", X"17", X"50", X"5A", X"5A", X"7F", X"7F"); 
signal count : integer range 0 to 19;

begin
	process(next_val, rst)
	begin
		if rst = '1' then
			count <= 0;
		elsif rising_edge(next_val) then
			if count >= 19 then
				count <= 0;
			else
				count <= count + 1;
			end if;
			mem_out <= ROM_mem(count);
		end if;
end process;

end memory_beh;
