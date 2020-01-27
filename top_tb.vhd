--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:35:20 01/17/2017
-- Design Name:   
-- Module Name:   C:/Users/bill/Desktop/sorter/ask3/top_tb.vhd
-- Project Name:  ask3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
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
 
ENTITY top_tb IS
END top_tb;
 
ARCHITECTURE behavior OF top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
--			s_in : in std_logic;
         data_input : IN  std_logic_vector(7 downto 0);
         valid_i : IN  std_logic;
         wr_b : OUT  std_logic;
         s_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
--	signal s_in : std_logic := '0';
   signal data_input : std_logic_vector(7 downto 0) := (others => '0');
   signal valid_i : std_logic := '0';

 	--Outputs
   signal wr_b : std_logic;
   signal s_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          rst => rst,
          clk => clk,
--			 s_in => s_in,
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

--
--wait for clk_period*10000000;
--
--rst <= '1';
--wait for clk_period;
--rst<= '0';
--wait for clk_period*10;
--data_input<= std_logic_vector(to_unsigned(0+48,8));
--valid_i<='1';
--wait for clk_period;
--data_input<= std_logic_vector(to_unsigned(3+48,8));
--wait for clk_period;
--data_input<= std_logic_vector(to_unsigned(2+48,8));
--wait for clk_period;
--data_input<= std_logic_vector(to_unsigned(0+48,8));
--wait for clk_period;
--data_input<= std_logic_vector(to_unsigned(4+48,8));
--wait for clk_period;
--data_input<= std_logic_vector(to_unsigned(4+48,8));
--wait for clk_period;
--data_input<= std_logic_vector(to_unsigned(0+48,8));
--wait for clk_period;
--data_input<= std_logic_vector(to_unsigned(1+48,8));
--wait for clk_period;
--data_input<= std_logic_vector(to_unsigned(0+48,8));
--wait for clk_period;
--data_input<= std_logic_vector(to_unsigned(0+48,8));
--wait for clk_period;
--data_input<= std_logic_vector(to_unsigned(0+48,8));
--wait for clk_period;
--data_input<= std_logic_vector(to_unsigned(5+48,8));
--wait for clk_period;
--data_input<= std_logic_vector(to_unsigned(0+48,8));
--wait for clk_period;
--data_input<= std_logic_vector(to_unsigned(0+48,8));
--wait for clk_period;
--data_input<= std_logic_vector(to_unsigned(1+48,8));
--wait for clk_period;
--
--
--
--valid_i<='0';
--

      wait;
   end process;

END;
