--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:22:17 11/09/2016
-- Design Name:   
-- Module Name:   C:/Users/bill/Desktop/sorter/ask2/binary_to_decimal_tb.vhd
-- Project Name:  ask2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: binary_to_decimal
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
 
ENTITY binary_to_decimal_tb IS
END binary_to_decimal_tb;
 
ARCHITECTURE behavior OF binary_to_decimal_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT binary_to_decimal
    PORT(
         inbcd : IN  std_logic_vector(13 downto 0);
         outbcd : OUT  std_logic_vector(17 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal inbcd : std_logic_vector(13 downto 0) := (others => '0');

 	--Outputs
   signal outbcd : std_logic_vector(17 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: binary_to_decimal PORT MAP (
          inbcd => inbcd,
          outbcd => outbcd
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.

      -- insert stimulus here 

inbcd <= "00000000001111";


      wait;
   end process;

END;
