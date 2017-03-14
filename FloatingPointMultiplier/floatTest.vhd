-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY floatTest IS
  END floatTest;

  ARCHITECTURE behavior OF floatTest IS 

  -- Component Declaration
 component FloatingPointMultiplier is
Port (  A: in  STD_LOGIC_VECTOR(22 downto 0);
		  B: in  STD_LOGIC_VECTOR(22 downto 0);
		  P: out STD_LOGIC_VECTOR(22 downto 0);
		  Zero: out STD_LOGIC;
		  OverFlow: out STD_LOGIC;
		  UnderFlow: out STD_LOGIC;
		  Sign: out STD_LOGIC);  	
	end component;
          
signal A : std_logic_vector(22 downto 0) := (others => '0');
signal B : std_logic_vector(22 downto 0) := (others => '0');
signal P:  STD_LOGIC_VECTOR(22 downto 0); 
signal Zero:  STD_LOGIC;
signal OverFlow:  STD_LOGIC;
signal UnderFlow:  STD_LOGIC;
signal Sign:  STD_LOGIC;  
  
 BEGIN

  -- Component Instantiation
          uut: FloatingPointMultiplier PORT MAP(
                  A => A,
                  B => B,
						P => P,
						Zero => Zero,
						OverFlow => OverFlow,
						UnderFlow => UnderFlow,
						Sign => Sign);


  --  Test Bench Statements
     tb : PROCESS
     BEGIN
	
		wait for 100 ns;
      A<="01111111110000000000000";
		B<="00000000110000000000000";
     
	   wait for 100 ns;
	   A<="00000000010000000000000";
		B<="00000000110000000000000";
		
	   wait for 100 ns;
	   A<="01000000010000000000000";
		B<="00000000000000000000000";		
	  
	   wait for 100 ns;
	   A<="00000000001111000000000";
		B<="00000011110000000000000";

	   wait for 100 ns;
	   A<="01000000010000000000000";
		B<="10000000010000000000000";
		
		wait for 100 ns;
	   A<="00111111110000000000000";
		B<="01000000000000000000000";
		

		
        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
