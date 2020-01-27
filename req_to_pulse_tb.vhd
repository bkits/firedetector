--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:27:15 01/11/2017
-- Design Name:   
-- Module Name:   C:/Users/bill/Desktop/sorter/ask3/req_to_pulse_tb.vhd
-- Project Name:  ask3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: req_to_pulse
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
 
ENTITY req_to_pulse_tb IS
END req_to_pulse_tb;
 
ARCHITECTURE behavior OF req_to_pulse_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT req_to_pulse
    PORT(
         req : IN  std_logic;
         clk : IN  std_logic;
         pulse : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal req : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal pulse : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: req_to_pulse PORT MAP (
          req => req,
          clk => clk,
          pulse => pulse
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;
 
 req_process :process
   begin
		req <= '0';
		wait for 0.5 ms;
		req <= '1';
		wait for 0.5 ms;
		req <= '0';
		wait for 0.5 ms;
		req <= '1';
		wait for 0.5 ms;
		req <= '0';
		wait for 5 ms;
		
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
