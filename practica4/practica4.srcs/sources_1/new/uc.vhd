----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.12.2020 18:36:13
-- Design Name: 
-- Module Name: Mult4x4 - rtl
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

entity uc is
  Port (
  clk: in std_logic;
  rst: in std_logic;
  ini: in std_logic;
  fin: out std_logic;
  ctrl: out std_logic_vector(8 downto 0);   -- Control vector
  status: in  std_logic_vector(1 downto 0));
end uc;

architecture rtl of uc is
type state is (s0, s1, s2, s3, s4);
signal act_st, nxt_st: state;
signal init, b_0: std_logic;
signal n : std_logic_vector(3 downto 0) := "1000";
begin
  p_next_state : process (act_st, init, n, b_0) is
  begin  -- process p_next_state
    case act_st is
      when s0 =>
        if init = '1' then
          nxt_st <= s1;
        else
          nxt_st <= s0;
        end if;
      when s1 =>
        if n = "0000" then
        nxt_st <= s0;
        else 
            if b_0 = '1' then
            nxt_st <= s2;
            else
            nxt_st <= s3;
            end if;
        end if;
      when s2 =>
        nxt_st <= s1;
      when s3 =>
        nxt_st <= s1;
      when others => null;
    end case;
  end process p_next_state;
  
 p_outputs : process (act_st)
    ---------------------------------------------------------------------------
    -- Definición de cada uno de las senales de control
    -- mux -----------------------------------------------------------¡
    -- coc_sh -------------------------------------------------------¡¡
    -- coc_ld ------------------------------------------------------¡¡¡
    -- dndo_ld ----------------------------------------------------vvvv
    constant mx_b  : std_logic_vector(8 downto 0) := "100000000";
    constant mx_acc: std_logic_vector(8 downto 0) := "010000000";
    constant mx_a  : std_logic_vector(8 downto 0) := "001000000";
    constant mx_n  : std_logic_vector(8 downto 0) := "000100000";
    constant r_b   : std_logic_vector(8 downto 0) := "000010000";
    constant r_a   : std_logic_vector(8 downto 0) := "000001000";
    constant r_n   : std_logic_vector(8 downto 0) := "000000100";
    constant des_b : std_logic_vector(8 downto 0) := "000000010";
    constant des_a : std_logic_vector(8 downto 0) := "000000001";
    --constant done  : std_logic_vector(9 downto 0) := "0000000001";

  begin
    ctrl <= (others => '0');
    case act_st is
      when s0 =>
        ctrl <= (others => '0');
        fin  <= '1';
      when s1 =>
        ctrl <= r_b or r_a or r_n;
        fin <= '0';
      when s2 =>
        ctrl <= mx_b or mx_acc or mx_a or mx_n or r_b or r_a or r_n or des_b or des_a;
        fin <= '0';
      when s3 =>
      ctrl <= mx_b or mx_acc or mx_a or mx_n or r_b or r_a or r_n or des_b or des_a;
        fin <= '0';
      when others => null;
    end case;
  end process p_outputs;
  
 p_status_reg : process (clk, rst) is
  begin
    if rst = '0' then
      act_st <= s0;
    elsif rising_edge(clk) then
      act_st <= nxt_st;
    end if;
  end process p_status_reg;
end rtl;