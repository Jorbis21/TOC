----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.11.2020 12:02:10
-- Design Name: 
-- Module Name: Mult_adders - rtl
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values


-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mult_adders is
port(
X : in std_logic_vector(3 downto 0);
Y : in std_logic_vector(3 downto 0);
Z : out std_logic_vector(7 downto 0)
);
end Mult_adders;

architecture rtl of Mult_adders is
component adder4b is
    port( a: in std_logic_vector(7 downto 0);
    b: in std_logic_vector(7 downto 0);
    c: out std_logic_vector(7 downto 0) );
end component;
signal X_u1, X_u2, Z_u: std_logic_vector(7 downto 0);
begin
X_u1(7 downto 4) <= X and Y(3 downto 3);
X_u2(6 downto 3) <= X and Y(2 downto 2);
adder1: adder4b PORT MAP(X_u1, X_u2, Z_u);
X_u1 <= "00000000";
X_u1(5 downto 2) <= X and Y(1 downto 1);
X_u2 <= Z_u;
adder2: adder4b PORT MAP(X_u1, X_u2, Z_u);
X_u1 <= "00000000";
X_u1(4 downto 1) <= X and Y(0 downto 0);
X_u2 <= Z_u;
adder3: adder4b PORT MAP(X_u1, X_u2, Z_u);
Z <= Z_u;
end rtl;
