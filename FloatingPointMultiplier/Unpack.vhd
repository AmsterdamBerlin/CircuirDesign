----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:01:54 02/04/2017 
-- Design Name: 
-- Module Name:    Unpack - Behavioral 
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

entity Unpack is
	Port (  A: in  STD_LOGIC_VECTOR(22 downto 0);
			  B: in  STD_LOGIC_VECTOR(22 downto 0);
			A_ex: out STD_LOGIC_VECTOR(7 downto 0);
			B_ex: out STD_LOGIC_VECTOR(7 downto 0);
			A_si: out STD_LOGIC_VECTOR(15 downto 0);
			B_si: out STD_LOGIC_VECTOR(15 downto 0);
			SignBit: out STD_LOGIC);
end Unpack;

architecture Behavioral of Unpack is

begin
	A_ex <= A(21 downto 14);
	B_ex <= B(21 downto 14);
	A_si <= "01" & A(13 downto 0);
	B_si <= "01" & B(13 downto 0);
	SignBit <= A(22) xor B(22);
end Behavioral;
