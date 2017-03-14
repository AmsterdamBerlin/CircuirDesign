----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:42:36 01/15/2017 
-- Design Name: 
-- Module Name:    Radix4BoothMultipiler - Behavioral 
-- 16*16
-- 17 + 17 + 17 + 17 +17 + 17 + 17 + 17
-- 4 to 2 counter 17 17 17 17 => 24 
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
use IEEE.STD_LOGIC_signed.ALL;
use ieee.numeric_std;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Radix4BoothMultipiler is
	Port (  A: in  STD_LOGIC_VECTOR(15 downto 0);
			  B: in  STD_LOGIC_VECTOR(15 downto 0);
		     P: out STD_LOGIC_VECTOR(31 downto 0)); 
end Radix4BoothMultipiler;

architecture Behavioral of Radix4BoothMultipiler is

component PartialProductGeneration is
	Port (  a: in  STD_LOGIC_VECTOR(15 downto 0);
			  b: in  STD_LOGIC_VECTOR(2 downto 0);
			 pp: out STD_LOGIC_VECTOR(16 downto 0)); 
end component;
	
component PartialProductsReduction is	
	Port ( A: in  STD_LOGIC_VECTOR(24 downto 0);
			 B: in  STD_LOGIC_VECTOR(24 downto 0);
			 C: in  STD_LOGIC_VECTOR(24 downto 0);
			 D: in  STD_LOGIC_VECTOR(24 downto 0);
			 S: out STD_LOGIC_VECTOR(24 downto 0);
			 CO: out STD_LOGIC_VECTOR(25 downto 0));
end component;

signal B0: STD_LOGIC_VECTOR(2 downto 0);

type pp_temp_t is array (7 downto 0) of std_logic_vector(16 downto 0);
type pp_se_t is array (7 downto 0) of std_logic_vector(24 downto 0);


signal pp_temp: pp_temp_t;
signal pp_se: pp_se_t := ( others =>(others => '0'));

signal ppr_temp_0: STD_LOGIC_VECTOR(25 downto 0) := (others => '0');
signal ppr_temp_1: STD_LOGIC_VECTOR(25 downto 0) := (others => '0');
signal ppr_temp_2: STD_LOGIC_VECTOR(25 downto 0) := (others => '0');
signal ppr_temp_3: STD_LOGIC_VECTOR(25 downto 0) := (others => '0');

signal s_temp_1: STD_LOGIC_VECTOR(31 downto 0) := (others => '0'); 
signal s_temp_2: STD_LOGIC_VECTOR(31 downto 0) := (others => '0'); 
signal p_temp : STD_LOGIC_VECTOR(31 downto 0) ;

begin
	-- Partial Product Generation
	B0 <= B(1) & B(0)&'0';
	ppg0: PartialProductGeneration port map (a => A, b => B0, pp => pp_temp(0));
	ppg1: PartialProductGeneration port map (a => A, b => B(3 downto 1), pp => pp_temp(1));
	ppg2: PartialProductGeneration port map (a => A, b => B(5 downto 3), pp => pp_temp(2));
	ppg3: PartialProductGeneration port map (a => A, b => B(7 downto 5), pp => pp_temp(3));
	ppg4: PartialProductGeneration port map (a => A, b => B(9 downto 7), pp => pp_temp(4));
	ppg5: PartialProductGeneration port map (a => A, b => B(11 downto 9), pp => pp_temp(5));
	ppg6: PartialProductGeneration port map (a => A, b => B(13 downto 11), pp => pp_temp(6));
	ppg7: PartialProductGeneration port map (a => A, b => B(15 downto 13), pp => pp_temp(7));
	
	
	
	-- sign extension 
	pp_se(0)(19 downto 0) <= (not pp_temp(0)(16)) & pp_temp(0)(16) & pp_temp(0)(16) & pp_temp(0);
	pp_se(1)(20 downto 0) <= '1' & (not pp_temp(1)(16)) & pp_temp(1) & "00";
	pp_se(2)(22 downto 0) <= '1' & (not pp_temp(2)(16)) & pp_temp(2) & "0000";
	pp_se(3)(24 downto 0) <= '1' & (not pp_temp(3)(16)) & pp_temp(3) & "000000";
	--------------------------------------------------------
	pp_se(4)(18 downto 0) <= '1' & (not pp_temp(4)(16)) & pp_temp(4);
	pp_se(5)(20 downto 0) <= '1' & (not pp_temp(5)(16)) & pp_temp(5) & "00";
	pp_se(6)(22 downto 0) <= '1' & (not pp_temp(6)(16)) & pp_temp(6) & "0000";
	pp_se(7)(23 downto 0) <= 		 (not pp_temp(7)(16)) & pp_temp(7) & "000000";
	
	ppr0: PartialProductsReduction  port map(A => pp_se(0), B => pp_se(1), C => pp_se(2),D => pp_se(3),  
																						S => ppr_temp_0(24 downto 0), CO => ppr_temp_1);
	
	ppr1: PartialProductsReduction  port map(A => pp_se(4), B => pp_se(5), C => pp_se(6),D => pp_se(7), 
																					S => ppr_temp_2(24 downto 0), CO => ppr_temp_3);
	
	--sa1: SuperAdder generic map(len => 26) port map( a => ppr_temp_0, b => ppr_temp_1, s => s_temp_1( 26 downto 0));
	
	s_temp_1(25 downto 0) <= ppr_temp_0 + ppr_temp_1;
	s_temp_2(25 downto 0) <= ppr_temp_2 + ppr_temp_3;
	
	p_temp <= ( s_temp_2(23 downto 0) & "00000000");
	p <= s_temp_1 + p_temp;
--	((s_temp_2 sll 1) & "0000000");
	
--	P <= p_temp(31 downto 0);
	
end Behavioral;

