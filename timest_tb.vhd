--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:33:25 01/11/2017
-- Design Name:   
-- Module Name:   C:/Users/bill/Desktop/sorter/ask3/timest_tb.vhd
-- Project Name:  ask3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: timest
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
 
ENTITY timest_tb IS
END timest_tb;
 
ARCHITECTURE behavior OF timest_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT timest
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         time_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal time_out : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: timest PORT MAP (
          clk => clk,
          rst => rst,
          time_out => time_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period*10;
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
wait for clk_period*10;
rst <= '0';
      wait;
   end process;

END;
