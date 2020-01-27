-------------------------------------------------------------------------
-- Module name: ascii2bin - Behavioral                                 --
--                                                                     --
-- File name: ascii2bin.vhd                                            --
--                                                                     --
-- Purpose: Convert the ascii input to binary using DIGIT amout of     --
--          input digits.                                              --
-------------------------------------------------------------------------
-- Author: Ioannis Stamoulias                                          --
-- email: jstamoulias@gmail.com                                        --
-------------------------------------------------------------------------
-- Copyright (c) 2017                                                  --
-------------------------------------------------------------------------
-- Revisions:                                                          --
-- Date          Version    Author          Description                --
-- 2017          1.0        jstamoulias     Created                    --
-------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ascii2bin is
   Generic(DATAIN  : integer :=8;
			  DATAOUT : integer :=8;
	        MAXDIGIT: integer :=4;  -- Max support do not change
	        MAXWIDTH: integer :=16; -- Max support do not change
	        DIGIT   : integer :=3);
      Port(data_in   : in  STD_LOGIC_VECTOR (DATAIN-1 downto 0);
           valid_in  : in  STD_LOGIC;
           clk       : in  STD_LOGIC;
           rst_n     : in  STD_LOGIC;
           data_out  : out STD_LOGIC_VECTOR (DATAOUT-1 downto 0);
           valid_out : out STD_LOGIC);
end ascii2bin;

architecture Behavioral of ascii2bin is 
type decode_digit is array (0 to 9) of STD_LOGIC_VECTOR (MAXWIDTH-1 downto 0);
type decode_rom is array (0 to MAXDIGIT-1) of decode_digit;
signal decode_data  : decode_rom :=(others => (others => (others => '0')));
signal ascii_offset : std_logic_vector(DATAIN-1 downto 0):=(others=>'0'); 
signal data_tmp     : std_logic_vector(DATAIN-1 downto 0):=(others=>'0');
signal valid_tmp    : std_logic:='0'; 
signal bin_tmp      : std_logic_vector(DATAOUT-1 downto 0):=(others=>'0');
signal cnt          : integer range 0 to MAXDIGIT-1;
begin

DECODER:for i in 0 to MAXDIGIT-1 generate
	DECODE_D:for j in 0 to 9 generate
		decode_data(i)(j) <= std_logic_vector(to_unsigned(j*(10**i),MAXWIDTH));
	end generate DECODE_D;
end generate DECODER;

ascii_offset <= std_logic_vector(to_unsigned(48,DATAIN));

process(clk,rst_n)
begin
	if(rst_n='1')then
		data_tmp  <= (others=>'0');
		valid_tmp <= '0';
		cnt       <= 0;
		data_out  <= (others=>'0');
		valid_out <= '0';
	elsif rising_edge(clk)then
		if(valid_in='1' and (conv_integer('0'&data_in)>=48 and conv_integer('0'&data_in)<=57))then
			data_tmp  <= data_in - ascii_offset;
			valid_tmp <= '1';
--		elsif(valid_in='1' and conv_integer('0'&data_in)=15)then
--			data_tmp  <= data_in;
--			valid_tmp <= '1';
		else
			data_tmp  <= (others=>'0');
			valid_tmp <= '0';
		end if;
		if(valid_tmp='1')then
			if(cnt=(DIGIT-1))then
				data_out <= bin_tmp + decode_data((DIGIT-1)-cnt)(conv_integer('0'&data_tmp))(DATAOUT-1 downto 0);
				valid_out<= '1';
				bin_tmp  <= (others=>'0');
				cnt      <= 0;
			else
				data_out <= (others=>'0');
				valid_out<= '0';
				bin_tmp  <= bin_tmp + decode_data((DIGIT-1)-cnt)(conv_integer('0'&data_tmp))(DATAOUT-1 downto 0);
				cnt      <= cnt + 1;
			end if;
--			if(conv_integer('0'&data_tmp)=15)then
--				data_out <= bin_tmp;
--				valid_out<= '1';
--				bin_tmp  <= (others=>'0');
--				cnt      <= 0;
--			else
--				data_out <= (others=>'0');
--				valid_out<= '0';
--				bin_tmp  <= bin_tmp + decode_data((DIGIT-1)-cnt)(conv_integer('0'&data_tmp))(DATAOUT-1 downto 0);
--				cnt      <= cnt + 1;
--			end if;
		else
			data_out <= (others=>'0');
			valid_out<= '0';
		end if;
	end if;
end process;

end Behavioral;
