------------------------------------
-- Actividad : ALU en VHDL
-- Autor : Victor Manchola
--         Danilo Melgarejo
-- 		  Juan Camilo Vanegas
-- Fecha : Octubre 19, 2018
-- Curso : Arquitectura 2, Sesion 11
--
-- archivo : alu32.vhd
------------------------------------
--Descripcion : ALU con coperaciones
--              - AND
-- 				 - XOR
-- 				 - ADD
-- 				 - INC
------------------------------------
--cambios :
------------------------------------

-- TABLA DE VERDAD
-- -------------------------------------------------------------------------------
-- | S(1:0) | Output: BC(1:0) |                    Comment                       |
-- -------------------------------------------------------------------------------
-- |   00   | BC <- BA + BB   | Arithmetic operation ADD, BC(1) is carry-out bit |
-- |   01   | BC <- BA + 1    | Arithmetic operation INC, BC(1) is carry-out bit |
-- |   10   | BC <- BA ^ BB   | Logic operation AND, ignore carry-out bit        |
-- |   11   | BC <- BA XOR BB | Logic operation XOR, ignore carry-out bit        |
-- -------------------------------------------------------------------------------

-- Librerias
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Entity Definition
entity alu32 is
 -- Permite cambiar tamaño en posiciones de Output BC
 generic(widthbus : natural := 2);
 port(
	-- Inputs	
	BA : in  std_logic;
	BB : in  std_logic;
	S  : in  std_logic_vector(1 downto 0);
	-- Outputs
	BC : out std_logic_vector(widthbus-1 downto 0)
);
end alu32;

-- Architecture Definition
architecture alu32_arc of alu32 is
begin
	-- Similar a maquina de estados
	BC <= ('0' & BA + BB)     when (S = "00") else
			('0' & BA + 1 )     when (S = "01") else
			('0' & (BA and BB)) when (S = "10") else
			('0' & (BA xor BB)) when (S = "11");
end alu32_arc;