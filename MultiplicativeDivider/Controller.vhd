library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divider_control is
Port ( clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		S : out STD_LOGIC;
		L : out STD_LOGIC );
end divider_control;

architecture Behavioral of divider_control is

type state_type is (state_0, state_1, state_2, state_3, state_4, state_5, state_6);
signal state, next_state : state_type;

--Declare internal signals for all outputs of the state-machine
signal S_i, L_i : STD_LOGIC ; -- example output signal

begin
	SYNC_PROC: process (clk)
	begin
		if (clk'event and clk = '1') then
			if (rst = '1') then
				state <= state_0;
				S <= '0';
				L <= '0';
			else
				state <= next_state;
				S <= S_i;
				L <= L_i;
			end if;
		end if;
	end process;
	
	
	--MOORE State-Machine - Outputs based on state only
	OUTPUT_DECODE: process (state)
	begin
	--insert statements to decode internal output signals
		case (state) is
			when state_0 => 
				S_i <= '0';
				L_i <= '0';			
			when state_1 =>
				S_i <= '0';
				L_i <= '1';
--			when state_2 => 
--				S_i <= '1';
--				L_i <= '1';
			when state_6 => 
				S_i <= '1';
				L_i <= '0';
			when others =>
				S_i <= '1';
				L_i <= '1';
		end case;
	end process;
	
	NEXT_STATE_DECODE: process (state)
	begin
		--declare default state for next_state to avoid latches
		next_state <= state; --default is to stay in current state
		--insert statements to decode next_state
		case (state) is
			when state_0 =>
				next_state <= state_1;
			when state_1 =>
				next_state <= state_2;
			when state_2 =>
				next_state <= state_3;			
			when state_3 =>
				next_state <= state_4;
			when state_4 =>
				next_state <= state_5;
			when state_5 =>
				next_state <= state_6;
			when state_6 =>
				next_state <= state_6;
		end case;
	end process;
	
	

	
end Behavioral;