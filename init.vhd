----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:20:31 01/17/2017 
-- Design Name: 
-- Module Name:    init - Behavioral 
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

entity init is
port (	
			clk : in std_logic;
			rst : in std_logic;
			val : in std_logic;
			data_in : in std_logic_vector (7 downto 0);
			o_0 : out std_logic_vector (7 downto 0);
			o_1 : out std_logic_vector (7 downto 0);
			o_2 : out std_logic_vector (7 downto 0);
			o_3 : out std_logic_vector (7 downto 0);
			o_4 : out std_logic_vector (7 downto 0);
			en_ees : out std_logic
		);
end init;

architecture Behavioral of init is

signal count: std_logic_vector (2 downto 0):="000";
signal ro_0,ro_1,ro_2,ro_3,ro_4 : std_logic_vector (7 downto 0);
signal reg,rreg,enn : std_logic :='0' ;

begin

process (val,rst)
begin
if rst='1' then
	count<="000";
elsif rising_edge(val) then
	if count="111" then
		count<="000";
	else
		count<=count + 1;
	end if;
end if;
end process;

swich: process(clk)
begin
if rising_edge(clk) then
	if count = "001" then
		ro_0 <= data_in;
		reg <= '0';
	elsif count="010" then
		ro_1 <= data_in;
		reg <= '0';
	elsif count="011" then
		ro_2 <= data_in;
		reg <= '0';
	elsif count="100" then
		ro_3 <= data_in;
		reg <= '0';
	elsif count="101" then
		ro_4 <= data_in;
		reg <= '1';
	else
		reg <= '0';
	end if;
	rreg<=val;
end if;
end process;

hold_rst: process(clk,rst)
begin
if rst='1' then
	en_ees<='0';
elsif rising_edge(clk) then
en_ees<=enn;
end if;
end process;

o_0 <= ro_0;
o_1 <= ro_1;
o_2 <= ro_2;
o_3 <= ro_3;
o_4 <= ro_4;
--en_ees 
enn <= reg and rreg;
end Behavioral;

