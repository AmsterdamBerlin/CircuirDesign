----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:53:18 11/19/2016 
-- Design Name: 
-- Module Name:    CLAdder - Behavioral 
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

entity CLAdder is
	Port (cin : in STD_LOGIC;
			a : in STD_LOGIC_VECTOR (7 downto 0);
			b : in STD_LOGIC_VECTOR (7 downto 0);
			s : out STD_LOGIC_VECTOR (7 downto 0);
		  co : out STD_LOGIC);
end CLAdder;

architecture Behavioral of CLAdder is

component CGstage is
	port( A : in STD_LOGIC_VECTOR (7 downto 0);
			B : in STD_LOGIC_VECTOR (7 downto 0);
		   G : out STD_LOGIC_VECTOR (7 downto 0);
			P : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component CLstage is	
	port( G : in STD_LOGIC_VECTOR (7 downto 0);
		 Cin : in STD_LOGIC;
			P : in STD_LOGIC_VECTOR (7 downto 0);
		Cout : out STD_LOGIC_VECTOR (8 downto 0));
end component;

component SumStage is	
	port( inC : in STD_LOGIC_VECTOR (7 downto 0);
			  P : in STD_LOGIC_VECTOR (7 downto 0);
		  	  S : out STD_LOGIC_VECTOR (7 downto 0));
end component;
	
signal CG : STD_LOGIC_VECTOR (7 downto 0);	
signal CP : STD_LOGIC_VECTOR (7 downto 0);	
signal C  : STD_LOGIC_VECTOR (8 downto 0);
	
begin
	CGS : CGstage port map (A => a, B => b, G => CG, P => CP );
	CLS : CLstage port map (G => CG , Cin => cin , P => CP, Cout => C );
	SS  : SumStage port map (inC => C(7 downto 0), P => CP , S => s );
	co <= C(8);
end Behavioral;

