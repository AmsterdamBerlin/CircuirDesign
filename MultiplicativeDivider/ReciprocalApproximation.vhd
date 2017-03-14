----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:15:13 01/22/2017 
-- Design Name: 
-- Module Name:    ReciprocalApproximation - Behavioral 
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

entity ReciprocalApproximation is
Port (  B: in  STD_LOGIC_VECTOR(15 downto 0);
		  D: out STD_LOGIC_VECTOR(15 downto 0));
end ReciprocalApproximation;

architecture Behavioral of ReciprocalApproximation is

signal D_temp : STD_LOGIC_VECTOR(14 downto 0);

begin
	D_temp <=  "000000000000010" when B(14) = '1' else 
				  "000000000000100" when B(13) = '1' else 
				  "000000000001000" when B(12) = '1' else 
				  "000000000010000" when B(11) = '1' else 
				  "000000000100000" when B(10) = '1' else 
				  "000000001000000" when B(9) = '1' else 
				  "000000010000000" when B(8) = '1' else 
				  "000000100000000" when B(7) = '1' else 
				  "000001000000000" when B(6) = '1' else 
				  "000010000000000" when B(5) = '1' else 
				  "000100000000000" when B(4) = '1' else 
				  "001000000000000" when B(3) = '1' else 
				  "010000000000000" when B(2) = '1' else 
				  "100000000000000" when B(1) = '1' else 
				  "100000000000000" when B(0) = '1' else 
				  "000000000000000" ;
		
	D <= B(15) & D_temp;
	  
	  
	  
end Behavioral;

