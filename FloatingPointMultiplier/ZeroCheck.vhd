----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:43:13 02/05/2017 
-- Design Name: 
-- Module Name:    ZeroCheck - Behavioral 
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

entity FlagCheck is
Port (  A: in  STD_LOGIC_VECTOR(22 downto 0);
		  B: in  STD_LOGIC_VECTOR(22 downto 0);
		  P_temp: in STD_LOGIC_VECTOR(22 downto 0);
		  P: out STD_LOGIC_VECTOR(22 downto 0);
		  Zero: out STD_LOGIC;
		  OverFlow: out STD_LOGIC;
		  UnderFlow: out STD_LOGIC);
end FlagCheck;

architecture Behavioral of FlagCheck is

begin
	zero_check: Process(A, B, P_temp)
	begin 
		if A = "00000000000000000000000" and B = "00000000000000000000000" then
			P <= "00000000000000000000000";
			Zero <= '1';
			OverFlow <= '0';
			UnderFlow <= '0';
		else
			p <= P_temp;
			Zero <= '0';
			if A(21) = '1' and B(21) = '1' and P_temp(21) = '0' then
				OverFlow <= '1';
				UnderFlow <= '0';
			elsif A(21) = '0' and B(21) = '0' and P_temp(21) = '1' then
				OverFlow <= '0';
				UnderFlow <= '1';
			else
				OverFlow <= '0';
				UnderFlow <= '0';
			end if;
		end if;
	end process;

end Behavioral;

