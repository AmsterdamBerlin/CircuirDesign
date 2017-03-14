LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Adder8BitsTest IS

END Adder8BitsTest;

ARCHITECTURE behavior OF Adder8BitsTest IS 
	COMPONENT Adder8bit
		PORT(
		a : IN  std_logic_vector(7 downto 0);
		b : IN  std_logic_vector(7 downto 0);
		c : IN  std_logic;
		s : OUT  std_logic_vector(7 downto 0);
		co : OUT  std_logic
		);
	END COMPONENT;
signal a : std_logic_vector(7 downto 0) := (others => '0');
signal b : std_logic_vector(7 downto 0) := (others => '0');
signal c : std_logic := '0';
signal s : std_logic_vector(7 downto 0);
signal co : std_logic;

BEGIN
	uut: Adder8bit PORT MAP (
		a => a,	
		b => b,          
		c => c,
		s => s,          
		co => co
		);
		
	stim_proc: process
	begin
		wait for 100 ns;
			c <= '0';
			a <="11110000";
			b <="00001111"; 
		wait for 100 ns;
			c <= '1';
			a <="11110000";
			b <="00001111"; 
		wait for 100 ns;
			c <= '0';
			a <="00001111";
			b <="11111111"; 
		wait for 100 ns;
			c <= '1';
			a <="00001111";
			b <="11111111"; 
		wait;
	end process;
END;