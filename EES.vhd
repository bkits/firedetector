----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:59:54 11/07/2016 
-- Design Name: 
-- Module Name:    EES - Behavioral 
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

entity EES is
port (
		val_in : in std_logic_vector (7 downto 0);
		clk : in std_logic;
		rst : in std_logic;
		rst2 : in std_logic;
		bound1 : in std_logic_vector (7 downto 0);
		bound2 : in std_logic_vector (7 downto 0);
		time1 : in std_logic_vector (7 downto 0);
		time2 : in std_logic_vector (7 downto 0);
		time3 : in std_logic_vector (7 downto 0);
		data_out : out std_logic_vector (9 downto 0);
		req_val : out std_logic
		);
end EES;

architecture Behavioral of EES is

type state_type is (idl,s0,s00,s1,s2,s3);
signal state : state_type;
signal count : std_logic_vector (7 downto 0);
signal bound_1,bound_2,time_1,time_2,time_3 : std_logic_vector (7 downto 0);

begin


process(clk,rst,rst2,bound1,bound2,time1,time2,time3)
begin
	if (rst = '1' ) then
		state <= s0;
		data_out<= (others => '0');
		req_val <= '0';
		count<="00000000";
		bound_1 <= bound1;
		bound_2 <= bound2;
		time_1 <= time1(6 downto 0) & '0' - 3;
		time_2 <= time2(6 downto 0) & '0' - 3;
		time_3 <= time3(6 downto 0) & '0' - 3;		
	elsif (rst2 = '1' ) then
		data_out<= (others => '0');
		req_val <= '0';
		count<="00000000";
		state <= idl;
	elsif rising_edge(clk) then
		case state is
			when idl => count<="00000000";req_val <= '0';state <= idl;
			when s0 => 	count<="00000000";req_val <= '1';state<=s00;
			when s00 => if (val_in <= bound_1) then
								data_out <= "01" & val_in;
								req_val <= '0';
								if (time1 /= "00000001") then
									state<=s1;
								else
									state <= s0;
								end if;
								
							elsif (val_in > bound_1 and val_in < bound_2) then
								data_out <= "10"&val_in;
						    	req_val <= '0';
								if (time2 /= "00000001") then
									state<=s2;
								else
									state <= s0;
								end if;
								
		               elsif (val_in >= bound_2) then
								data_out <= "11"&val_in;
								req_val <= '0';
								if (time3 /= "00000001") then
									state<=s3;
								else
									state <= s0;
								end if;
								
							else
								state<=s0;
								req_val <= '0';
							end if;
							
		   when s1 =>	if (count = time_1) then
								req_val<='0';
								count <= "00000000";
								state<=s0;
							else
								count<=count+1;
								req_val<='0';
								state<=s1;
							end if;
							data_out <= "01"&val_in;
			
			when s2 => if (count = time_2) then
								req_val<='0';
								count <= "00000000";
								state<=s0;
							else
								count<=count+1;
								req_val<='0';
								state<=s2;
							end if;
							data_out <= "10"&val_in;

			when s3 => if (count = time_3) then
								req_val<='0';
								count <= "00000000";
								state<=s0;
							else
								count<=count+1;
								req_val<='0';
								state<=s3;
							end if;
							data_out <= "10"&val_in;
														
							
			when others => state<=s0;

		end case;
	end if;
end process;
end Behavioral;

