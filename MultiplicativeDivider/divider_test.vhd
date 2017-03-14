LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

ENTITY divider_test IS

END divider_test;

ARCHITECTURE behavior OF divider_test IS 
	COMPONENT MultiplicativeDivider
	Port (  clk : in STD_LOGIC;
			  rst : in STD_LOGIC;
			  Ain : in  STD_LOGIC_VECTOR(15 downto 0);
			  Bin : in  STD_LOGIC_VECTOR(15 downto 0);
		     Q : out STD_LOGIC_VECTOR(15 downto 0)); 
	END COMPONENT;
	
signal Ain : std_logic_vector(15 downto 0) := (others => '1');
signal Bin : std_logic_vector(15 downto 0) := (others => '0');
signal Q : std_logic_vector(15 downto 0);
signal clk : std_logic := '0';
signal rst : std_logic := '0';
--variable i : integer:=0;


constant clk_period : time := 20 ns;

BEGIN
	
	uut: MultiplicativeDivider PORT MAP (
		clk => clk,
		rst => rst,
		Ain => Ain,	
		Bin => Bin,          
		Q => Q
		);
		
	clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

	stim_proc: process
		begin
		
		wait for 200 ns;
		Ain <="1000000100000000";
		Bin <="1000000100000000"; 
		rst <= '1' , '0' after clk_period;
		
		wait for 200 ns;
		rst <= '1' ,'0' after clk_period;
		Ain <="0000000100000000";
		Bin <="0000000100000000";
		
		wait for 200 ns;
		rst <= '1', '0' after clk_period ;
		Ain <="0000001000000000";
		Bin <="0000001000000000";
		
		wait for 200 ns;
		rst <= '1', '0' after clk_period ;
		Ain <="1000001000000000";
		Bin <="1000001000000000";
		
		wait for 200 ns;
	  rst <= '1', '0' after clk_period ;
		Ain <="1000001000000000";
		Bin <="0000001000000000"; 
		
		wait for 200 ns;
   	rst <= '1', '0' after clk_period ;
		Ain <="1111000000000001";
		Bin <="1111000000000001";
		
		wait for 200 ns;
		rst <= '1', '0' after clk_period ;
		Ain <="0000000010000000";
		Bin <="0000000010000000";
		
		wait for 200 ns;
		rst <= '1', '0' after clk_period ;
		Ain <="1111111110000000";
		Bin <="0000000010000000";
		
		wait;
	end process;
END;