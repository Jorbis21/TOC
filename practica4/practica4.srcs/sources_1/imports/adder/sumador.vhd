library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sumador is
  Port (
    X : IN   std_logic_vector(3 downto 0);
    Y : IN   std_logic_vector(3 downto 0);
    Z : OUT  std_logic_vector(7 downto 0));
end sumador;

architecture Behavioral of sumador is

begin
    Z(3 downto 0) <= X + Y;
end Behavioral;
