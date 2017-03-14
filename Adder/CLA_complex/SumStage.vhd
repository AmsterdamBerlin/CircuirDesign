----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:08:22 11/19/2016 
-- Design Name: 
-- Module Name:    SumStage - Behavioral 
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

entity SumStage is
	port ( inC : in STD_LOGIC_VECTOR (7 downto 0);
				P : in STD_LOGIC_VECTOR (7 downto 0);
				S : out STD_LOGIC_VECTOR (7 downto 0));
end SumStage;

architecture Behavioral of SumStage is

begin
	S <= P xor inC;
end Behavioral;

