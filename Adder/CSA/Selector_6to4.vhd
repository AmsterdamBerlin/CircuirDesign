library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Selector_6to4 is
Port (  c0 : in STD_LOGIC;
		  c1 : in STD_LOGIC;
		cin0 : in STD_LOGIC;
		cin1 : in STD_LOGIC;
		sin0 : in STD_LOGIC;
		sin1 : in STD_LOGIC;
	  cout0 : out STD_LOGIC;
	  cout1 : out STD_LOGIC;
	  sout0 : out STD_LOGIC;
	  sout1 : out STD_LOGIC);
end Selector_6to4;

architecture Behavioral of Selector_6to4 is
component Selector_Basic is
		Port ( c : in  STD_LOGIC;
				s0 : in  STD_LOGIC;
				s1 : in  STD_LOGIC;
				 s : out  STD_LOGIC);
	end component;
begin
	SB1 : Selector_Basic port map (s0=>sin0, s1=>sin1, c=>c0, s=>sout0);
	SB2 : Selector_Basic port map (s0=>sin0, s1=>sin1, c=>c1, s=>sout1);
	SB3 : Selector_Basic port map (s0=>cin0, s1=>cin1, c=>c0, s=>cout0);
	SB4 : Selector_Basic port map (s0=>cin0, s1=>cin1, c=>c1, s=>cout1);

end Behavioral;

