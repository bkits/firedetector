--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:20:04 01/11/2017
-- Design Name:   
-- Module Name:   C:/Users/bill/Desktop/sorter/ask3/EES_tb.vhd
-- Project Name:  ask3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: EES
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
 
ENTITY EES_tb IS
END EES_tb;
 
ARCHITECTURE behavior OF EES_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT EES
    PORT(
         val_in : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic;
         bound1 : IN  std_logic_vector(7 downto 0);
         bound2 : IN  std_logic_vector(7 downto 0);
         time1 : IN  std_logic_vector(7 downto 0);
         time2 : IN  std_logic_vector(7 downto 0);
         time3 : IN  std_logic_vector(7 downto 0);
         data_out : OUT  std_logic_vector(9 downto 0);
         req_val : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal val_in : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal bound1 : std_logic_vector(7 downto 0) := (others => '0');
   signal bound2 : std_logic_vector(7 downto 0) := (others => '0');
   signal time1 : std_logic_vector(7 downto 0) := (others => '0');
   signal time2 : std_logic_vector(7 downto 0) := (others => '0');
   signal time3 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(9 downto 0);
   signal req_val : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: EES PORT MAP (
          val_in => val_in,
          clk => clk,
          rst => rst,
          bound1 => bound1,
          bound2 => bound2,
          time1 => time1,
          time2 => time2,
          time3 => time3,
          data_out => data_out,
          req_val => req_val
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
		wait for clk_period*50;
rst <= '1';
bound1<= "00011110";
bound2<= "00101000";
time1<=  "00000101";
time2<=  "00000010";
time3<=  "00000001";
wait for clk_period*5;
rst <='0';
val_in <= "00001110";
wait for clk_period*10;
val_in <= "00011111";
wait for clk_period*4;
val_in <= "00101111";
wait for clk_period*2;
val_in <= "00111111";
		

      wait;
   end process;

END;
