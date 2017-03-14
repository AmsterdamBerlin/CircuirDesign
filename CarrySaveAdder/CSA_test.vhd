LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY CSA_Test IS

END CSA_Test;

ARCHITECTURE behavior OF CSA_Test IS 
	COMPONENT CarrySaveAdder
	Port ( A	: in STD_LOGIC_VECTOR (10 downto 0);
		    B : in STD_LOGIC_VECTOR (10 downto 0);
			 C : in STD_LOGIC_VECTOR (10 downto 0);
			 D : in STD_LOGIC_VECTOR (10 downto 0);
			 S : out STD_LOGIC_VECTOR (14 downto 0);
		   CO : out STD_LOGIC_VECTOR (14 downto 0));
	END COMPONENT;
signal a : std_logic_vector(10 downto 0) := (others => '0');
signal b : std_logic_vector(10 downto 0) := (others => '0');
signal c : std_logic_vector(10 downto 0) := (others => '0');
signal d : std_logic_vector(10 downto 0) := (others => '0');
signal s : std_logic_vector(14 downto 0);
signal co : std_logic_vector(14 downto 0);

BEGIN
	uut: CarrySaveAdder PORT MAP (
		A => a,	
		B => b,          
		C => c,
		D => d,
		S => s,
		CO => co
		);
		
	stim_proc: process
		begin
		wait for 100 ns;
		a <="00011111111";
		b <="00000001111"; 
		c <="01100000000";
		d <="10000000000";
		wait for 100 ns;
		a <="11111111000";
		b <="11111111000";
		c <="00000000100";
		d <="00000000011";
		wait for 100 ns;
		a <="11111111111";
		b <="11111111111";
		c <="11111111111";
		d <="00000000001";
		wait for 100 ns;
		a <="11111111111";
		b <="11111111111";
		c <="11111111111";
		d <="00000000000";
		wait;
	end process;
END;