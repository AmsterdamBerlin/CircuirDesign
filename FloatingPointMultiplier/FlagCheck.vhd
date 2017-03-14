----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:00:44 02/04/2017 
-- Design Name: 
-- Module Name:    FlagCheck - Behavioral 
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

entity FlowCheck is
Port (  A_mse: in STD_LOGIC;
		  B_mse: in STD_LOGIC;
		  Ex_mse : in STD_LOGIC;
		  OverFlow: out STD_LOGIC;
		  UnderFlow: out STD_LOGIC);
end FlowCheck;

architecture Behavioral of FlowCheck is

begin
	flow_check: process(A_mse, B_mse, Ex_mse)
	begin
		if A_mse = '1' and B_mse = '1' and Ex_mse = '0' then
			OverFlow <= '1';
			UnderFlow <= '0';
		elsif A_mse = '0' and B_mse = '0' and Ex_mse = '1' then
			OverFlow <= '0';
			UnderFlow <= '1';
		else
			OverFlow <= '0';
			UnderFlow <= '0';
		end if;
	end process;

end Behavioral;

