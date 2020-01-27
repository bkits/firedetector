--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:22:13 01/04/2017
-- Design Name:   
-- Module Name:   /home/bkits/Desktop/em_ask3/ask3/schduler_tb.vhd
-- Project Name:  ask3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: scheduler
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
 
ENTITY schduler_tb IS
END schduler_tb;
 
ARCHITECTURE behavior OF schduler_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT scheduler
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         req : IN  std_logic_vector(1 downto 0);
         count0 : IN  std_logic_vector(3 downto 0);
         count1 : IN  std_logic_vector(3 downto 0);
         data_i0 : IN  std_logic_vector(10 downto 0);
         data_i1 : IN  std_logic_vector(10 downto 0);
         wr_b : OUT  std_logic;
         data_o : OUT  std_logic_vector(10 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal req : std_logic_vector(1 downto 0) := (others => '0');
   signal count0 : std_logic_vector(3 downto 0) := (others => '0');
   signal count1 : std_logic_vector(3 downto 0) := (others => '0');
   signal data_i0 : std_logic_vector(10 downto 0) := (others => '0');
   signal data_i1 : std_logic_vector(10 downto 0) := (others => '0');

 	--Outputs
   signal wr_b : std_logic;
   signal data_o : std_logic_vector(10 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: scheduler PORT MAP (
          clk => clk,
          rst => rst,
          req => req,
          count0 => count0,
          count1 => count1,
          data_i0 => data_i0,
          data_i1 => data_i1,
          wr_b => wr_b,
          data_o => data_o
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
--
      -- insert stimulus here 
rst <= '1';req <="00";
wait for clk_period;
rst <= '0';
wait for clk_period;
rst <= '0';
data_i0 <= "00000000001";
data_i1 <= "10000000001";
req <="11";
count0 <= "0001";
count1 <= "0011";
wait for clk_period;
req <="00";
wait for clk_period*20;
data_i0 <= "00000000011";
data_i1 <= "10000000001";
req <="10";
count0 <= "0001";
count1 <= "0011";
wait for clk_period;
req <="00";
      wait;
   end process;

END;
