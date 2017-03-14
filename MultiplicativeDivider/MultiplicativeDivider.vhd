----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:14:20 01/22/2017 
-- Design Name: 
-- Module Name:    MultiplicativeDivider - Behavioral 
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
use IEEE.STD_LOGIC_signed.ALL;
use ieee.numeric_std;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MultiplicativeDivider is
	Port (  clk : in STD_LOGIC;
			  rst : in STD_LOGIC;
			  Ain : in  STD_LOGIC_VECTOR(15 downto 0);
			  Bin : in  STD_LOGIC_VECTOR(15 downto 0);
		     Q : out STD_LOGIC_VECTOR(15 downto 0)); 
end MultiplicativeDivider;

architecture Behavioral of MultiplicativeDivider is

component Radix4BoothMultipiler is
	Port (  A: in  STD_LOGIC_VECTOR(15 downto 0);
			  B: in  STD_LOGIC_VECTOR(15 downto 0);
		     P: out STD_LOGIC_VECTOR(31 downto 0)); 
end component; 


component ReciprocalApproximation is
Port (  B: in  STD_LOGIC_VECTOR(15 downto 0);
		  D: out STD_LOGIC_VECTOR(15 downto 0));
end component;

component divider_control is
Port ( clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		S : out STD_LOGIC;
		L : out STD_LOGIC );
end component;

--signal Sd, Sf, Sn, L_d, Ln : STD_LOGIC;
signal F, f_i1, d_i1, d_i, n_i1, n_i : STD_LOGIC_VECTOR(15 downto 0);
signal S, L : STD_LOGIC;
signal tdi, tni : STD_LOGIC_VECTOR(31 downto 0);
signal rst_temp : STD_LOGIC;
signal A, B : STD_LOGIC_VECTOR(15 downto 0);

begin

	A <= Ain when Ain(15) = '0' else
		  not(Ain) + 1;
	B <= Bin when Bin(15) = '0' else
		  not(Bin) + 1;
-- divisor
	--d_i1 <= B when Sd = '1' else d_i;

	--	input a of multiplier should be divisor
	approximation: ReciprocalApproximation port map (B => B, D => F );
	
--	f_i1 <= f when Sf = '1' else (2 - d_i);
		
	multiplier1: Radix4BoothMultipiler port map (A => d_i1, B => f_i1, P => tdi);
	--d_i <= tdi(23 downto 8) when Ldi = '1';
	
-- dividant
	
	--n_i1 <= A when Sn = '1' else n_i;
	
	multiplier2: Radix4BoothMultipiler port map (A => f_i1, B => n_i1, P => tni);

	--n_i <= tni( 23 downto 8) when Ln = '1';
	
--	sel_n: process(s)
--	begin
--	if S = '1' then
--		n_i1 <= n_i;
--	else 
--	   n_i1 <=	A;
--	end if;
--	end process;
--	
--	sel_d: process(s)
--	begin
--		if S = '1' then
--		d_i1 <= d_i;
--	else 
--	   d_i1 <=	B;
--	end if;
--	end process;
--	
--	sel_f: process(s)
--	begin
--	if S = '1' then
--		f_i1 <= ("0000001000000000" - d_i );
--	else 
--	   f_i1 <=	F;
--	end if;
--	end process;

	n_i1 <= n_i 		when S = '1' else A;
	d_i1 <= d_i			when S = '1' else B;
	f_i1 <= ("0000001000000000" - d_i  )	when S = '1' else F;

	register_d: process(clk)
	begin
		if (clk'event and clk = '1') then
			if L = '1' then 
				d_i <= tdi(23 downto 8);
			end if;
		end if;
	end process;
	
	register_n: process(clk)
	begin
		if (clk'event and clk = '1') then
			if L = '1' then 
				n_i <= tni(23 downto 8);	  
			end if;
		end if;
	end process;
	
	
	controller: divider_control port map ( clk => clk, rst => rst, S => S, L => L);
	
	Q <= n_i when (Ain(15) xor Bin(15)) = '0' else 
		not(n_i) + 1; 
	
end Behavioral;

