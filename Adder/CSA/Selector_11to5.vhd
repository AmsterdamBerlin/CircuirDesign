library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Selector_11to5 is
Port (   c : in STD_LOGIC;
		cin0 : in STD_LOGIC;
		cin1 : in STD_LOGIC;
	 sin0_4 : in STD_LOGIC;
	 sin1_4 : in STD_LOGIC;
	 sin0_5 : in STD_LOGIC;
	 sin1_5 : in STD_LOGIC;
	 sin0_6 : in STD_LOGIC;
	 sin1_6 : in STD_LOGIC;
	 sin0_7 : in STD_LOGIC;
	 sin1_7 : in STD_LOGIC;
		cout : out STD_LOGIC;
	 sout_4 : out STD_LOGIC;
	 sout_5 : out STD_LOGIC;
	 sout_6 : out STD_LOGIC;
	 sout_7 : out STD_LOGIC);
end Selector_11to5;

architecture Behavioral of Selector_11to5 is
component Selector_Basic is
		Port ( c : in  STD_LOGIC;
				s0 : in  STD_LOGIC;
				s1 : in  STD_LOGIC;
				 s : out  STD_LOGIC);
	end component;
begin
	SB1 : Selector_Basic port map (s0=>sin0_4, s1=>sin1_4, c=>c, s=>sout_4);
	SB2 : Selector_Basic port map (s0=>sin0_5, s1=>sin1_5, c=>c, s=>sout_5);
	SB3 : Selector_Basic port map (s0=>sin0_6, s1=>sin1_6, c=>c, s=>sout_6);
	SB4 : Selector_Basic port map (s0=>sin0_7, s1=>sin1_7, c=>c, s=>sout_7);
	SB5 : Selector_Basic port map (s0=>cin0, s1=>cin1, c=>c, s=>cout);
end Behavioral;

