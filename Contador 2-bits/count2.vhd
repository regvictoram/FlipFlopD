library ieee;
use ieee.std_logic_1164.all, ieee.std_logic_unsigned.all;

-- Entity Definition
entity count2 is
port(
	-- Inputs
	CLK, Reset : in std_logic;
	-- Outputs
	Q : inout std_logic_vector(1 downto 0)
);
end count2;

-- Architecture Definition
architecture count2_arc of count2 is
begin
	process(CLK, Reset) begin
		if reset = '1' then
			--for i in Q'range loop
			--	Q(i) <= '0';
			--end loop;
			--Q(0) <= '0';
			--Q(1) <= '0';
			Q <= "00";
		elsif(rising_edge(CLK)) then
			Q <= Q + 1;
		end if;
	end process;
end count2_arc;