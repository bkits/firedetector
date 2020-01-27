----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:24:41 01/03/2017 
-- Design Name: 
-- Module Name:    scheduler - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity scheduler is
port(
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		req : in STD_LOGIC_VECTOR (1 downto 0);
		count0 : in STD_LOGIC_VECTOR (3 downto 0);
		count1 : in STD_LOGIC_VECTOR (3 downto 0);
		data_i0 : in STD_LOGIC_VECTOR (10 downto 0);
		data_i1 : in STD_LOGIC_VECTOR (10 downto 0);
		wr_b : out STD_LOGIC;
		data_o : out STD_LOGIC_VECTOR (10 downto 0);
		count_o : out STD_LOGIC_VECTOR (3 downto 0)

		);
end scheduler;

architecture Behavioral of scheduler is

--signal count_0,count_1,count0,count1 : STD_LOGIC_VECTOR (3 downto 0);
--signal cc : STD_LOGIC;
type state_type is (s00,s3,s1,s2,s0,s1n,s2n);--,s00);
signal state : state_type;
--signal temp : STD_LOGIC_VECTOR ( 4 downto 0);
signal count : STD_LOGIC_VECTOR ( 5 downto 0);

begin

process(clk,rst)--,req)--,data_i0,data_i1)
begin
if (rst = '1' ) then
	wr_b <= '0';
	data_o <= "00000000000";
   state <= s00;
	count<="000000";
--elsif (req = "11") then
--	state <= s0;wr_b <= '0';count<="0000";
--elsif (req = "01") then
--	state <= s1;wr_b <= '0';count<="0000";
--elsif (req = "10") then
--	state <= s2;wr_b <= '0';count<="0000";
elsif rising_edge(clk) then
		case state is
--			when s00 =>		wr_b <='0';
--								if (req = "11") then
--									state <= s0;temp<="00001";
--								elsif (req = "01") then
--									state <= s1;temp<="00010";
--								elsif (req <= "10") then
--									state <= s2;temp<="00011";
--								else
--									state <= s00;temp<="11111";
--								end if;
			when s00 => if (req = "11") then
								state <= s0;wr_b <= '0';count<="000000";
							elsif (req = "01") then
								state <= s1;wr_b <= '0';count<="000000";
							elsif (req = "10") then
								state <= s2;wr_b <= '0';count<="000000";
							else 
								state <= s00;wr_b <= '0';count<="000000";
							end if;
								
			when s0 => 		wr_b <= '1';
								if (count0 >= count1) then
									data_o <= data_i0;
									count_o<= count0;
									state <= s1n;
								else
									data_o <= data_i1;
									count_o <= count1;
									state <= s2n;
								end if;
			when s1 => 	data_o <= data_i1;
							count_o <= count1;
							wr_b <= '1';
							state <= s3;
								
			when s2 =>	data_o <= data_i0;
							count_o <= count0;
							wr_b <= '1';
							state <= s3;
								
							
			when s2n =>	data_o <= data_i1;
							count_o <= count1;
							wr_b <= '0';
							if (count="111111") then
								state <= s2;
							else
								count <= count + 1;
								state <= s2n;
							end if;
							
			when s1n =>	data_o <= data_i0;
							count_o <= count0;
							wr_b <= '0';
							if (count="111111") then
								state <= s1;
							else
								count <= count + 1;
								state <= s1n;
							end if;
							
			when s3 =>	--data_o <= "00000000000";
							wr_b <= '0';
							state <=s00;
			
			when others => data_o <= "00000000000";
								count_o <= "0000";
								wr_b <= '0';
								
			
		end case;
	end if;

end process;
--c2 : process (count0,count1,data_i0,data_i1,req)
--begin
--if (req="11") then
--	wr_b <= '1';
--	if (count0 >= count1) then
--		data_o <= data_i0;
--	else
--		data_o <= data_i1;
--	end if;
--else
--	data_o <="00000000000";
--	wr_b <= '0';
--end if;
--end process;




end Behavioral;

