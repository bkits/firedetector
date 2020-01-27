----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:36:13 12/21/2016 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

entity top_prev is
port(
--s_in : in std_logic;
--read_b  : in std_logic;
rst : in std_logic;
clk : in std_logic;
		data_input : in std_logic_vector (7 downto 0);
		valid_i  : in std_logic;
--		bound2 : in std_logic_vector (7 downto 0);
--		time1 : in std_logic_vector (7 downto 0);
--		time2 : in std_logic_vector (7 downto 0);
--		time3 : in std_logic_vector (7 downto 0);
		wr_b : out std_logic;
s_out : out std_logic_vector (7 downto 0)
			);
end top_prev;

architecture Behavioral of top_prev is

component EES
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
end component;

component memory
    Port(rst     : in std_logic;
        next_val : in std_logic;
        mem_out  : out std_logic_vector(7 downto 0));
end component;

component memory1
    Port(rst     : in std_logic;
        next_val : in std_logic;
        mem_out  : out std_logic_vector(7 downto 0));
end component;

component req_to_pulse
port (
		req : in std_logic;
		clk : in std_logic;
		pulse :out std_logic
		);
end component;

component timest
port( clk : in std_logic;
		rst: in std_logic;
		time_out : out std_logic_vector( 3 downto 0)
	  );
end component;

component scheduler
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
end component;

component clk_div
    Port ( clk_50M : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk_1 : out  STD_LOGIC);
end component;

component binary_to_decimal
port(inbcd : in std_logic_vector(13 downto 0);
		 outbcd : out std_logic_vector(17 downto 0));
end component;

component data_to_ascii
port (
		clk : in STD_LOGIC;
		en : in STD_LOGIC;
		rst : in STD_LOGIC;
		data_in : in STD_LOGIC_VECTOR ( 14 downto 0);
		timestamp : in STD_LOGIC_VECTOR ( 7 downto 0);
		wr_e : out STD_LOGIC;
		data_out : out STD_LOGIC_VECTOR ( 7 downto 0)
		);
end component;

component init
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
end component;

component ascii2bin
Generic(DATAIN  : integer :=8;
			  DATAOUT : integer :=8;
	        MAXDIGIT: integer :=4;  -- Max support do not change
	        MAXWIDTH: integer :=16; -- Max support do not change
	        DIGIT   : integer :=3);
port (
			  data_in   : in  STD_LOGIC_VECTOR (DATAIN-1 downto 0);
           valid_in  : in  STD_LOGIC;
           clk       : in  STD_LOGIC;
           rst_n     : in  STD_LOGIC;
           data_out  : out STD_LOGIC_VECTOR (DATAOUT-1 downto 0);
           valid_out : out STD_LOGIC
		);
end component;

signal bound1,bound2,time1,time2,time3 : std_logic_vector(7 downto 0);
signal datab,datat0,datat1,in_fifo,data_bin_to_init,data_bin_to_init_reg,dta2 : std_logic_vector(7 downto 0);
signal enn,bf1,bf2,bhf1,bhf2,b_read_reg,wr_fifo,en_out : std_logic;
signal baud_count : integer range 0 to 330 :=0;
signal en_16_x_baud,req,r0,r1,req0,req1,req0d,req1d,clk_d,en_ees,valid_bin,ff,ff1 : std_logic;
signal ees0,ees1 : std_logic_vector (9 downto 0);
signal sch_0,sch_1 : std_logic_vector (10 downto 0);
signal rr : std_logic_vector (1 downto 0);
signal count0,count1,counto : std_logic_vector (3 downto 0);
signal sch_out : std_logic_vector (10 downto 0);
signal dec_out,dec_out2 : std_logic_vector (17 downto 0);
signal dta : std_logic_vector (14 downto 0);
signal btd,btd2 : std_logic_vector (13 downto 0);
signal ttt : std_logic_vector (7 downto 0);
 

begin

--C00: uart_rx port map (s_in,data_input,enn,rst,en_16_x_baud,enn,bf1,bhf1,clk);
--C13: uart_tx port map (in_fifo,wr_fifo,rst,en_16_x_baud,s_out,bf2,bhf2,clk);

--baud_timer: process(clk)
--  begin
--    if clk'event and clk='1' then
--      if baud_count=325 then
--           baud_count <= 0;
--         en_16_x_baud <= '1';
--       else
--           baud_count <= baud_count + 1;
--         en_16_x_baud <= '0';
--      end if;
--    end if;
--  end process baud_timer;

C01 : ascii2bin
   Generic map(DATAIN  => 8,
			      DATAOUT => 8,
				   MAXDIGIT=> 4,
				   MAXWIDTH=> 16,
				   DIGIT   => 3)
      Port map(data_in   => data_input,
				   valid_in  => valid_i,
				   clk       => clk,
				   rst_n     => rst,
				   data_out  => data_bin_to_init,
				   valid_out => valid_bin);


C02 : init port map (clk,rst,valid_bin,data_bin_to_init_reg,bound1,bound2,time1,time2,time3,en_ees);


--process (rst)
--begin
--if rst = '0' then
--	ff<='1';
--elsif rising_edge(rst) then
--		ff<='0';
--end if;
--end process;

--ff1 <= en_ees and ff;

C1 : EES port map (datat0,clk_d,en_ees,rst,bound1,bound2,time1,time2,time3,ees0,req0);
C2 : memory port map (rst,req0,datat0);

C3 : EES port map (datat1,clk_d,en_ees,rst,bound1,bound2,time1,time2,time3,ees1,req1);
C4 : memory1 port map (rst,req1,datat1);

C5 : req_to_pulse port map (req0d,clk,r0);
C6 : req_to_pulse port map (req1d,clk,r1);

rr <= r0 & r1;

C7 :	timest port map (r0,rst,count0);
C8 :	timest port map (r1,rst,count1);

sch_0 <= '0'&ees0;
sch_1 <= '1'&ees1;

C9 : scheduler port map (clk,rst,rr,count0,count1,sch_0,sch_1,en_out,sch_out,counto);

C10 : clk_div port map (clk,rst,clk_d);

btd <= "000000" & sch_out(7 downto 0);
btd2 <= "0000000000" & counto;

C11 : binary_to_decimal port map (btd,dec_out);
C11a : binary_to_decimal port map (btd2,dec_out2);

dta <= sch_out(10 downto 8) & dec_out(11 downto 0);
dta2 <= dec_out2(7 downto 0);

C12 : data_to_ascii port map(clk,en_out,rst,dta,dta2,wr_fifo,in_fifo);

s_out <= in_fifo;
wr_b <= wr_fifo;

req_reg: process(clk_d)
begin
if rising_edge(clk_d) then
	req0d <= req0;
	req1d <= req1;
end if;
end process;

process(clk)
begin
if rising_edge(clk) then
if valid_bin='1' then
data_bin_to_init_reg <= data_bin_to_init;
end if;
end if;
end process;

--process(clk)
--begin
--if rising_edge(clk) then
--if wr_fifo='1' then
--in_fifo_r <= in_fifo;
--end if;
--end if;
--end process;


end Behavioral;

