--Testbench usado para simular el registro conectado al divisor de frecuencia

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use std.textio.all;


entity TB1 is
end TB1;

architecture beh of TB1 is

-- declaracion del componente que vamos a simular

  component Multiplicador
        port(
            op1: in std_logic_vector(3 downto 0);
            op2: in std_logic_vector(3 downto 0);
            rst: in std_logic;            --rst es un switch
            startButton: in std_logic;
            clk: in std_logic;
            
            seg: out std_logic_vector(6 downto 0);
            display_enable: out std_logic_vector(3 downto 0);
            done: out std_logic
            );
  end component;

--entradas
  signal num1 : std_logic_vector(3 downto 0) := "0011";
  signal num2 : std_logic_vector(3 downto 0) := "0010";
  signal clk : std_logic := '0';
  signal rst : std_logic := '1';
  signal boton : std_logic := '0';

--salidas
  
  constant clk_period : time := 20 ns;

begin

mult: Multiplicador port map(op1 => num1, 
                             op2 => num2, 
                             rst => rst,
                             startButton => boton,
                             clk => clk, 
                             seg => open,
                             display_enable => open,
                             done => open );

    
      -- definicion del process de reloj
      p_reloj : process
      begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
      end process;

    p_stim : process
         
        begin
        
            wait for 30 ns;
            rst <= '0';
            wait for 20 ms;
            boton <= '1';
            wait for 100 ms;
            boton <= '0';
            wait for 20 ms;
            num1 <= "1001";
            num2 <= "0111";
            wait for 70 ms;
            boton <= '1';
            wait for 100 ms;
            boton <= '0';
            wait;
            
    end process p_stim;
    
end beh;