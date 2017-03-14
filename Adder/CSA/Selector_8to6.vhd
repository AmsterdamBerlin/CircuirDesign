library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Selector_8to6 is
Port (  c0 : in STD_LOGIC;
		  c1 : in STD_LOGIC;
		cin0 : in STD_LOGIC;
		cin1 : in STD_LOGIC;
	 sin0_6 : in STD_LOGIC;
	 sin1_6 : in STD_LOGIC;
	 sin0_7 : in STD_LOGIC;
	 sin1_7 : in STD_LOGIC;
	  cout0 : out STD_LOGIC;
	  cout1 : out STD_LOGIC;
	sout0_6 : out STD_LOGIC;
	sout1_6 : out STD_LOGIC;
	sout0_7 : out STD_LOGIC;
	sout1_7 : out STD_LOGIC);
end Selector_8to6;

architecture Behavioral of Selector_8to6 is
component Selector_Basic is
		Port ( c : in  STD_LOGIC;
				s0 : in  STD_LOGIC;
				s1 : in  STD_LOGIC;
				 s : out  STD_LOGIC);
	end component;
begin
	SB1 : Selector_Basic port map (s0=>sin0_6, s1=>sin1_7, c=>c0, s=>sout0_6);
	SB2 : Selector_Basic port map (s0=>sin0_6, s1=>sin1_6, c=>c1, s=>sout1_6);
	SB3 : Selector_Basic port map (s0=>sin0_7, s1=>sin1_7, c=>c0, s=>sout0_7);
	SB4 : Selector_Basic port map (s0=>sin0_7, s1=>sin1_7, c=>c1, s=>sout1_7);
	SB5 : Selector_Basic port map (s0=>cin0, s1=>cin1, c=>c0, s=>cout0);
	SB6 : Selector_Basic port map (s0=>cin0, s1=>cin1, c=>c1, s=>cout1);

end Behavioral;

