library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HalfAdder is
	Port ( a : in STD_LOGIC;
			b : in STD_LOGIC;
			s : out STD_LOGIC;
			co : out STD_LOGIC);
end HalfAdder;

architecture Behavioral of HalfAdder is

begin
		s <= a xor b;
		co <= a and b;
end Behavioral;