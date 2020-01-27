--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:01:15 01/17/2017
-- Design Name:   
-- Module Name:   C:/Users/bill/Desktop/sorter/ask3/init_tb.vhd
-- Project Name:  ask3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: init
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY init_tb IS
END init_tb;
 
ARCHITECTURE behavior OF init_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT init
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         val : IN  std_logic;
         data_in : IN  std_logic_vector(7 downto 0);
         o_0 : OUT  std_logic_vector(7 downto 0);
         o_1 : OUT  std_logic_vector(7 downto 0);
         o_2 : OUT  std_logic_vector(7 downto 0);
         o_3 : OUT  std_logic_vector(7 downto 0);
         o_4 : OUT  std_logic_vector(7 downto 0);
         en_ees : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal val : std_logic := '0';
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal o_0 : std_logic_vector(7 downto 0);
   signal o_1 : std_logic_vector(7 downto 0);
   signal o_2 : std_logic_vector(7 downto 0);
   signal o_3 : std_logic_vector(7 downto 0);
   signal o_4 : std_logic_vector(7 downto 0);
   signal en_ees : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: init PORT MAP (
          clk => clk,
          rst => rst,
          val => val,
          data_in => data_in,
          o_0 => o_0,
          o_1 => o_1,
          o_2 => o_2,
          o_3 => o_3,
          o_4 => o_4,
          en_ees => en_ees
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for clk_period*10;

      -- insert stimulus here 
rst <= '1';
wait for clk_period;
rst<= '0';
data_in<= "00000001";
val<='1';
wait for clk_period;
val<='0';
wait for clk_period*2;
data_in<= "00000010";
val<='1';
wait for clk_period;
val<='0';
wait for clk_period*2;
data_in<= "00000011";
val<='1';
wait for clk_period;
val<='0';
wait for clk_period*2;
data_in<= "00000100";
val<='1';
wait for clk_period;
val<='0';
wait for clk_period*2;
data_in<= "00000101";
val<='1';
wait for clk_period;
val<='0';
wait for clk_period*2;

      wait;
   end process;

END;
