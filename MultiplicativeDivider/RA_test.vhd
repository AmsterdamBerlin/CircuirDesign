--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:35:34 01/22/2017
-- Design Name:   
-- Module Name:   D:/Xilinx_projects/MultiplicativeDivider/RA_test.vhd
-- Project Name:  MultiplicativeDivider
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ReciprocalApproximation
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
 
ENTITY RA_test IS
END RA_test;
 
ARCHITECTURE behavior OF RA_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ReciprocalApproximation
    PORT(
         B : IN  std_logic_vector(15 downto 0);
         D : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal B : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal D : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ReciprocalApproximation PORT MAP (
          B => B,
          D => D
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		wait for 100 ns;	
		B <="0100000010000000";
		
      wait for 100 ns;	
		B <="0000000000000000";
		
      wait for 100 ns;	
		B <="0000000000001111"; 
		
		wait for 100 ns;	
		B <="0000000111000000";   
		
		wait for 100 ns;	
		B <="1100000000000100";
	
      -- insert stimulus here 

      wait;
   end process;

END;
