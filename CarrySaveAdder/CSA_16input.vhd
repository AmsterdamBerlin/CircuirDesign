----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:10:29 12/07/2016 
-- Design Name: 
-- Module Name:    CSA_16input - Behavioral 
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

entity CSA_16input is
	Port ( X1 : in STD_LOGIC_VECTOR (10 downto 0);
		    X2 : in STD_LOGIC_VECTOR (10 downto 0);
			 X3 : in STD_LOGIC_VECTOR (10 downto 0);
			 X4 : in STD_LOGIC_VECTOR (10 downto 0);
			 X5 : in STD_LOGIC_VECTOR (10 downto 0);
		    X6 : in STD_LOGIC_VECTOR (10 downto 0);
			 X7 : in STD_LOGIC_VECTOR (10 downto 0);
			 X8 : in STD_LOGIC_VECTOR (10 downto 0);
			 X9 : in STD_LOGIC_VECTOR (10 downto 0);
		   X10 : in STD_LOGIC_VECTOR (10 downto 0);
			X11 : in STD_LOGIC_VECTOR (10 downto 0);
			X12 : in STD_LOGIC_VECTOR (10 downto 0);
			X13 : in STD_LOGIC_VECTOR (10 downto 0);
		   X14 : in STD_LOGIC_VECTOR (10 downto 0);
			X15 : in STD_LOGIC_VECTOR (10 downto 0);
			X16 : in STD_LOGIC_VECTOR (10 downto 0);	    
			  S : out STD_LOGIC_VECTOR (14 downto 0));
		   
end CSA_16input;


architecture Behavioral of CSA_16input is

type data_temp is array (6 downto 0) of std_logic_vector(14 downto 0);

signal S_temp: data_temp;
signal C_temp: data_temp;

component CarrySaveAdder is
	Port ( A	: in STD_LOGIC_VECTOR (10 downto 0);
		    B : in STD_LOGIC_VECTOR (10 downto 0);
			 C : in STD_LOGIC_VECTOR (10 downto 0);
			 D : in STD_LOGIC_VECTOR (10 downto 0);
			 S : out STD_LOGIC_VECTOR (14 downto 0);
		   CO : out STD_LOGIC_VECTOR (14 downto 0));
end component;

component CSA_4input is
	Port ( A	: in STD_LOGIC_VECTOR (14 downto 0);
		    B : in STD_LOGIC_VECTOR (14 downto 0);
			 C : in STD_LOGIC_VECTOR (14 downto 0);
			 D : in STD_LOGIC_VECTOR (14 downto 0);
			 S : out STD_LOGIC_VECTOR (14 downto 0);
		   CO : out STD_LOGIC_VECTOR (14 downto 0));
end component;

component CLAdder is
	Port (cin : in STD_LOGIC;
			a : in STD_LOGIC_VECTOR (14 downto 0);
			b : in STD_LOGIC_VECTOR (14 downto 0);
			s : out STD_LOGIC_VECTOR (14 downto 0));
		--  co : out STD_LOGIC_VECTOR (13 downto 0)); dont need carry out
end component;


begin
	-- in the first four CSA, the bit length of input is 11 --
	CSA1 : CarrySaveAdder port map (A => X1, B => X2, C => X3, D => X4, S => S_temp(0), CO => C_temp(0));
	CSA2 : CarrySaveAdder port map (A => X5, B => X6, C => X7, D => X8, S => S_temp(1), CO => C_temp(1));
	CSA3 : CarrySaveAdder port map (A => X9, B => X10, C => X11, D => X12, S => S_temp(2), CO => C_temp(2));
	CSA4 : CarrySaveAdder port map (A => X13, B => X14, C => X15, D => X16, S => S_temp(3), CO => C_temp(3));
	
	-- in the last three CSA, the bit length of input is 15
	CSA5 : CSA_4input port map (A => S_temp(0), B => C_temp(0), C => S_temp(1), D => C_temp(1), S => S_temp(4), CO => C_temp(4));
	CSA6 : CSA_4input port map (A => S_temp(2), B => C_temp(2), C => S_temp(3), D => C_temp(3), S => S_temp(5), CO => C_temp(5));
	CSA7 : CSA_4input port map (A => S_temp(4), B => C_temp(4), C => S_temp(5), D => C_temp(5), S => S_temp(6), CO => C_temp(6));
	
	-- carry out is ignored -- 
	CLA : CLAdder port map (a => S_temp(6), b => C_temp(6), cin => '0', s =>  S);
	
	
end Behavioral;

