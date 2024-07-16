
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tragaperras IS
PORT (
    rst : IN std_logic;
    clk : IN std_logic;
    inicio : IN std_logic;
    fin : IN std_logic;
    din_bram  : IN std_logic_vector(3 downto 0);
    wea_bram : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    douta_bram: OUT std_logic_vector(3 downto 0);
    cont1: OUT std_logic_vector (3 DOWNTO 0);
    cont2: OUT std_logic_vector (3 DOWNTO 0);
    leds: OUT std_logic_vector (15 DOWNTO 0)
);
END tragaperras;

architecture Behavioral of tragaperras is


 type ESTADOS is (S0, S1, S2, S3, S4);
 signal ESTADO, SIG_ESTADO: ESTADOS;

component multiplex is
    port (
        salidaMux : out std_logic_vector(15 downto 0);
        entradaMux : in std_logic_vector (1 downto 0);
        a0, a1, a2, a3 : in std_logic_vector (15 downto 0)
    );
   end component; 
   
COMPONENT memoria_bram
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END COMPONENT;

component contador is
    port (
        rst : IN std_logic;
        clk : IN std_logic;
        cuenta : IN std_logic;
        salida : OUT std_logic_vector(3 downto 0)
    );

end component;


component divisor is
port (
        rst: in STD_LOGIC;
        clk_entrada: in STD_LOGIC;
        clk_salida: out STD_LOGIC;
        clk_salida1: out STD_LOGIC;
        clk_salida2: out STD_LOGIC;
        clk_salida3: out STD_LOGIC
    );
 end component;   
 
 
signal entrada: std_logic_vector(1 downto 0);
signal Cont0_s: std_logic_vector(3 downto 0);
signal Cont1_s: std_logic_vector(3 downto 0);
signal Cont2_s: std_logic_vector(3 downto 0);
signal douta1, douta2: std_logic_vector(3 downto 0);
signal clk05seg: std_logic;
signal clk2: std_logic;
signal clk3: std_logic;
signal clk4: std_logic;
signal atraer: std_logic_vector(15 downto 0);
signal perder: std_logic_vector(15 downto 0);
signal ganar: std_logic_vector(15 downto 0);
signal apagado:std_logic_vector(15 downto 0);
signal salida:std_logic_vector(15 downto 0);
signal enable_cont05s: std_logic;
signal enable_cont1: std_logic;
signal enable_cont2: std_logic;
signal rst_cont: std_logic;

begin 

apagado <= "0000000000000000";

mux: multiplex port map(
salidaMux => salida, 
entradaMux => entrada, 
a0 => apagado, 
a1 => ganar, 
a2 => perder, 
a3 => atraer);
divider: divisor port map(
rst => rst, 
clk_entrada => clk, 
clk_salida => clk05seg, 
clk_salida1 => clk2, 
clk_salida2 => clk3,
clk_salida3 => clk4);
contador1: contador port map(
rst => inicio, 
clk => clk05seg, 
cuenta => enable_cont05s, 
salida => Cont0_s);

contador2: contador port map(
rst => rst_cont, 
clk => clk4, 
cuenta => enable_cont1, 
salida => Cont1_s);
mem1 : memoria_bram
  PORT MAP (
    clka => clk4,
    ena => '1',
    wea => wea_bram,
    addra => Cont1_s,
    dina => din_bram,
    douta => douta_bram
  );
contador3: contador port map(
rst => rst_cont, 
clk => clk3, 
cuenta => enable_cont2, 
salida => Cont2_s);
mem2: memoria_bram
  PORT MAP (
    clka => clk3,
    ena => '1',
    wea => "1",
    addra => "0000",
    dina => Cont2_s,
    douta => douta2);
ATRAE :  process(clk05seg, rst)
  begin
        if (rst = '1') 
            then atraer <= "0000000000000000";
        elsif rising_edge(clk05seg)then 
         atraer(15) <= not atraer(0);
         atraer(14 downto 0) <= atraer(15 downto 1);
        end if;
  end process ATRAE;
  
             
PIERDE : process (rst, clk05seg)
begin
if rst = '1' then
        perder <= "1010101010101010";
    elsif rising_edge(clk05seg) then
        perder <= not perder;
    end if;
end process PIERDE;

GANA : process (rst, clk05seg)
begin
if rst = '1' then
        ganar <= "1111111111111111";
    elsif rising_edge(clk05seg) then
        ganar <= not ganar;
    end if;
end process GANA;
          
SINC: process (clk, rst)
begin
    if rst = '1' then
        ESTADO <= S0;
    elsif rising_edge(clk) then
        ESTADO <= SIG_ESTADO;
    end if;
end process SINC;

COMB: process (ESTADO, inicio, fin)
begin
  case ESTADO is
    
    when S0 =>
        entrada <= "11";
        rst_cont <= '1';
        cont1 <= douta1;
        cont2 <= douta2;
    if inicio = '1' AND wea_bram = "1" then 
       SIG_ESTADO <= S1;   
    else
       SIG_ESTADO <= S0;
    end if;
                      
    when S1 =>
    entrada <= "00";
    enable_cont05s <= '0';
    rst_cont <= '0';
    enable_cont1 <= '1';
    enable_cont2 <= '1';
    cont1 <= douta1;
    cont2 <= douta2;
        if(fin = '1') then
            SIG_ESTADO <= S2;
        else
            SIG_ESTADO <= S1;
        end if;
        
     when S2 =>
        rst_cont <= '0';
        enable_cont1 <= '0';
        enable_cont2 <= '0';
        cont1 <= douta1;
        cont2 <= douta2;
        if(douta2 = douta1) then
            SIG_ESTADO <= S3;
        else
            SIG_ESTADO <= S4;
        end if;
        
     when S3 =>
        entrada <= "01";
        rst_cont <= '0';
        cont1 <= douta1;
        cont2 <= douta2;
        
        enable_cont05s <= '1';
        if(Cont0_s = "1001") then
            SIG_ESTADO <= S0;
        else
            SIG_ESTADO <= S3;
        end if;
        
     when S4 =>
        entrada <= "10";
        rst_cont <= '0';
        cont1 <= douta1;
        cont2 <= douta2;
        
        enable_cont05s <= '1';
        if(Cont0_s = "1001") then
            SIG_ESTADO <= S0;
        else
            SIG_ESTADO <= S4;
        end if;
  end case;
  leds <= salida;
 end process COMB;
end Behavioral;