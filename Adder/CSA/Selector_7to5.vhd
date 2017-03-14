library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Selector_7to5 is
Port (   c : in STD_LOGIC;
		cin0 : in STD_LOGIC;
		cin1 : in STD_LOGIC;
	 sin0_2 : in STD_LOGIC;
	 sin1_2 : in STD_LOGIC;
	 sin0_3 : in STD_LOGIC;
	 sin1_3 : in STD_LOGIC;
	   cout : out STD_LOGIC;
	 sout_2 : out STD_LOGIC;
	 sout_3 : out STD_LOGIC);
end Selector_7to5;

architecture Behavioral of Selector_7to5 is
component Selector_Basic is
		Port ( c : in  STD_LOGIC;
				s0 : in  STD_LOGIC;
				s1 : in  STD_LOGIC;
				 s : out  STD_LOGIC);
	end component;
begin
	SB1 : Selector_Basic port map (s0=>sin0_2, s1=>sin1_2, c=>c, s=>sout_2);
	SB2 : Selector_Basic port map (s0=>sin0_3, s1=>sin1_3, c=>c, s=>sout_3);
	SB3 : Selector_Basic port map (s0=>cin0, s1=>cin1, c=>c, s=>cout);

end Behavioral;

