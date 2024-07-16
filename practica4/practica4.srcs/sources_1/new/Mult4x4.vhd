library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Mult4x4 is
  port (clk   : in  std_logic;
        rst : in  std_logic;
        ini   : in  std_logic;
        a  : in  std_logic_vector(3 downto 0);
        b  : in  std_logic_vector(3 downto 0);
        n  : in  std_logic_vector(3 downto 0);
        mult: out std_logic_vector(7 downto 0);
        ready : out std_logic
        );
end Mult4x4;

architecture struct of Mult4x4 is
component debouncer is
  port (
    rst             : in  std_logic;
    clk             : in  std_logic;
    x               : in  std_logic;
    xDeb            : out std_logic;
    xDebFallingEdge : out std_logic;
    xDebRisingEdge  : out std_logic
    );
end component;
  component CD is
    port (
   clk    : in  std_logic;                    -- clock
    rst  : in  std_logic;                      -- reset
    b   : in  std_logic_vector(3 downto 0);   
    a   : in  std_logic_vector(3 downto 0);   
    n    : in std_logic_vector(3 downto 0);   
    ctrl   : in  std_logic_vector(8 downto 0);   -- Control
    mult: out std_logic_vector(7 downto 0);
    status : out std_logic_vector(1 downto 0));  -- Status
  end component cd;

  component uc is
    port (
      clk: in std_logic;
  rst: in std_logic;
  ini: in std_logic;
  fin: out std_logic;
  ctrl: out std_logic_vector(8 downto 0);   -- Control vector
  status: in  std_logic_vector(1 downto 0));  -- Status vector

  end component uc;
  component displays is
    Port ( 
        rst : in STD_LOGIC;
        clk : in STD_LOGIC;       
        digito_0 : in  STD_LOGIC_VECTOR (3 downto 0);
        digito_1 : in  STD_LOGIC_VECTOR (3 downto 0);
        digito_2 : in  STD_LOGIC_VECTOR (3 downto 0);
        digito_3 : in  STD_LOGIC_VECTOR (3 downto 0);
        display : out  STD_LOGIC_VECTOR (6 downto 0);
        display_enable : out  STD_LOGIC_VECTOR (3 downto 0)
     );
end component;
  signal w,t, xDebFE: std_logic;
  signal ctrl   : std_logic_vector(8 downto 0);  -- Control vector
  signal status : std_logic_vector(1 downto 0);  --Status vector
begin
  --deb: debouncer port map(clk, rst, ini, w, xDebFE, t);
  
  i_cd : cd port map (
    clk    => clk,
    rst  => rst,
    b   => b,
    a   => a,
    n    => n,
    mult => mult,
    ctrl   => ctrl,
    status => status);
    
    i_uc : uc port map (
    clk    => clk,
    rst  => rst,
    ini    => xDebFE,
    fin    => ready,
    ctrl   => ctrl,
    status => status);
--disp: displays port map(rst, clk);
end struct;
