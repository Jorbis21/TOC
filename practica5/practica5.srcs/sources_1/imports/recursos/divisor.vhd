----------------------------------------------------------------------------------
-- Company: Universidad Complutense de Madrid
-- Engineer: Hortensia Mecha
-- 
-- Design Name: divisor 
-- Module Name:    divisor - divisor_arch 
-- Project Name: 
-- Target Devices: 
-- Description: Creación de un reloj de 1Hz a partir de
--		un clk de 100 MHz
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.std_logic_unsigned.ALL;

entity divisor is
    port (
        rst: in STD_LOGIC;
        clk_entrada: in STD_LOGIC; -- reloj de entrada de la entity superior
        clk_salida: out STD_LOGIC;
        clk_salida1: out STD_LOGIC;
        clk_salida2: out STD_LOGIC;
        clk_salida3: out STD_LOGIC
    );
end divisor;

architecture divisor_arch of divisor is
 SIGNAL cuenta: std_logic_vector(27 downto 0);
 SIGNAL cuenta1: std_logic_vector(27 downto 0);
 SIGNAL cuenta2: std_logic_vector(27 downto 0);
 SIGNAL cuenta3: std_logic_vector(27 downto 0);
 SIGNAL clk_aux: std_logic;
 SIGNAL clk_aux1: std_logic;
 SIGNAL clk_aux2: std_logic;
 SIGNAL clk_aux3: std_logic;
  
  begin
  
clk_salida<=clk_aux;
contador: PROCESS(rst, clk_entrada)
  BEGIN
    IF (rst='1') THEN
      cuenta <= (OTHERS=>'0');
      clk_aux<='0';
    ELSIF(rising_edge(clk_entrada)) THEN
      IF (cuenta="010111110101111000010000000") THEN 
      	clk_aux <= '1';
        cuenta<= (OTHERS=>'0');
      ELSE
        cuenta <= cuenta+'1';
	   clk_aux<='0';
      END IF;
    END IF;
  END PROCESS contador;
 
 
 
clk_salida1<=clk_aux1;
contador1: PROCESS(rst, clk_entrada)
  BEGIN
    IF (rst='1') THEN
      cuenta1<= (OTHERS=>'0');
      clk_aux1<='0';
    ELSIF(rising_edge(clk_entrada)) THEN
      IF (cuenta1="000000001011110000100000000") THEN 
      	clk_aux1 <= '1';
        cuenta1<= (OTHERS=>'0');
      ELSE
        cuenta1 <= cuenta1+'1';
	   clk_aux1<='0';
      END IF;
    END IF;
  END PROCESS contador1;
  
  
  
  clk_salida2<=clk_aux2;
contador2: PROCESS(rst, clk_entrada)
  BEGIN
    IF (rst='1') THEN
      cuenta2<= (OTHERS=>'0');
      clk_aux2<='0';
    ELSIF(rising_edge(clk_entrada)) THEN
      IF (cuenta2="00000000001101001100000110") THEN 
      	clk_aux2 <= '1';
        cuenta2<= (OTHERS=>'0');
      ELSE
        cuenta2 <= cuenta2+'1';
	   clk_aux2<='0';
      END IF;
    END IF;
  END PROCESS contador2;

clk_salida3<=clk_aux3;
contador1seg: PROCESS(rst, clk_entrada)
  BEGIN
    IF (rst='1') THEN
      cuenta3 <= (OTHERS=>'0');
      clk_aux3<='0';
    ELSIF(rising_edge(clk_entrada)) THEN
      IF (cuenta3 ="101111101011110000100000000") THEN 
      	clk_aux3 <= '1';
        cuenta3<= (OTHERS=>'0');
      ELSE
        cuenta3 <= cuenta3+'1';
	   clk_aux3<='0';
      END IF;
    END IF;
  END PROCESS contador1seg;
end divisor_arch;
