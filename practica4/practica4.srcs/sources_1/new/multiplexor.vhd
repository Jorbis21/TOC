----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2020 00:01:15
-- Design Name: 
-- Module Name: multiplexor - rtl
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplexor is
  Port ( 
  a: in std_logic_vector(3 downto 0);
  b: in std_logic_vector(3 downto 0);
  sel: in std_logic;
  c: out std_logic_vector(3 downto 0)
  );
end multiplexor;

architecture rtl of multiplexor is

begin

    mx: process(sel) is
    begin
        if sel = '0' then
            c <= a;
        else
            c <= b;
        end if;
    end process;
    
end rtl;
