----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:39:53 02/04/2017 
-- Design Name: 
-- Module Name:    Pack - Behavioral 
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

entity Pack is
	Port ( Ex: in  STD_LOGIC_VECTOR(7 downto 0);
			Si: in STD_LOGIC_VECTOR(13 downto 0);
			signBit: in STD_LOGIC;
			P_temp: out STD_LOGIC_VECTOR(22 downto 0));
end Pack;

architecture Behavioral of Pack is

begin
	P_temp <= signBit & Ex & Si;

end Behavioral;

