----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2020 12:22:48
-- Design Name: 
-- Module Name: des_der - Behaviorartl
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

entity des_der is
 Port ( 
 rst: in std_logic;
 clk: in std_logic;
 num: in std_logic_vector(3 downto 0);
 num_out: out std_logic_vector(3 downto 0)
 );
end des_der;

architecture rtl of des_der is
begin
REG_DESP : process(clk, rst)
begin
    if rst = '1' then
        num_out <= "0000";
    elsif rising_edge(clk) then
        num_out(2 downto 0) <= num(3 downto 1);
        num_out(3) <= '0';
    end if;
end process;
end rtl;