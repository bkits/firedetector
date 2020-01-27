--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:06:11 02/04/2017
-- Design Name:   
-- Module Name:   C:/Users/bill/Desktop/sorter/ask3nu/top_prev_tb.vhd
-- Project Name:  ask3nu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_prev
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
USE ieee.numeric_std.ALL;
 
ENTITY top_prev_tb IS
END top_prev_tb;
 
ARCHITECTURE behavior OF top_prev_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_prev
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         data_input : IN  std_logic_vector(7 downto 0);
         valid_i : IN  std_logic;
         wr_b : OUT  std_logic;
         s_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal data_input : std_logic_vector(7 downto 0) := (others => '0');
   signal valid_i : std_logic := '0';

 	--Outputs
   signal wr_b : std_logic;
   signal s_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_prev PORT MAP (
          rst => rst,
          clk => clk,
          data_input => data_input,
          valid_i => valid_i,
          wr_b => wr_b,
          s_out => s_out
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
     wait for clk_period*10;


rst <= '1';
wait for clk_period;
rst<= '0';
wait for clk_period*10;
data_input<= std_logic_vector(to_unsigned(0+48,8));
valid_i<='1';
wait for clk_period;
valid_i<='0';
wait for clk_period*2;
valid_i<='1';
data_input<= std_logic_vector(to_unsigned(3+48,8));
wait for clk_period;
valid_i<='0';
wait for clk_period*2;
valid_i<='1';
data_input<= std_logic_vector(to_unsigned(0+48,8));
wait for clk_period;
valid_i<='0';
wait for clk_period*2;
valid_i<='1';
data_input<= std_logic_vector(to_unsigned(0+48,8));
wait for clk_period;
valid_i<='0';
wait for clk_period*2;
valid_i<='1';
data_input<= std_logic_vector(to_unsigned(4+48,8));
wait for clk_period;
valid_i<='0';
wait for clk_period*2;
valid_i<='1';
data_input<= std_logic_vector(to_unsigned(0+48,8));
wait for clk_period;
valid_i<='0';
wait for clk_period*2;
valid_i<='1';
data_input<= std_logic_vector(to_unsigned(0+48,8));
wait for clk_period;
valid_i<='0';
wait for clk_period*2;
valid_i<='1';
data_input<= std_logic_vector(to_unsigned(2+48,8));
wait for clk_period;
valid_i<='0';
wait for clk_period*2;
valid_i<='1';
data_input<= std_logic_vector(to_unsigned(0+48,8));
wait for clk_period;
valid_i<='0';
wait for clk_period*2;
valid_i<='1';
data_input<= std_logic_vector(to_unsigned(0+48,8));
wait for clk_period;
valid_i<='0';
wait for clk_period*2;
valid_i<='1';
data_input<= std_logic_vector(to_unsigned(1+48,8));
wait for clk_period;
valid_i<='0';
wait for clk_period*2;
valid_i<='1';
data_input<= std_logic_vector(to_unsigned(0+48,8));
wait for clk_period;
valid_i<='0';
wait for clk_period*2;
valid_i<='1';
data_input<= std_logic_vector(to_unsigned(0+48,8));
wait for clk_period;
valid_i<='0';
wait for clk_period*2;
valid_i<='1';
data_input<= std_logic_vector(to_unsigned(0+48,8));
wait for clk_period;
valid_i<='0';
wait for clk_period*2;
valid_i<='1';
data_input<= std_logic_vector(to_unsigned(5+48,8));
wait for clk_period;
valid_i<='0';
wait for clk_period*2;
valid_i<='1';



valid_i<='0';


      wait;
   end process;

END;
