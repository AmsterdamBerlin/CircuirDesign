----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:53:18 11/19/2016 
-- Design Name: 
-- Module Name:    CLAdder - Behavioral 
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

entity CLAdder is
	Port (cin : in STD_LOGIC;
			a : in STD_LOGIC_VECTOR (7 downto 0);
			b : in STD_LOGIC_VECTOR (7 downto 0);
			s : out STD_LOGIC_VECTOR (7 downto 0);
		  co : out STD_LOGIC);
end CLAdder;

architecture Behavioral of CLAdder is

	
signal G : STD_LOGIC_VECTOR (7 downto 0);	
signal P : STD_LOGIC_VECTOR (7 downto 0);	
signal C  : STD_LOGIC_VECTOR (8 downto 0);
	
begin
   -- Carry Generation Stage --
	G <= a and b;
	P <= a xor b;

	-- Carry Lookahead Stage --
	C(0) <= cin;
	carryComputation:	for i in 0 to 7 generate
	begin
		C(i+1) <= G(i) or (P(i) and C(i));
	end generate carryComputation;	
	co <= C(8);
	
	-- Sum Stage --
	s <= P xor C(7 downto 0);
	
end Behavioral;

