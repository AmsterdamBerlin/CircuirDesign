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

component FullAdder is
Port ( a : in  STD_LOGIC;
	b : in  STD_LOGIC;
	c : in  STD_LOGIC;
	s : out  STD_LOGIC;
	co : out  STD_LOGIC);
end component;

signal s_temp: STD_LOGIC;

begin

	fa1 : FullAdder port map (a => b_counter, b => c_counter, c => a_counter, s => s_temp, co => tout_counter );
	fa2 : FullAdder port map (a => s_temp, b => d_counter, c => tin_counter, s => s_counter, co => co_counter);

end Behavioral;

