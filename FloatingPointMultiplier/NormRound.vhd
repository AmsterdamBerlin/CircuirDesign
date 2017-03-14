----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:18:25 02/04/2017 
-- Design Name: 
-- Module Name:    NormRound - Behavioral 
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

entity NormRound is
	port( P_si : in STD_LOGIC_VECTOR(31 downto 0);
			Si : out STD_LOGIC_VECTOR(13 downto 0);
			C_ex : out STD_LOGIC);
end NormRound;

architecture Behavioral of NormRound is

begin
	shift_ExOP: process (P_si) 
	begin
		if P_si(29) = '1' then
			Si <= P_si(28 downto 15);
			--/ -127+1 /--
			C_ex <= '1'; 
		else
			Si <= P_si(27 downto 14);
			--/ -127 /--
			C_ex <= '0'; 
		end if;
	end process;
	
end Behavioral;

