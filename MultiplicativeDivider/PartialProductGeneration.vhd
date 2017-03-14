----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:52:48 01/15/2017 
-- Design Name: 
-- Module Name:    PartialProductGeneration - Behavioral 
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
use IEEE.STD_LOGIC_signed.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PartialProductGeneration is
	Port (  a: in  STD_LOGIC_VECTOR(15 downto 0);
			  b: in  STD_LOGIC_VECTOR(2 downto 0);
		     pp: out STD_LOGIC_VECTOR(16 downto 0)); 
end PartialProductGeneration;

architecture Behavioral of PartialProductGeneration is


signal a_comp: STD_LOGIC_VECTOR(15 downto 0);

begin
	
--	add: SuperAdder port map(a => a, b => "0000000000000001", s => a_comp_1);
	a_comp <= (not a) + 1;
	
	with b select pp <=

		a(15) & a 				when "010",
		a(15) & a 				when "001",
		a & '0' 					when "011",
		a_comp & '0'			when "100",
		a_comp(15) & a_comp	when "101",
		a_comp(15) & a_comp	when "110",
		"00000000000000000"  when others;
		
end Behavioral;

