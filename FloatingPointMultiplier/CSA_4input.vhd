----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:01:35 11/23/2016 
-- Design Name: 
-- Module Name:    CarrySaveAdder - Behavioral 
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

entity PartialProductsReduction  is
	Port ( A: in  STD_LOGIC_VECTOR(24 downto 0);
			 B: in  STD_LOGIC_VECTOR(24 downto 0);
			 C: in  STD_LOGIC_VECTOR(24 downto 0);
			 D: in  STD_LOGIC_VECTOR(24 downto 0);
			 S: out STD_LOGIC_VECTOR(24 downto 0);
			 CO: out STD_LOGIC_VECTOR(25 downto 0));
end PartialProductsReduction;

architecture Behavioral of PartialProductsReduction is

component counter_4to2 is
		Port ( a_counter : in STD_LOGIC;
				 b_counter : in STD_LOGIC;
				 c_counter : in STD_LOGIC;
				 d_counter : in STD_LOGIC;
		  	  tin_counter : in STD_LOGIC;
		    tout_counter : out STD_LOGIC;
				 s_counter : out STD_LOGIC;
				co_counter : out STD_LOGIC);
end component;

signal t_temp: STD_LOGIC_VECTOR(24 downto 0);  
signal CO_temp: STD_LOGIC_VECTOR(24 downto 0); 

begin
	cntr1 : counter_4to2 port map (a_counter => B(0), b_counter => C(0), c_counter => A(0), tin_counter => '0', tout_counter => t_temp(0), d_counter => D(0), s_counter => S(0), co_counter => CO_temp(0));

	cntr_gen: for i in 1 to 24 generate
		cntr: counter_4to2 port map (
			a_counter => B(i), b_counter => C(i), c_counter => A(i), tin_counter => t_temp(i-1), tout_counter => t_temp(i), d_counter => D(i), s_counter => S(i), co_counter => CO_temp(i)
			);
	end generate cntr_gen;

 -- left shift --
  CO <= CO_temp & '0';

end Behavioral;

