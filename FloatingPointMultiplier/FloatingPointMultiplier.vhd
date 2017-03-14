----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:05:09 02/04/2017 
-- Design Name: 
-- Module Name:    FloatingPointMultiplier - Behavioral 
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

entity FloatingPointMultiplier is
Port (  A: in  STD_LOGIC_VECTOR(22 downto 0);
		  B: in  STD_LOGIC_VECTOR(22 downto 0);
		  P: out STD_LOGIC_VECTOR(22 downto 0);
		  Zero: out STD_LOGIC;
		  OverFlow: out STD_LOGIC;
		  UnderFlow: out STD_LOGIC;
		  Sign: out STD_LOGIC); 	
end FloatingPointMultiplier;

architecture Behavioral of FloatingPointMultiplier is

component Radix4BoothMultipiler is
	Port (  A: in  STD_LOGIC_VECTOR(15 downto 0);
			  B: in  STD_LOGIC_VECTOR(15 downto 0);
		     P: out STD_LOGIC_VECTOR(31 downto 0)); 
end component;

component ConditionalSumAdder is
	Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
	b : in STD_LOGIC_VECTOR (7 downto 0);
	cin : in STD_LOGIC;
	s : out STD_LOGIC_VECTOR (7 downto 0);
	co : out STD_LOGIC);
end component; 

component Unpack is
	Port (  A: in  STD_LOGIC_VECTOR(22 downto 0);
			  B: in  STD_LOGIC_VECTOR(22 downto 0);
			A_ex: out STD_LOGIC_VECTOR(7 downto 0);
			B_ex: out STD_LOGIC_VECTOR(7 downto 0);
			A_si: out STD_LOGIC_VECTOR(15 downto 0);
			B_si: out STD_LOGIC_VECTOR(15 downto 0);
			SignBit: out STD_LOGIC);
end component;


component NormRound is
	port( P_si : in STD_LOGIC_VECTOR(31 downto 0);
			Si : out STD_LOGIC_VECTOR(13 downto 0);
			C_ex : out STD_LOGIC);
end component;

component Pack is
	Port ( Ex: in  STD_LOGIC_VECTOR(7 downto 0);
			Si: in STD_LOGIC_VECTOR(13 downto 0);
			signBit: in STD_LOGIC;
			P_temp: out STD_LOGIC_VECTOR(22 downto 0));
end component;

component FlagCheck is
Port (  A: in  STD_LOGIC_VECTOR(22 downto 0);
		  B: in  STD_LOGIC_VECTOR(22 downto 0);
		  P_temp: in STD_LOGIC_VECTOR(22 downto 0);
		  P: out STD_LOGIC_VECTOR(22 downto 0);
		  Zero: out STD_LOGIC;
		  OverFlow: out STD_LOGIC;
		  UnderFlow: out STD_LOGIC);
end component;


-- 23 bits: 1 for sign;  8 for exponent; 14 for significand
signal A_ex, B_ex : STD_LOGIC_VECTOR(7 downto 0);
signal A_si, B_si : STD_LOGIC_VECTOR(15 downto 0);
signal P_temp : STD_LOGIC_VECTOR(22 downto 0);
signal SignBit, C_ex:  STD_LOGIC;
signal P_si :  STD_LOGIC_VECTOR(31 downto 0);
signal Si : STD_LOGIC_VECTOR(13 downto 0);
signal Ex_raw, Ex, Ex_op : STD_LOGIC_VECTOR(7 downto 0);

begin
	unpacking: Unpack port map(A => A, B => B, A_ex => A_ex,  B_ex => B_ex,  A_si => A_si,  B_si => B_si, SignBit => SignBit); 
	
	multiply: Radix4BoothMultipiler port map(A => A_si, B => B_si, P => P_si);
	
	sum1: ConditionalSumAdder port map(a => A_ex, b => B_ex, cin => '0', s => Ex_raw);
	
	normRounding: NormRound port map(P_si => P_si, Si => Si, C_ex => C_ex);
	
	sum2: ConditionalSumAdder port map(a => Ex_raw, b => "10000001", cin => C_ex, s => Ex);
	
	packing: Pack port map(Ex => Ex, Si => Si, SignBit => SignBit, P_temp => P_temp);
	
	Checking: FlagCheck port map(A => A, B => B, P_temp => P_temp, P => P, Zero => Zero, OverFlow => OverFlow, UnderFlow => UnderFlow);
	
	Sign <= SignBit;
	
end Behavioral;

