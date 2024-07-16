----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.11.2020 12:43:18
-- Design Name: 
-- Module Name: contador - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity contador is
port (
clk : IN std_logic;
boton : IN std_logic;
salida : OUT std_logic_vector(3 downto 0)
);
end;

architecture Behavioral of contador is

component sumador is
  Port (
    A : IN   std_logic_vector(3 downto 0);
    B : IN   std_logic_vector(3 downto 0);
    C : OUT  std_logic_vector(3 downto 0)
  );
end component;

SIGNAL E :  std_logic_vector(3 downto 0);
SIGNAL SR :  std_logic_vector(3 downto 0);

begin
mod_s: sumador port map (E,"0001" , SR);

process(clk, boton)
  begin
       if rising_edge(clk)then
       if(boton = '1') then
       salida <=E;
       else
       
        end if;
  end process;





end Behavioral;
