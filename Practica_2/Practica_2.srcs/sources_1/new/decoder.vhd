----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.10.2020 11:23:50
-- Design Name: 
-- Module Name: decoder - Behavioral
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

entity decoder is
port ( 
xDebFE : in std_logic;
clk: in std_logic;
rst: in std_logic;
code: in std_logic_vector(7 downto 0);
try_res: out std_logic_vector(3 downto 0);
led_res: out std_logic_vector(9 downto 0)
);
end decoder;

architecture rtl of decoder is
type estado_t is(s0,s1,s2,s3,s4);
signal estado_actual, estado_siguiente: estado_t;
signal eq : std_logic;
signal codigo: std_logic_vector(7 downto 0);
begin
SINCRONO: process(clk,rst,xDebFE)
begin
 if rst ='1' then
 estado_actual<=s0;
 elsif (rising_edge(clk) and xDebFE='1') then
 estado_actual <= estado_siguiente;
 end if;
end process SINCRONO;
comp: process (code)
begin
if  (codigo = code) then
        eq <= '1';
    else
        eq <= '0';
    end if;
end process;

intentos : process(estado_actual)
begin

case estado_actual is
    when s0 =>
            codigo <= code;
            led_res <= "1111111111";
            estado_siguiente <= s1;
    when s1 =>
           try_res <= "0011";
           led_res <= "0000000000";
        if (eq = '0') then 
            estado_siguiente <= s2;
        elsif (eq = '1') then
            estado_siguiente <= s0;
        end if;
     when s2 =>
            try_res <= "0010";
            led_res <= "0000000000";
        if (eq = '0') then
            estado_siguiente <= s3;
        elsif (eq = '1') then
            estado_siguiente <= s0;
        end if;
     when s3 =>
            try_res <= "0001";
            led_res <= "0000000000";
        if (eq = '0') then
            estado_siguiente <= s4;
        elsif (eq = '1') then
            estado_siguiente <= s0;
        end if; 
     when s4 =>
            try_res <= "0000";
            led_res <= "0000000000";

end case;
end process intentos;
end rtl;
