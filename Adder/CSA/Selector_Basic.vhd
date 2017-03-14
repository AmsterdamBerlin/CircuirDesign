library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Selector_Basic is
	Port ( c : in STD_LOGIC;
			s0 : in STD_LOGIC;
			s1 : in STD_LOGIC;	
			s : out STD_LOGIC);
end Selector_Basic;

architecture Behavioral of Selector_Basic is

begin
		s <= ((not c)and(not s1) and s0) or (( not c)and s1 and s0) or (c and s1 and (not s0)) or (c and s1 and s0);
end Behavioral;