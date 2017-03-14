library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ResultGeneration is
	Port ( a : in STD_LOGIC;
			b : in STD_LOGIC;
			c0 : out STD_LOGIC;
			c1 : out STD_LOGIC;
			s0 : out STD_LOGIC;
			s1 : out STD_LOGIC);
end ResultGeneration;

architecture Behavioral of ResultGeneration is

begin
		s0 <= a xor b ;
		s1 <= a xnor b;
		c0 <= a and b;
		c1 <= a or b;
end Behavioral;