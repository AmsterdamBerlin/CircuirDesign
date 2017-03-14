----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:34:28 12/07/2016 
-- Design Name: 
-- Module Name:    MovingAverageFilter - Behavioral 
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

entity MovingAverageFilter is
	port (
	   sin : in STD_LOGIC_VECTOR (10 downto 0);
	   clk : in STD_LOGIC;
	  sout : out STD_LOGIC_VECTOR (10 downto 0);
	   rst : in STD_LOGIC);
end MovingAverageFilter;

architecture Behavioral of MovingAverageFilter is

component RegisterArray is
	port(
	inputSample : in STD_LOGIC_VECTOR (10 downto 0);
			  clk : in STD_LOGIC;
			  rst : in STD_LOGIC;
			regX1 : out STD_LOGIC_VECTOR (10 downto 0);
			regX2 : out STD_LOGIC_VECTOR (10 downto 0);
			regX3 : out STD_LOGIC_VECTOR (10 downto 0);
			regX4 : out STD_LOGIC_VECTOR (10 downto 0);
			regX5 : out STD_LOGIC_VECTOR (10 downto 0);
			regX6 : out STD_LOGIC_VECTOR (10 downto 0);
			regX7 : out STD_LOGIC_VECTOR (10 downto 0);
			regX8 : out STD_LOGIC_VECTOR (10 downto 0);
			regX9 : out STD_LOGIC_VECTOR (10 downto 0);
			regX10 : out STD_LOGIC_VECTOR (10 downto 0);
			regX11 : out STD_LOGIC_VECTOR (10 downto 0);
			regX12 : out STD_LOGIC_VECTOR (10 downto 0);
			regX13 : out STD_LOGIC_VECTOR (10 downto 0);
			regX14 : out STD_LOGIC_VECTOR (10 downto 0);
			regX15 : out STD_LOGIC_VECTOR (10 downto 0);
			regX16 : out STD_LOGIC_VECTOR (10 downto 0));
end component;

component CSA_16input is
	Port ( X1 : in STD_LOGIC_VECTOR (10 downto 0);
		    X2 : in STD_LOGIC_VECTOR (10 downto 0);
			 X3 : in STD_LOGIC_VECTOR (10 downto 0);
			 X4 : in STD_LOGIC_VECTOR (10 downto 0);
			 X5 : in STD_LOGIC_VECTOR (10 downto 0);
		    X6 : in STD_LOGIC_VECTOR (10 downto 0);
			 X7 : in STD_LOGIC_VECTOR (10 downto 0);
			 X8 : in STD_LOGIC_VECTOR (10 downto 0);
			 X9 : in STD_LOGIC_VECTOR (10 downto 0);
		   X10 : in STD_LOGIC_VECTOR (10 downto 0);
			X11 : in STD_LOGIC_VECTOR (10 downto 0);
			X12 : in STD_LOGIC_VECTOR (10 downto 0);
			X13 : in STD_LOGIC_VECTOR (10 downto 0);
		   X14 : in STD_LOGIC_VECTOR (10 downto 0);
			X15 : in STD_LOGIC_VECTOR (10 downto 0);
			X16 : in STD_LOGIC_VECTOR (10 downto 0);	    
			  S : out STD_LOGIC_VECTOR (14 downto 0));
end component;

type typeX is array (15 downto 0) of std_logic_vector(10 downto 0);
signal signalX : typeX;

signal sout_temp : std_logic_vector(14 downto 0);


begin
   reg : RegisterArray port map (inputSample => sin, clk => clk, rst => rst, regX1 => signalX(0), regX2 => signalX(1), regX3 => signalX(2), regX4 => signalX(3), regX5 => signalX(4),
								regX6 => signalX(5), regX7 => signalX(6), regX8 => signalX(7), regX9 => signalX(8), regX10 => signalX(9), regX11 => signalX(10), regX12 => signalX(11), 
								regX13 => signalX(12), regX14 => signalX(13), regX15 => signalX(14), regX16 => signalX(15));
	csa : CSA_16input port map (X1 => signalX(0), X2 => signalX(1), X3 => signalX(2), X4 => signalX(3), X5 => signalX(4), X6 => signalX(5), X7 => signalX(6), X8 => signalX(7), X9 => signalX(8), 
							X10 => signalX(9), X11 => signalX(10), X12 => signalX(11), X13 => signalX(12), X14 => signalX(13), X15 => signalX(14), X16 => signalX(15),
							S => sout_temp);
	
	
	sout <= sout_temp(14 downto 4);

  -- CO => CO_temp(13 downto 0) & '0';	
end Behavioral;

