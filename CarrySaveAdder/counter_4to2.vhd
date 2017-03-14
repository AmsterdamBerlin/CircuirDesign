----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:39:17 12/07/2016 
-- Design Name: 
-- Module Name:    counter_4to2 - Behavioral 
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

entity counter_4to2 is
	Port ( a_counter : in STD_LOGIC;
			 b_counter : in STD_LOGIC;
			 c_counter : in STD_LOGIC;
			 d_counter : in STD_LOGIC;
		  tin_counter : in STD_LOGIC;
		 tout_counter : out STD_LOGIC;
			 s_counter : out STD_LOGIC;
			co_counter : out STD_LOGIC);
end counter_4to2;

architecture Behavioral of counter_4to2 is

component fullAdder is
	Port ( a_adder : in  STD_LOGIC;
			 b_adder : in  STD_LOGIC;
			 c_adder : in  STD_LOGIC;
			 s_adder : out  STD_LOGIC;
			co_adder : out  STD_LOGIC);
end component;

signal s_temp: STD_LOGIC;

begin

	fa1 : fullAdder port map (a_adder => b_counter, b_adder => c_counter, c_adder => a_counter, s_adder => s_temp, co_adder => tout_counter );
	fa2 : fullAdder port map (a_adder => s_temp, b_adder => d_counter, c_adder => tin_counter, s_adder => s_counter, co_adder => co_counter);

end Behavioral;

