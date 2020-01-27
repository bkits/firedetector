--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:16:36 01/09/2017
-- Design Name:   
-- Module Name:   /home/bkits/Desktop/em_ask3/ask3/data_to_ascii_tb.vhd
-- Project Name:  ask3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: data_to_ascii
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
 
ENTITY data_to_ascii_tb IS
END data_to_ascii_tb;
 
ARCHITECTURE behavior OF data_to_ascii_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT data_to_ascii
    PORT(
         clk : IN  std_logic;
         en : IN  std_logic;
         data_in : IN  std_logic_vector(14 downto 0);
			wr_e : out STD_LOGIC;
         data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal en : std_logic := '0';
   signal data_in : std_logic_vector(14 downto 0) := (others => '0');

 	--Outputs
	signal wr_e : std_logic := '0';
   signal data_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: data_to_ascii PORT MAP (
          clk => clk,
          en => en,
          data_in => data_in,
			 wr_e => wr_e,
          data_out => data_out
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

en <= '0';
data_in <= "110000000100100";
wait for clk_period;
en <= '1';
wait for clk_period;
en <= '0';
wait for clk_period*6;
en <= '1';
data_in <= "110000010100101";
wait for clk_period*2;
en <= '0';
wait for clk_period*6;

      -- insert stimulus here 

      wait;
   end process;

END;
