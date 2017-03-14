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

entity CSA_4input is
	Port ( A	: in STD_LOGIC_VECTOR (14 downto 0);
		    B : in STD_LOGIC_VECTOR (14 downto 0);
			 C : in STD_LOGIC_VECTOR (14 downto 0);
			 D : in STD_LOGIC_VECTOR (14 downto 0);
			 S : out STD_LOGIC_VECTOR (14 downto 0);
		   CO : out STD_LOGIC_VECTOR (14 downto 0));
end CSA_4input;

architecture Behavioral of CSA_4input is

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

signal t_temp: STD_LOGIC_VECTOR(14 downto 0);  
signal CO_temp: STD_LOGIC_VECTOR(14 downto 0); 

begin

	cntr1 : counter_4to2 port map (a_counter => B(0), b_counter => C(0), c_counter => A(0), tin_counter => '0', tout_counter => t_temp(0), d_counter => D(0), s_counter => S(0), co_counter => CO_temp(0));
	cntr2 : counter_4to2 port map (a_counter => B(1), b_counter => C(1), c_counter => A(1), tin_counter => t_temp(0), tout_counter => t_temp(1), d_counter => D(1), s_counter => S(1), co_counter => CO_temp(1));
	cntr3 : counter_4to2 port map (a_counter => B(2), b_counter => C(2), c_counter => A(2), tin_counter => t_temp(1), tout_counter => t_temp(2), d_counter => D(2), s_counter => S(2), co_counter => CO_temp(2));
	cntr4 : counter_4to2 port map (a_counter => B(3), b_counter => C(3), c_counter => A(3), tin_counter => t_temp(2), tout_counter => t_temp(3), d_counter => D(3), s_counter => S(3), co_counter => CO_temp(3));
	cntr5 : counter_4to2 port map (a_counter => B(4), b_counter => C(4), c_counter => A(4), tin_counter => t_temp(3), tout_counter => t_temp(4), d_counter => D(4), s_counter => S(4), co_counter => CO_temp(4));
	cntr6 : counter_4to2 port map (a_counter => B(5), b_counter => C(5), c_counter => A(5), tin_counter => t_temp(4), tout_counter => t_temp(5), d_counter => D(5), s_counter => S(5), co_counter => CO_temp(5));
	cntr7 : counter_4to2 port map (a_counter => B(6), b_counter => C(6), c_counter => A(6), tin_counter => t_temp(5), tout_counter => t_temp(6), d_counter => D(6), s_counter => S(6), co_counter => CO_temp(6));
	cntr8 : counter_4to2 port map (a_counter => B(7), b_counter => C(7), c_counter => A(7), tin_counter => t_temp(6), tout_counter => t_temp(7), d_counter => D(7), s_counter => S(7), co_counter => CO_temp(7));
	cntr9 : counter_4to2 port map (a_counter => B(8), b_counter => C(8), c_counter => A(8), tin_counter => t_temp(7), tout_counter => t_temp(8), d_counter => D(8), s_counter => S(8), co_counter => CO_temp(8));
  cntr10 : counter_4to2 port map (a_counter => B(9), b_counter => C(9), c_counter => A(9), tin_counter => t_temp(8), tout_counter => t_temp(9), d_counter => D(9), s_counter => S(9), co_counter => CO_temp(9));
  cntr11 : counter_4to2 port map (a_counter => B(10), b_counter => C(10), c_counter => A(10), tin_counter => t_temp(9), tout_counter => t_temp(10), d_counter => D(10), s_counter => S(10), co_counter => CO_temp(10));
  cntr12 : counter_4to2 port map (a_counter => B(11), b_counter => C(11), c_counter => A(11), tin_counter => t_temp(10), tout_counter => t_temp(11), d_counter => D(11), s_counter => S(11), co_counter => CO_temp(11));
  cntr13 : counter_4to2 port map (a_counter => B(12), b_counter => C(12), c_counter => A(12), tin_counter => t_temp(11), tout_counter => t_temp(12), d_counter => D(12), s_counter => S(12), co_counter => CO_temp(12));
  cntr14 : counter_4to2 port map (a_counter => B(13), b_counter => C(13), c_counter => A(13), tin_counter => t_temp(12), tout_counter => t_temp(13), d_counter => D(13), s_counter => S(13), co_counter => CO_temp(13));
  cntr15 : counter_4to2 port map (a_counter => B(14), b_counter => C(14), c_counter => A(14), tin_counter => t_temp(13), tout_counter => t_temp(14), d_counter => D(14), s_counter => S(14), co_counter => CO_temp(14));

 -- left shift --
  CO <= CO_temp(13 downto 0) & '0';

end Behavioral;

