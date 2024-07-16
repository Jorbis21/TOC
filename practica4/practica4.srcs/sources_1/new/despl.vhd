----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.12.2020 18:37:29
-- Design Name: 
-- Module Name: despl - rtl
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

entity despl is
 Port ( 
 rst: in std_logic;
 clk: in std_logic;
 ctrl: in std_logic;
 num: in std_logic_vector(3 downto 0);
 num_out: out std_logic_vector(3 downto 0)
 );
end despl;

architecture rtl of despl is
begin
REG_DESP : process(clk, rst, ctrl)
begin
    if rst = '1' then
        num_out <= "0000";
    elsif rising_edge(clk) then
        if ctrl = '1' then
            num_out(2 downto 0) <= num(3 downto 1);
            num_out(3) <= '0';
        elsif ctrl = '0' then
            num_out(3 downto 1) <= num(2 downto 0);
            num_out(0) <= '0';
        end if;
    end if;
end process;
end rtl;