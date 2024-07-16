LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity contador is
port (
rst : IN std_logic;
clk : IN std_logic;
cuenta : IN std_logic;
salida : OUT std_logic_vector(3 downto 0)
);
end contador;

architecture Behavioral of contador is


SIGNAL X :  std_logic_vector(3 downto 0);
begin
process
begin
if (rst = '1') 
    then X <= "0000";
elsif rising_edge(clk) then
    if (cuenta ='1') then
        if(X >= "1010") then
            X <= "0000";
        else
            X <= X + "0001";
        end if;
    end if;
end if;
salida <= X;
end process;


end Behavioral;