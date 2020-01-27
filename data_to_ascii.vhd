----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:17:58 01/05/2017 
-- Design Name: 
-- Module Name:    data_to_ascii - Behavioral 
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

entity data_to_ascii is
port (
		clk : in STD_LOGIC;
		en : in STD_LOGIC;
		rst : in STD_LOGIC;
		data_in : in STD_LOGIC_VECTOR ( 14 downto 0);
		timestamp : in STD_LOGIC_VECTOR ( 7 downto 0);
		wr_e : out STD_LOGIC;
		data_out : out STD_LOGIC_VECTOR ( 7 downto 0)
		);
end data_to_ascii;

architecture Behavioral of data_to_ascii is

type state_type is (s6,s00,s0,s1,s2,s3,s4,s4a,s4b,s4c,s5,c0,c1,c2,c3,c4,c5,c6,c7);
signal state : state_type;
signal data_ini : STD_LOGIC_VECTOR ( 14 downto 0);
signal timestampi : STD_LOGIC_VECTOR ( 7 downto 0);
signal count : STD_LOGIC_VECTOR ( 3 downto 0);


begin
process(clk,rst)--en
begin
--if (en='1') then
--	data_out <= "00100001"; --33 !
--	state <= s0;
--	wr_e <= '0';
--	data_ini <= "000000000000000";
--	timestampi <= "00000000";
--els
if (rst='1') then
	data_out <= "00100001"; --33 !
	state <= s6;
	wr_e <= '0';
	data_ini <= "000000000000000";
	timestampi <= "00000000";
	count<="0000";
elsif rising_edge(clk) then
	case state is
			when s00 => data_ini <= data_in;
							timestampi <= timestamp;
							wr_e <= '0';
							if (en='1') then
								state <= s0;
							else 
								state <= s00;
							end if;
			
			when s0 =>	if ( data_ini (14) = '0') then
								data_out <= "00110000"; --48 0
							else
								data_out <= "00110001"; --49 1
							end if;
							wr_e <= '1';
							state <= c0;
							
			when c0 =>	state <= s1;
							wr_e <= '0';
														
			when s1 =>	if ( data_ini (13 downto 12) = "01") then
								data_out <= "01001100"; --76 L
							elsif ( data_ini (13 downto 12) = "10") then
								data_out <= "01001000"; --72 H
							elsif ( data_ini (13 downto 12) = "11") then
								data_out <= "01000101"; --69 E
							else
								data_out <= "00100001"; --33 !
							end if;
							wr_e <= '1';
							state <= c1;
							
			when c1 =>	state <= s2;
							wr_e <= '0';
							
			when s2 =>	data_out <= ("0000" & data_ini (11 downto 8)) + 48;--D0
							wr_e <= '1';
							state <= c2;
							
			when c2 =>	state <= s3;
							wr_e <= '0';				
														
			when s3 =>	data_out <= ("0000" & data_ini (7 downto 4)) + 48;--D1
							wr_e <= '1';
							state <= c3;
							
			when c3 =>	state <= s4;
							wr_e <= '0';			
							
			when s4 =>	data_out <= ("0000" & data_ini (3 downto 0)) + 48;--D2
							wr_e <= '1';
							state <= c4;
							
			when 	c4 => 	state <= s4a;
							wr_e <= '0';			
							
			when s4a =>	data_out <="00100011";--# 35
							wr_e <= '1';
							state <= c5;
							
			when 	c5 => 	state <= s4b;
							wr_e <= '0';				
							
							
			when s4b =>	data_out <= ("0000" & timestampi (7 downto 4)) + 48;--T0
							wr_e <= '1';
							state <= c6;
							
			when 	c6 => 	state <= s4c;
							wr_e <= '0';				
							
			when s4c =>	data_out <= ("0000" & timestampi (3 downto 0)) + 48;--T1
							wr_e <= '1';
							state <= c7;
							
			when 	c7 => 	state <= s5;
							wr_e <= '0';							
							
			when s5 =>	data_out <= "00001101";--/n
							wr_e <= '1';
							state <= s6;
							
			when s6 =>	data_out <= "00100001";
							wr_e <= '0';
							state <= s00;
				
			when others => data_out <= "00000000";
								state <= s0;
								wr_e <= '0';
	end case;
--if count="0000" then
--		if ( data_in(14) = '0') then
--								data_out <= "00110000"; --48 0
--			else
--								data_out <= "00110001"; --49 1
--			end if;
--		wr_e <= '1';
--elsif count="0001" then
--		wr_e <= '0';					
--elsif count="0010" then		
--			if ( data_ini (13 downto 12) = "01") then
--								data_out <= "01001100"; --76 L
--							elsif ( data_ini (13 downto 12) = "10") then
--								data_out <= "01001000"; --72 H
--							elsif ( data_ini (13 downto 12) = "11") then
--								data_out <= "01000101"; --69 E
--							else
--								data_out <= "00100001"; --33 !
--							end if;
--							wr_e <= '1';
--elsif count="0011" then
--	wr_e <= '0';
--elsif count="0100" then
--	data_out <= ("0000" & data_ini (11 downto 8)) + 48;--D0
--	wr_e <= '1';
--elsif count="0101" then
--	wr_e <= '0';
--elsif count="0110" then
--	data_out <= ("0000" & data_ini (7 downto 4)) + 48;--D1
--	wr_e <= '1';
--elsif count="0111" then
--	wr_e <= '0';							
--elsif count="1000" then
--	data_out <= ("0000" & data_ini (3 downto 0)) + 48;--D2
--	wr_e <= '1';
--elsif count="1001" then
--	wr_e <= '0';							
--elsif count="1010" then							
--	data_out <= ("0000" & timestampi (7 downto 4)) + 48;--T0
--	wr_e <= '1';	
--elsif count="1011" then
--	wr_e <= '0';							
--elsif count="1100" then							
--	data_out <= ("0000" & timestampi (3 downto 0)) + 48;--T1			
--	wr_e <= '1';
--elsif count="1101" then
--	wr_e <= '0';							
--elsif count="1110" then
--	data_out <= "00001101";--/n
--	wr_e <= '1';				
--else 
--	wr_e <= '0';
--end if;
--
--if en='1' then
--	count<="0000";
--else
--count <= count+1;
--end if;
--
end if;
end process;
end Behavioral;

