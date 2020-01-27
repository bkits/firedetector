-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;
  use IEEE.STD_LOGIC_UNSIGNED.ALL;


  ENTITY ascii2bin_tb IS
  END ascii2bin_tb;

  ARCHITECTURE behavior OF ascii2bin_tb IS 

  -- Component Declaration
          COMPONENT ascii2bin
Port(		data_in   : in  STD_LOGIC_VECTOR (7 downto 0);
           valid_in  : in  STD_LOGIC;
           clk       : in  STD_LOGIC;
           rst_n     : in  STD_LOGIC;
           data_out  : out STD_LOGIC_VECTOR (7 downto 0);
           valid_out : out STD_LOGIC);
          END COMPONENT;

          
          SIGNAL data_in :  std_logic_vector(7 downto 0);
          SIGNAL valid_in :  std_logic;
			 SIGNAL clk :  std_logic;
			 SIGNAL rst_n : std_logic;
			 SIGNAL data_out : std_logic_vector(7 downto 0);
			 SIGNAL valid_out : std_logic;
			 
			 constant clk_period : time := 20 ns;

  BEGIN

  -- Component Instantiation
          uut: ascii2bin PORT MAP(
                  data_in => data_in,
                  valid_in => valid_in,
						clk=>clk,
						rst_n=>rst_n,
						data_out=>data_out,
						valid_out=>valid_out
          );


   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;
 

  --  Test Bench Statements
     tb : PROCESS
     BEGIN

--        wait for 100 ns; -- wait until global set/reset completes

        -- Add user defined stimulus here
rst_n<='0';
data_in<="00001111"+48;
valid_in<='0';
wait for clk_period*5;
rst_n<='1';
valid_in<='1';
data_in<="00000000"+48;
wait for clk_period;
data_in<="00000001"+48;
wait for clk_period;
data_in<="00000010"+48;
wait for clk_period;
valid_in<='0';

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
