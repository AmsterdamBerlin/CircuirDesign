--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:52:04 12/07/2016
-- Design Name:   
-- Module Name:   D:/Xilinx_projects/MovingAverageFilter/register_test.vhd
-- Project Name:  MovingAverageFilter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RegisterArray
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY register_test IS
END register_test;
 
ARCHITECTURE behavior OF register_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisterArray
    PORT(
         inputSample : IN  std_logic_vector(10 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic;
         regX1 : OUT  std_logic_vector(10 downto 0);
         regX2 : OUT  std_logic_vector(10 downto 0);
         regX3 : OUT  std_logic_vector(10 downto 0);
         regX4 : OUT  std_logic_vector(10 downto 0);
         regX5 : OUT  std_logic_vector(10 downto 0);
         regX6 : OUT  std_logic_vector(10 downto 0);
         regX7 : OUT  std_logic_vector(10 downto 0);
         regX8 : OUT  std_logic_vector(10 downto 0);
         regX9 : OUT  std_logic_vector(10 downto 0);
         regX10 : OUT  std_logic_vector(10 downto 0);
         regX11 : OUT  std_logic_vector(10 downto 0);
         regX12 : OUT  std_logic_vector(10 downto 0);
         regX13 : OUT  std_logic_vector(10 downto 0);
         regX14 : OUT  std_logic_vector(10 downto 0);
         regX15 : OUT  std_logic_vector(10 downto 0);
         regX16 : OUT  std_logic_vector(10 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal inputSample : std_logic_vector(10 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '1';

 	--Outputs
   signal regX1 : std_logic_vector(10 downto 0);
   signal regX2 : std_logic_vector(10 downto 0);
   signal regX3 : std_logic_vector(10 downto 0);
   signal regX4 : std_logic_vector(10 downto 0);
   signal regX5 : std_logic_vector(10 downto 0);
   signal regX6 : std_logic_vector(10 downto 0);
   signal regX7 : std_logic_vector(10 downto 0);
   signal regX8 : std_logic_vector(10 downto 0);
   signal regX9 : std_logic_vector(10 downto 0);
   signal regX10 : std_logic_vector(10 downto 0);
   signal regX11 : std_logic_vector(10 downto 0);
   signal regX12 : std_logic_vector(10 downto 0);
   signal regX13 : std_logic_vector(10 downto 0);
   signal regX14 : std_logic_vector(10 downto 0);
   signal regX15 : std_logic_vector(10 downto 0);
   signal regX16 : std_logic_vector(10 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;

	
BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterArray PORT MAP (
          inputSample => inputSample,
          clk => clk,
          rst => rst,
          regX1 => regX1,
          regX2 => regX2,
          regX3 => regX3,
          regX4 => regX4,
          regX5 => regX5,
          regX6 => regX6,
          regX7 => regX7,
          regX8 => regX8,
          regX9 => regX9,
          regX10 => regX10,
          regX11 => regX11,
          regX12 => regX12,
          regX13 => regX13,
          regX14 => regX14,
          regX15 => regX15,
          regX16 => regX16
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rst <= '0';
      wait for clk_period;
		inputSample <= "00000000001";
		wait for clk_period;
		inputSample <= "00000000010";
		wait for clk_period;
		inputSample <= "00000000100";
		wait for clk_period;
		inputSample <= "00000001000";
		wait for clk_period;
		inputSample <= "00000010000";
		wait for clk_period;
		inputSample <= "00000100000";
		wait for clk_period;
		inputSample <= "00001000000";
		wait for clk_period;
		inputSample <= "00010000000";
		wait for clk_period;
		inputSample <= "00100000000";
		wait for clk_period;
		inputSample <= "01000000000";
		wait for clk_period;
		inputSample <= "10000000000";
		wait for clk_period;
		inputSample <= "00000000011";
		wait for clk_period;
		inputSample <= "00000000111";
		wait for clk_period;
		inputSample <= "00000001111";
		wait for clk_period;
		inputSample <= "00000011111";
		wait for clk_period;
		inputSample <= "00000111111";
		wait for clk_period;
		inputSample <= "00001111111";
		wait for clk_period;
		inputSample <= "00011111111";

   end process;

END;
