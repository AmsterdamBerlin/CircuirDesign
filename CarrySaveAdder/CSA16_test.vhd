--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:18:41 12/07/2016
-- Design Name:   
-- Module Name:   D:/Xilinx_projects/MovingAverageFilter/CSA16_test.vhd
-- Project Name:  MovingAverageFilter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CSA_16input
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
 
ENTITY CSA16_test IS
END CSA16_test;
 
ARCHITECTURE behavior OF CSA16_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CSA_16input
    PORT(
         X1 : IN  std_logic_vector(10 downto 0);
         X2 : IN  std_logic_vector(10 downto 0);
         X3 : IN  std_logic_vector(10 downto 0);
         X4 : IN  std_logic_vector(10 downto 0);
         X5 : IN  std_logic_vector(10 downto 0);
         X6 : IN  std_logic_vector(10 downto 0);
         X7 : IN  std_logic_vector(10 downto 0);
         X8 : IN  std_logic_vector(10 downto 0);
         X9 : IN  std_logic_vector(10 downto 0);
         X10 : IN  std_logic_vector(10 downto 0);
         X11 : IN  std_logic_vector(10 downto 0);
         X12 : IN  std_logic_vector(10 downto 0);
         X13 : IN  std_logic_vector(10 downto 0);
         X14 : IN  std_logic_vector(10 downto 0);
         X15 : IN  std_logic_vector(10 downto 0);
         X16 : IN  std_logic_vector(10 downto 0);
         S : OUT  std_logic_vector(14 downto 0));
    END COMPONENT;
    

   --Inputs
   signal X1 : std_logic_vector(10 downto 0) := (others => '0');
   signal X2 : std_logic_vector(10 downto 0) := (others => '0');
   signal X3 : std_logic_vector(10 downto 0) := (others => '0');
   signal X4 : std_logic_vector(10 downto 0) := (others => '0');
   signal X5 : std_logic_vector(10 downto 0) := (others => '0');
   signal X6 : std_logic_vector(10 downto 0) := (others => '0');
   signal X7 : std_logic_vector(10 downto 0) := (others => '0');
   signal X8 : std_logic_vector(10 downto 0) := (others => '0');
   signal X9 : std_logic_vector(10 downto 0) := (others => '0');
   signal X10 : std_logic_vector(10 downto 0) := (others => '0');
   signal X11 : std_logic_vector(10 downto 0) := (others => '0');
   signal X12 : std_logic_vector(10 downto 0) := (others => '0');
   signal X13 : std_logic_vector(10 downto 0) := (others => '0');
   signal X14 : std_logic_vector(10 downto 0) := (others => '0');
   signal X15 : std_logic_vector(10 downto 0) := (others => '0');
   signal X16 : std_logic_vector(10 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_vector(14 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CSA_16input PORT MAP (
          X1 => X1,
          X2 => X2,
          X3 => X3,
          X4 => X4,
          X5 => X5,
          X6 => X6,
          X7 => X7,
          X8 => X8,
          X9 => X9,
          X10 => X10,
          X11 => X11,
          X12 => X12,
          X13 => X13,
          X14 => X14,
          X15 => X15,
          X16 => X16,
          S => S);

   -- Clock process definitions
   stim_proc :process
		begin
		wait for 100 ns;
		X1 <="00000000000";
		X2 <="00000000001"; 
		X3 <="00000000010";
		X4 <="00000000100";
		X5 <="00000001000";
		X6 <="00000010000"; 
		X7 <="00000100000";
		X8 <="00001000000";
		X9 <="00010000000";
	  X10 <="00100000000"; 
	  X11 <="01000000000";
	  X12 <="10000000000";
	  X13 <="00000000000";
	  X14 <="00000000000"; 
	  X15 <="00000000000";
	  X16 <="00000000000";
		wait for 100 ns;
		X1 <="11111111111";
		X2 <="11111111111"; 
		X3 <="11111111111";
		X4 <="11111111111";
		X5 <="11111111111";
		X6 <="11111111111"; 
		X7 <="11111111111";
		X8 <="11111111111";
		X9 <="11111111111";
	  X10 <="11111111111"; 
	  X11 <="11111111111";
	  X12 <="11111111111";
	  X13 <="11111111111";
	  X14 <="11111111111"; 
	  X15 <="11111111111";
	  X16 <="11111111111";
		wait for 100 ns;
		X1 <="00000001111";
		X2 <="00000001111"; 
		X3 <="00000001111";
		X4 <="00000001111";
		X5 <="00000001111";
		X6 <="00000001111"; 
		X7 <="00000001111";
		X8 <="00000001111";
		X9 <="00000001111";
	  X10 <="00000001111"; 
	  X11 <="00000001111";
	  X12 <="00000001111";
	  X13 <="00000001111";
	  X14 <="00000001111"; 
	  X15 <="00000001111";
	  X16 <="00000001111";
		wait for 100 ns;
		X1 <="11110000000";
		X2 <="11110000000"; 
		X3 <="11110000000";
		X4 <="11110000000";
		X5 <="11110000000";
		X6 <="11110000000"; 
		X7 <="11110000000";
		X8 <="11110000000";
		X9 <="11110000000";
	  X10 <="11110000000"; 
	  X11 <="11110000000";
	  X12 <="11110000000";
	  X13 <="11110000000";
	  X14 <="11110000000"; 
	  X15 <="11110000000";
	  X16 <="11110000000";
		wait;
   end process;
 


END;
