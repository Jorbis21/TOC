LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;


ENTITY sintesis_tragaperras IS
  PORT (
    rst			: IN  std_logic;
    clk			: IN  std_logic;
    boton_inicio: IN  std_logic;
    boton_fin	: IN  std_logic;
    din_t       : IN std_logic_vector(3 downto 0);
    wea_t       : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    display		: OUT std_logic_vector (6 DOWNTO 0);
    leds		: OUT std_logic_vector (15 DOWNTO 0);
    s_display	: OUT std_logic_vector (3 DOWNTO 0)
  );
END sintesis_tragaperras;

ARCHITECTURE tragaperrasArch OF sintesis_tragaperras IS

    COMPONENT tragaperras IS
      PORT (
       rst		: IN  std_logic;
       clk		: IN  std_logic;
       inicio   : IN  std_logic;
	   fin		: IN  std_logic;
	   din_bram : IN std_logic_vector(3 downto 0);
	   wea_bram : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	   douta_bram: OUT std_logic_vector(3 downto 0);
	   cont1	: OUT std_logic_vector (3 DOWNTO 0);
       cont2	: OUT std_logic_vector (3 DOWNTO 0);
	   leds		: OUT std_logic_vector (15 DOWNTO 0)
      );
    END COMPONENT;

  COMPONENT debouncer
    PORT (
      rst: IN std_logic;
      clk: IN std_logic;
      x: IN std_logic;
      xDeb: OUT std_logic;
      xDebFallingEdge: OUT std_logic;
      xDebRisingEdge: OUT std_logic
    );
  END COMPONENT;
   
 component displays is
    Port ( 
        rst            : in STD_LOGIC;
        clk            : in STD_LOGIC;       
        digito_0       : in  STD_LOGIC_VECTOR (3 downto 0);
        digito_1       : in  STD_LOGIC_VECTOR (3 downto 0);
        digito_2       : in  STD_LOGIC_VECTOR (3 downto 0);
        digito_3       : in  STD_LOGIC_VECTOR (3 downto 0);
        display        : out  STD_LOGIC_VECTOR (6 downto 0);
        display_enable : out  STD_LOGIC_VECTOR (3 downto 0)
     );
end component;

  
 signal s_displays        : std_logic_vector (3 DOWNTO 0);
 signal inicio, fin       : std_logic;
 signal cont1, cont2      : std_logic_vector (3 DOWNTO 0);
 signal display1, display2: std_logic_vector (6 DOWNTO 0);
 signal reset_n           : std_logic;
 signal douta             : std_logic_vector (3 DOWNTO 0);
BEGIN
reset_n <= not rst;
debouncer_inicio: debouncer PORT MAP (
    rst => reset_n, 
    clk => clk, 
    x => boton_inicio,
    xDeb => open, 
    xDebFallingEdge => open, 
    xDebRisingEdge => inicio);
debouncer_fin: debouncer PORT MAP (
    rst => reset_n, 
    clk => clk, 
    x => boton_fin, 
    xDeb => open, 
    xDebFallingEdge => open, 
    xDebRisingEdge => fin);
tragaperras_uc : tragaperras PORT MAP (
    rst => rst, 
    clk => clk, 
    inicio => inicio, 
    fin => fin,
    din_bram => din_t,
    wea_bram => wea_t,
    douta_bram => douta,
    cont1 => cont1, 
    cont2 => cont2, 
    leds => leds);
displays_inst:  displays PORT MAP (
    rst => rst,
    clk => clk,
    digito_0 => cont1,
    digito_1 => cont2,
    digito_2 => "0000",
    digito_3 => douta, 
    display => display,
    display_enable => s_display);
END tragaperrasArch;
