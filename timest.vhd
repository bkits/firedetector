----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:23:31 01/11/2017 
-- Design Name: 
-- Module Name:    timest - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity timest is
port( clk : in std_logic;
--		en : in std_logic;
		rst: in std_logic;
		time_out : out std_logic_vector( 3 downto 0)
	  );
end timest;

architecture Behavioral of timest is

signal temp : std_logic_vector( 3 downto 0); 

begin

process (clk,rst)
begin
if rst= '1' then
	temp <= "0000";
elsif rising_edge(clk) then
--if en='1' then
	if temp = "1111" then
		temp <= "0000";
	else
		temp <= temp + 1;
	end if;
--end if;	
end if;
end process;
time_out <= temp;
end Behavioral;

