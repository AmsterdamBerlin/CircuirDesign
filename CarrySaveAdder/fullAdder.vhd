----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:45:57 12/07/2016 
-- Design Name: 
-- Module Name:    fullAdder - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fullAdder is
	Port ( a_adder : in  STD_LOGIC;
			 b_adder : in  STD_LOGIC;
			 c_adder : in  STD_LOGIC;
			 s_adder : out  STD_LOGIC;
			co_adder : out  STD_LOGIC);
end fullAdder;

architecture Behavioral of fullAdder is

begin

	s_adder <= a_adder xor b_adder xor c_adder;
	co_adder <= (a_adder and b_adder) or ((a_adder xor b_adder) and c_adder);
	
end Behavioral;


