----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:56:46 10/18/2016 
-- Design Name: 
-- Module Name:    clk_div - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_div is
    Port ( clk_50M : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk_1 : out  STD_LOGIC);
end clk_div;

architecture Behavioral of clk_div is

signal temp : integer range 0 to 25000001;
signal clk_t : STD_LOGIC;

begin

process (clk_50M,rst)
begin
	if rst='1' then
		temp <= 0 ;
		clk_t <= '1';
	elsif rising_edge(clk_50M) then
		if temp = 12500-1 then--8elei *1000
			temp <= 0;
			clk_t <= not clk_t;
		else
			temp <= temp + 1;
		end if;
	end if;
end process;
clk_1 <= clk_t;
end Behavioral;

