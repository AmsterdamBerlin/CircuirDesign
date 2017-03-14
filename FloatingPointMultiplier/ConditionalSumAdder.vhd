library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ConditionalSumAdder is
	Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
	b : in STD_LOGIC_VECTOR (7 downto 0);
	cin : in STD_LOGIC;
	s : out STD_LOGIC_VECTOR (7 downto 0);
	co : out STD_LOGIC);
end ConditionalSumAdder; 

architecture Behavioral of ConditionalSumAdder is

component ResultGeneration is
		Port ( a : in STD_LOGIC;
		b : in STD_LOGIC;
		c0 : out STD_LOGIC;
		c1 : out STD_LOGIC;
		s0 : out STD_LOGIC;
		s1 : out STD_LOGIC);
end component;

component FullAdder is
	Port ( a : in  STD_LOGIC;
		b : in  STD_LOGIC;
		c : in  STD_LOGIC;
		s : out  STD_LOGIC;
		co : out  STD_LOGIC);
end component;

component Selector_5to2 is
Port (   c : in STD_LOGIC;
		cin0 : in STD_LOGIC;
		cin1 : in STD_LOGIC;
		sin0 : in STD_LOGIC;
		sin1 : in STD_LOGIC;
	   cout : out STD_LOGIC;
	   sout : out STD_LOGIC);
end component;

component Selector_6to4 is
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
end component;

component Selector_7to5 is
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
end component;

component Selector_8to6 is
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
end component;

component Selector_11to5 is
Port ( c : in STD_LOGIC;
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
end component;


signal  xi: STD_LOGIC_VECTOR (48 downto 0);

begin
	
	unit_FA :  FullAdder port map (a=>a(0),b=>b(0),s=>s(0), c => cin, co=>xi(0));
	unit_RG1 : ResultGeneration port map (a=>a(1), b=>b(1),s0=>xi(1),s1=>xi(2),c0=>xi(3),c1=>xi(4));
	unit_RG2 : ResultGeneration port map (a=>a(2), b=>b(2),s0=>xi(5),s1=>xi(6),c0=>xi(7),c1=>xi(8));
	unit_RG3 : ResultGeneration port map (a=>a(3), b=>b(3),s0=>xi(9),s1=>xi(10),c0=>xi(11),c1=>xi(12));
	unit_RG4 : ResultGeneration port map (a=>a(4), b=>b(4),s0=>xi(13),s1=>xi(14),c0=>xi(15),c1=>xi(16));
	unit_RG5 : ResultGeneration port map (a=>a(5), b=>b(5),s0=>xi(17),s1=>xi(18),c0=>xi(19),c1=>xi(20));
	unit_RG6 : ResultGeneration port map (a=>a(6), b=>b(6),s0=>xi(21),s1=>xi(22),c0=>xi(23),c1=>xi(24));
	unit_RG7 : ResultGeneration port map (a=>a(7), b=>b(7),s0=>xi(25),s1=>xi(26),c0=>xi(27),c1=>xi(28));
	
	unit_STR5to2 : Selector_5to2 port map ( c=>xi(0), sin0=>xi(1),sin1=>xi(2),cin0=>xi(3),cin1=>xi(4),sout=>s(1),cout=>xi(29));
	
	unit_STR6to4_1 : Selector_6to4 port map ( c0=>xi(7),c1=>xi(8),sin0=>xi(9),sin1=>xi(10),cin0=>xi(11),cin1=>xi(12),
															sout0=>xi(30),sout1=>xi(31),cout0=>xi(32),cout1=>xi(33));
	unit_STR6to4_2 : Selector_6to4 port map ( c0=>xi(15),c1=>xi(16),sin0=>xi(17),sin1=>xi(18),cin0=>xi(19),cin1=>xi(20),
															sout0=>xi(34),sout1=>xi(35),cout0=>xi(36),cout1=>xi(37));
	unit_STR6to4_3 : Selector_6to4 port map ( c0=>xi(23),c1=>xi(24),sin0=>xi(25),sin1=>xi(26),cin0=>xi(27),cin1=>xi(28),
															sout0=>xi(38),sout1=>xi(39),cout0=>xi(40),cout1=>xi(41));	
	
	unit_STR7to5 : Selector_7to5 port map (c=>xi(29),sin0_2=>xi(5),sin1_2=>xi(6),sin0_3=>xi(30),sin1_3=>xi(31),cin0=>xi(32),cin1=>xi(33),
															sout_2=>s(2),sout_3=>s(3),cout=>xi(42));
															
	unit_STR8to6 : Selector_8to6 port map (c0=>xi(36),c1=>xi(37),sin0_6=>xi(21),sin1_6=>xi(22),sin0_7=>xi(38),sin1_7=>xi(39),cin0=>xi(40),cin1=>xi(41),
															sout0_6=>xi(43),sout1_6=>xi(44),sout0_7=>xi(45),sout1_7=>xi(46),cout0=>xi(47),cout1=>xi(48));
															
	unit_STR11to5 : Selector_11to5 port map (c=>xi(42),sin0_4=>xi(13),sin1_4=>xi(14),sin0_5=>xi(34),sin1_5=>xi(35),sin0_6=>xi(43),sin1_6=>xi(44),sin0_7=>xi(45),
															sin1_7=>xi(46),cin0=>xi(47),cin1=>xi(48),sout_4=>s(4),sout_5=>s(5),sout_6=>s(6),sout_7=>s(7),cout =>co); 
															
end Behavioral;