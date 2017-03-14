LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY CSA_Test IS

END CSA_Test;

ARCHITECTURE behavior OF CSA_Test IS 
	COMPONENT ConditionalSumAdder
		PORT(
		a : IN  std_logic_vector(7 downto 0);
		b : IN  std_logic_vector(7 downto 0);
		s : OUT  std_logic_vector(7 downto 0);
		co : OUT  std_logic
		);
	END COMPONENT;
signal a : std_logic_vector(7 downto 0) := (others => '0');
signal b : std_logic_vector(7 downto 0) := (others => '0');
signal s : std_logic_vector(7 downto 0);
signal co : std_logic;

BEGIN
	uut: ConditionalSumAdder PORT MAP (
		a => a,	
		b => b,          
		s => s,          
		co => co
		);
		
	stim_proc: process
		begin
		wait for 100 ns;
		a <="11110000";
		b <="00001111"; 
		wait for 100 ns;
		a <="00001111";
		b <="00001111";
		wait for 100 ns;
		a <="11111111";
		b <="00001111"; 
		wait for 100 ns;
		a <="11111111";
		b <="11111111";
		wait;
	end process;
END;