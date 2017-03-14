----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:14:00 11/19/2016 
-- Design Name: 
-- Module Name:    CLstage - Behavioral 
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

entity CLstage is
	port( G : in STD_LOGIC_VECTOR (7 downto 0);
		 Cin : in STD_LOGIC;
			P : in STD_LOGIC_VECTOR (7 downto 0);
		Cout : out STD_LOGIC_VECTOR (8 downto 0));
end CLstage;

architecture Behavioral of CLstage is

signal tempC : STD_LOGIC_VECTOR (8 downto 0);
 
begin
--   Compute_internal_C : process (P, Cin)	
--	begin
--		tempC(0) <= Cin;
--		for i in 0 to 7 loop	
--			tempC(i+1) <= G(i) or (P(i) and tempC(i));		
--		end loop;
--	end process;
--	Cout <= tempC;
	tempC(0) <= Cin;
	carryComputation:	for i in 0 to 7 generate
	begin
		tempC(i+1) <= G(i) or (P(i) and tempC(i));
	end generate carryComputation;	
	Cout <= tempC;
end Behavioral;

