library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cd is
  port (
    clk    : in  std_logic;                    -- clock
    rst  : in  std_logic;                      -- reset
    b   : in  std_logic_vector(3 downto 0);   
    a   : in  std_logic_vector(3 downto 0);   
    n    : in std_logic_vector(3 downto 0);   
    ctrl   : in  std_logic_vector(8 downto 0);   -- Control
    mult: out std_logic_vector(7 downto 0);
    status : out std_logic_vector(1 downto 0));  -- Status
end entity cd;

architecture rtl of cd is

  signal out_r_b   : std_logic_vector(3 downto 0);
  signal out_r_a : std_logic_vector(3 downto 0);
  signal out_r_acc          : std_logic_vector(3 downto 0);
  signal out_r_n          : std_logic_vector(3 downto 0);
  signal b_des           : std_logic_vector(3 downto 0);
  signal a_des           : std_logic_vector(3 downto 0);
  signal b_mx           : std_logic_vector(3 downto 0);
  signal a_mx           : std_logic_vector(3 downto 0);
  signal n_mx           : std_logic_vector(3 downto 0);
  signal acc_mx           : std_logic_vector(3 downto 0);
  signal suma            : std_logic_vector(7 downto 0);
  signal resta     : std_logic_vector(3 downto 0);
  signal n_cont           : std_logic_vector(3 downto 0);
  -- Control signals
  signal mx_b  : std_logic;
  signal mx_acc: std_logic;
  signal mx_a  : std_logic;
  signal mx_n  : std_logic;
  signal r_b   : std_logic;
  signal r_a   : std_logic;
  signal r_n   : std_logic;
  signal des_b : std_logic;
  signal des_a : std_logic;

  -- Status signals
 signal zero: std_logic;
  
    component multiplexor is
  port(
    a: in std_logic_vector(3 downto 0);
    b: in std_logic_vector(3 downto 0);
    sel: in std_logic;
    c: out std_logic_vector(3 downto 0));
  end component multiplexor;
  component registro is
  port( 
    rst  : IN  std_logic;
    clk  : IN  std_logic;
    load : IN  std_logic;
    E    : IN  std_logic_vector(3 downto 0);
    S    : OUT std_logic_vector(3 downto 0));
  end component;
  component sumador is
  port (
    X : IN   std_logic_vector(3 downto 0);
    Y : IN   std_logic_vector(3 downto 0);
    Z : OUT  std_logic_vector(7 downto 0));
  end component;
  component restador is
  port (
    A : IN   std_logic_vector(3 downto 0);
    B : IN   std_logic_vector(3 downto 0);
    C : OUT  std_logic_vector(3 downto 0));
  end component;
  component des_der is
  port ( 
    rst: in std_logic;
    clk: in std_logic;
    num: in std_logic_vector(3 downto 0);
    num_out: out std_logic_vector(3 downto 0));
 end component;
 component des_izq is
  port ( 
    rst: in std_logic;
    clk: in std_logic;
    num: in std_logic_vector(3 downto 0);
    num_out: out std_logic_vector(3 downto 0));
 end component;
begin
 -----------------------------------------------------------------------------
  -- Internamente no trabajo con las componentes del vector ctrl y status sino que
  -- damos nombre a cada una de las componentes y trabajamos con ellas por
  -- separado. De esta forma es mucho más legible el codigo obtenido. Luego
  -- la componente status(0) la asigno a la senal zero y la componente
  -- status(1) la asigna la senal dndo_msb.
  -- Y lo mismo para el vector ctrl. La componente ctrl(0) se la asigno a mux,
  -- ctrl(1) a coc_sh, ctrl(2) a coc_ld y asi sucesivamente.
  -----------------------------------------------------------------------------
  
  (mx_b,
   mx_acc,
   mx_a,
   mx_n,
   r_b,
   r_a,
   r_n,
   des_b,
   des_a) <= ctrl;
   mult <= suma;
status <= (zero & '1');
  -----------------------------------------------------------------------------
  -- Registro desplazamiento a derecha
  -----------------------------------------------------------------------------
  desp_b: des_der port map(rst, clk, out_r_b, b_des);

  -----------------------------------------------------------------------------
  -- Registro con carga paralelo
  -----------------------------------------------------------------------------
reg_b: registro port map(rst, clk, r_b, b_mx, out_r_b);
reg_a: registro port map(rst, clk, r_a, a_mx, out_r_a);
reg_n: registro port map(rst, clk, r_n, n_mx, out_r_n);
reg_acc: registro port map(rst, clk, out_r_b(0), acc_mx , out_r_acc);

  -----------------------------------------------------------------------------
  -- Registro de desplazamiento a izquierda
  -----------------------------------------------------------------------------
  desp_a: des_izq port map(rst, clk, out_r_a, a_des);
  -----------------------------------------------------------------------------
  -- Contador. Observad que la senal cntr esta definida como unsigned luego no
  -- es necesario hacer casting pues el operador "-" entiende la resta de un
  -- unsigned menos 1.
  -----------------------------------------------------------------------------


  ----------------------------------------------------------------------------
  -- Comparador con cero
  -----------------------------------------------------------------------------
  p_cmp : process (resta) is
  begin
    if resta = "0000" then
      zero <= '1';
    else
      zero <= '0';
    end if;
  end process p_cmp;

  -----------------------------------------------------------------------------
  -- Sumador/restador
  -----------------------------------------------------------------------------
sum: sumador port map(out_r_acc, out_r_a, suma);
rest: restador port map(out_r_n, "0001",resta);
  -----------------------------------------------------------------------------
  -- Multiplexor
  -----------------------------------------------------------------------------
  mux_b: multiplexor port map(b, b_des, mx_b, b_mx);
  mux_a: multiplexor port map(a, a_des, mx_a, a_mx);
  mux_n: multiplexor port map(n,resta, mx_n, n_mx);
  mux_acc: multiplexor port map("0000",suma(3 downto 0), mx_acc ,acc_mx);
end rtl;