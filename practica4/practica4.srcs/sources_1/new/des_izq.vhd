library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity des_izq is
 Port ( 
 rst: in std_logic;
 clk: in std_logic;
 num: in std_logic_vector(3 downto 0);
 num_out: out std_logic_vector(3 downto 0)
 );
end des_izq;

architecture rtl of des_izq is
begin
REG_DESP : process(clk, rst)
begin
    if rst = '1' then
        num_out <= "0000";
    elsif rising_edge(clk) then
        num_out(3 downto 1) <= num(2 downto 0);
        num_out(0) <= '0';
    end if;
end process;
end rtl;