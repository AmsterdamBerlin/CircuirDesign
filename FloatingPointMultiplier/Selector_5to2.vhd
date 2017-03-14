library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Selector_5to2 is
Port (   c : in STD_LOGIC;
		cin0 : in STD_LOGIC;
		cin1 : in STD_LOGIC;
		sin0 : in STD_LOGIC;
		sin1 : in STD_LOGIC;
	   cout : out STD_LOGIC;
	   sout : out STD_LOGIC);
end Selector_5to2;

architecture Behavioral of Selector_5to2 is
component Selector_Basic is
		Port ( c : in  STD_LOGIC;
				s0 : in  STD_LOGIC;
				s1 : in  STD_LOGIC;
				 s : out  STD_LOGIC);
	end component;
begin
	SB1 : Selector_Basic port map (s0=>sin0, s1=>sin1, c=>c, s=>sout);
	SB2 : Selector_Basic port map (s0=>cin0, s1=>cin1, c=>c, s=>cout);

end Behavioral;

