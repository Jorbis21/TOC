--Testbench usado para simular el registro conectado al divisor de frecuencia

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use ieee.numeric_std.all;
use std.textio.all;


entity TB1 is
end TB1;

architecture beh of TB1 is


  component sintesis_tragaperras
        Port (     rst			: IN  std_logic;
    clk			: IN  std_logic;
    boton_inicio: IN  std_logic;
    boton_fin	: IN  std_logic;
    din_t       : IN std_logic_vector(3 downto 0);
    wea_t       : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    display		: OUT std_logic_vector (6 DOWNTO 0);
    leds		: OUT std_logic_vector (15 DOWNTO 0);
    s_display	: OUT std_logic_vector (3 DOWNTO 0)  
         );
  end component;

  signal clk : std_logic := '0';
  signal rst : std_logic := '1';
  signal ini : std_logic := '0';
  signal fin: std_logic := '0'; 
  signal din_t: std_logic_vector(3 downto 0) := "0010";
  signal wea_t: std_logic_vector(0 downto 0) := "1";
  constant clk_period : time := 20 ns;

begin

mult: sintesis_tragaperras 
port map(
    rst => rst,
    clk => clk,
    boton_inicio => ini, 
    boton_fin => fin,
    din_t => din_t,
    wea_t => wea_t,
    display => open,
    leds => open,
    s_display => open);

   
      reloj : process
      begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
      end process;

    sim : process        
        begin
            wait for 30 ns;
            rst <= '0';
            wait for 10 ms;
            ini <= '1';
            wait for 100 ms;
            ini <= '0';
            wait for 20 ms;
            fin <= '1';
            wait for 70 ms;
            fin <= '0';
            wait;           
    end process sim;
    
end beh;