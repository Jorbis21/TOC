library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity mult8b is
port(
X : in std_logic_vector(3 downto 0);
Y : in std_logic_vector(3 downto 0);
Z : out std_logic_vector(7 downto 0)
);
end mult8b;

    
    
    architecture rtl of mult8b is
    signal X_u, Y_u: unsigned(3 downto 0);
    signal Z_u: unsigned(7 downto 0);
    begin
        X_u <= unsigned(X);
        Y_u <= unsigned(Y);
        Z_u <= X_u * Y_u;
        Z <= std_logic_vector(Z_u(7 downto 0));
    end rtl;
