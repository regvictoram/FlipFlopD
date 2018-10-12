library ieee;
use ieee.std_logic_1164.all,ieee.std_logic_unsigned.all;

entity FSMSem is port
(
	sensor,clk,fintime : in std_logic;
	luzVerdeMayor,luzVerdeMenor,iniciotime : out std_logic
);
end entity;

architecture FSMSem_arc of FSMSem is
type luzMayor is (Verde,Rojo);
shared variable est_actual: luzMayor := Verde; 
begin
	process(clk,sensor) begin
		if ((rising_edge(clk) and sensor='1') and est_actual = Verde) then
			est_actual:=Rojo;
		elsif ((rising_edge(clk) and fintime='1') and est_actual = Rojo) then
			est_actual:=Verde;
		end if;
	end process;
	process (clk) begin
		case est_actual is
			when Verde =>
				luzVerdeMayor <= '1';
				luzVerdeMenor <= '0';
				iniciotime <='0';
			when Rojo =>
				luzVerdeMayor <= '0';
				luzVerdeMenor <= '1';
				iniciotime <='1';
		end case;
	end process;

end architecture;