library IEEE;
use IEEE.std_logic_1164.all;

entity multiplex is
    port (
        salidaMux : out std_logic_vector(15 downto 0);
        entradaMux : in std_logic_vector (1 downto 0);
        a0, a1, a2, a3 :  in std_logic_vector(15 downto 0)
    );
end entity;

architecture behavioral of multiplex is
begin
    
    salidaMux <= a0 when entradaMux = "00" else
        a1 when entradaMux = "01" else
        a2 when entradaMux = "10" else
        a3 when entradaMux = "11";

end Behavioral;
