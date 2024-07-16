----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.10.2020 12:35:42
-- Design Name: 
-- Module Name: code - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity code is
 port (
 codein: in std_logic_vector(7 downto 0);
 rst : in std_logic;
 clk : in  std_logic;
 load : in std_logic;
 trys_leds: out std_logic_vector (6 downto 0);
 coderesult: out std_logic_vector(9 downto 0) );--leds
end code;

architecture Behavioral of code is

component debouncer is 
 port (
    rst             : in  std_logic;
    clk             : in  std_logic;
    x               : in  std_logic;
    xDeb            : out std_logic;
    xDebFallingEdge : out std_logic;
    xDebRisingEdge  : out std_logic
    );
end component debouncer;
component conv_7seg is
  port (
        x : in  std_logic_vector (3 downto 0);
        display : out std_logic_vector (6 downto 0));
end component conv_7seg;
component decoder is
port(
    xDebFE : in std_logic;
    clk: in std_logic;
    rst: std_logic;
    code: in std_logic_vector(7 downto 0);
    try_res: out std_logic_vector(3 downto 0);
    led_res: out std_logic_vector(9 downto 0)
);
end component decoder;
signal a: std_logic;
signal b: std_logic;
signal c: std_logic;
signal d: std_logic_vector(3 downto 0);
begin

deb: debouncer PORT MAP(
rst => rst,
clk => clk,
x => load,
xDeb => a,
xDebFallingEdge => c,
xDebRisingEdge => b
);
dec: decoder PORT MAP(
    xDebFE => c,
    clk => clk,
    rst =>rst,
    code => codein,
    try_res => d,
    led_res => coderesult
);
conv: conv_7seg PORT MAP(
    x => d,
    display => trys_leds
);


end architecture Behavioral;
