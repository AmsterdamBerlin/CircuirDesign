----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:02:34 11/19/2016 
-- Design Name: 
-- Module Name:    CGstage - Behavioral 
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

entity CGstage is
	port ( A : in STD_LOGIC_VECTOR (7 downto 0);
			 B : in STD_LOGIC_VECTOR (7 downto 0);
			 G : out STD_LOGIC_VECTOR (7 downto 0);
			 P : out STD_LOGIC_VECTOR (7 downto 0));
end CGstage;

architecture Behavioral of CGstage is

begin
	G <= A and B;
	P <= A xor B;

end Behavioral;

