LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY RBM_Test IS

END RBM_Test;

ARCHITECTURE behavior OF RBM_Test IS 
	COMPONENT Radix4BoothMultipiler
	Port ( A	: in STD_LOGIC_VECTOR (15 downto 0);
		    B : in STD_LOGIC_VECTOR (15 downto 0);
			 P : out STD_LOGIC_VECTOR (31 downto 0));
	END COMPONENT;
	
signal x : std_logic_vector(15 downto 0) := (others => '1');
signal y : std_logic_vector(15 downto 0) := (others => '0');
signal z : std_logic_vector(31 downto 0);

signal jjfly: std_logic;

BEGIN
	uut: Radix4BoothMultipiler PORT MAP (
		A => x,	
		B => y,          
		P => z
		);
		
	stim_proc: process
		begin
		wait for 100 ns;
		x <="0000000000000000";
		y <="0000000000000001"; 
		wait for 100 ns;
		x <="0000000000000001";
		y <="0000000000000001";
		wait for 100 ns;
		jjfly <='0';
		x <="0000000000000001";
		y <="0000000000000010";
		wait for 100 ns;
		x <="0000000000000001";
		y <="0000000000000100";
				wait for 100 ns;
		x <="1111000000000000";
		y <="0000000000000001"; 
		wait for 100 ns;
		x <="1111000000000001";
		y <="1111000000000001";
		wait for 100 ns;
		jjfly <='0';
		x <="1000000000000001";
		y <="0000000000000010";
		wait for 100 ns;
		x <="1111111111111111";
		y <="1000000000000100";
		wait;
	end process;
END;