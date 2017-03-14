----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:47:22 12/07/2016 
-- Design Name: 
-- Module Name:    RegisterArray - Behavioral 
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
-- any regXilinregX primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterArray is
	port ( 
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
end RegisterArray;

architecture Behavioral of RegisterArray is

type bufferType is array (15 downto 0) of std_logic_vector(10 downto 0);
signal bufferX : bufferType;

begin
	sampleReg : process (rst, clk)
		begin
			if rst = '1' then
				for i in 0 to 15 loop
                bufferX(i) <= "00000000000";
            end loop; 
			else
				if clk'event and clk='1' then
				-- Shift buffer --
            for i in 15 downto 1 loop
                bufferX(i) <= bufferX(i-1);
            end loop;
				bufferX(0) <= inputSample;
			end if;
		end if;
	end process;
	
	regX1 <= bufferX(0);
	regX2 <= bufferX(1);
	regX3 <= bufferX(2);
	regX4 <= bufferX(3);
	regX5 <= bufferX(4);
	regX6 <= bufferX(5);
	regX7 <= bufferX(6);
	regX8 <= bufferX(7);
	regX9 <= bufferX(8);
	regX10 <= bufferX(9);
	regX11 <= bufferX(10);
	regX12 <= bufferX(11);
	regX13 <= bufferX(12);
	regX14 <= bufferX(13);
	regX15 <= bufferX(14);
	regX16 <= bufferX(15);
	
end Behavioral;

