----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:02:30 01/11/2017 
-- Design Name: 
-- Module Name:    req_to_pulse - Behavioral 
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

entity req_to_pulse is
port (
		req : in std_logic;
		clk : in std_logic;
		pulse :out std_logic
		);
end req_to_pulse;

architecture Behavioral of req_to_pulse is

signal count : integer range 0 to 25000001;
signal temp : std_logic;

begin

process(clk,req)
begin
if (req = '1') then
if (rising_edge(clk)) then
	if count=0 then
		temp <= '1';
	else
		temp <= '0';
	end if;
	if (count = 25000-1) then --- *1000
		count <= 0;
   else
		count <= count+1;
	end if;
end if;

else
	count <= 0;
	temp <= '0';
end if;
end process;
pulse <=  temp;
end Behavioral;

