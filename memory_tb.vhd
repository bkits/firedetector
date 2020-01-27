--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:11:25 11/07/2016
-- Design Name:   
-- Module Name:   /home/bkits/Desktop/em_askisi_2/memory_tb.vhd
-- Project Name:  em_askisi_2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: memory
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
 
ENTITY memory_tb IS
END memory_tb;
 
ARCHITECTURE behavior OF memory_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memory
    PORT(
         rst : IN  std_logic;
         next_val : IN  std_logic;
         mem_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal next_val : std_logic := '0';

 	--Outputs
   signal mem_out : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant next_val_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memory PORT MAP (
          rst => rst,
          next_val => next_val,
          mem_out => mem_out
        );

   -- Clock process definitions
   next_val_process :process
   begin
		next_val <= '1';
		wait for next_val_period/2;
		next_val <= '0';
		wait for next_val_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for <clock>_period*10;

rst<='1';
wait for next_val_period;
rst<='0';
wait for next_val_period*100;
      -- insert stimulus here 

      wait;
   end process;

END;
