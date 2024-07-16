----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.10.2020 13:46:11
-- Design Name: 
-- Module Name: tb_code - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

--Librerias necesarias
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_textio.all;
use std.textio.all;
 
 
ENTITY tb_code IS
END tb_code;
 
ARCHITECTURE behavior OF tb_code IS 
 
-- Declaraci?n del componente que vamos a simular
 
    COMPONENT code
    PORT(
        codein: in std_logic_vector(7 downto 0);
        rst : in std_logic;
        clk : in  std_logic;
        load : in std_logic;
        trys_leds: out std_logic_vector (6 downto 0);
        coderesult: out std_logic_vector(9 downto 0) );
    END COMPONENT;

--Entradas
    signal rst : std_logic;
    signal clk : std_logic;
    signal codein : std_logic_vector(7 downto 0);
	signal load: std_logic;
		
--Salidas
   signal trys_leds : std_logic_vector(6 downto 0);
   signal coderesult : std_logic_vector(9 downto 0);
--Se define el periodo de reloj 
    constant clk_period : time := 50 ns;
 
BEGIN
 
-- Instanciacion de la unidad a simular 

   uut: code PORT MAP (
         codein => codein,
         rst => rst,
         clk => clk,
		 load => load,
         trys_leds => trys_leds,
         coderesult => coderesult
        );

-- Definicion del process de reloj
reloj_process :process
   begin
	clk <= '0';
	wait for clk_period/2;
	clk <= '1';
	wait for clk_period/2;
end process;
 

--Proceso de estimulos
stim_proc: process
   begin		
-- Se mantiene el rst activado durante 45 ns.
      rst<='1';
      load <= '0';
      codein <= "00000000";
      wait for 45 ns;
-- Dejamos de resetear	
      rst<='0';
      load <= '0';
      codein <= "00000000";
      wait for 150 ns;	
-- Cargamos clave
      rst<='0';
      load <= '1';
      codein <= "00110010";
      wait for 50 ns;	
-- Espera
      rst<='0';
      load <= '0';
      codein <= "00110010";
      wait for 500 ns;
-- Fallamos clave
      rst<='0';
      load <= '1';
      codein <= "00100010";
      wait for 50 ns;	
-- Espera
      rst<='0';
      load <= '0';
      codein <= "00100010";
      wait for 500 ns;
-- Fallamos clave
      rst<='0';
      load <= '1';
      codein <= "10100010";
      wait for 50 ns;	
-- Espera
      rst<='0';
      load <= '0';
      codein <= "10100010";
      wait for 500 ns;
-- Acertamos clave
      rst<='0';
      load <= '1';
      codein <= "00110010";
      wait for 50 ns;	
-- Espera
      rst<='0';
      load <= '0';
      codein <= "00110010";
      wait for 500 ns;     
-- Cargamos clave
      rst<='0';
      load <= '1';
      codein <= "11111111";
      wait for 50 ns;	
-- Espera
      rst<='0';
      load <= '0';
      codein <= "11111111";
      wait for 500 ns;
-- Fallamos clave
      rst<='0';
      load <= '1';
      codein <= "00000000";
      wait for 50 ns;	
-- Espera
      rst<='0';
      load <= '0';
      codein <= "00000000";
      wait for 500 ns;
-- Fallamos clave
      rst<='0';
      load <= '1';
      codein <= "10000000";
      wait for 50 ns;	
-- Espera
      rst<='0';
      load <= '0';
      codein <= "10000000";
      wait for 500 ns;
-- Fallamos clave
      rst<='0';
      load <= '1';
      codein <= "11000000";
      wait for 50 ns;	
-- Espera indefinida
      rst<='0';
      load <= '0';
      codein <= "11000000";
      wait;
end process;

END;



