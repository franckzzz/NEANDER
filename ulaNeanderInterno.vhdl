-- neander módulo interno ULA =================================================
library IEEE;
use IEEE.std_logic_1164.all;

entity moduloULAinterno is
	port(
        x, y        : in  std_logic_vector(7 downto 0);
        ula_op      : in  std_logic_vector(2 downto 0);
        flags_nz    : out std_logic_vector(1 downto 0);
        s           : out std_logic_vector(7 downto 0)
	);
end entity;

architecture domathstuff of moduloULAinterno is
    component somador8bit is
        port (
            a : in std_logic_vector(7 downto 0);
            b : in std_logic_vector(7 downto 0);
            cin: in std_logic;
            cout : out std_logic;
            s : out std_logic_vector(7 downto 0)
        );
    end component;

    signal sand, sor, snot, slda, ss : std_logic_vector(7 downto 0);
    signal sadd : std_logic_vector(7 downto 0);
    signal scout : std_logic;
    
begin

    sand(0) <= x(0) and y(0);
    sand(1) <= x(1) and y(1);
    sand(2) <= x(2) and y(2);
    sand(3) <= x(3) and y(3);
    sand(4) <= x(4) and y(4);
    sand(5) <= x(5) and y(5);
    sand(6) <= x(6) and y(6);
    sand(7) <= x(7) and y(7);

    sor(0) <= x(0) or y(0);
    sor(1) <= x(1) or y(1);
    sor(2) <= x(2) or y(2);
    sor(3) <= x(3) or y(3);
    sor(4) <= x(4) or y(4);
    sor(5) <= x(5) or y(5);
    sor(6) <= x(6) or y(6);
    sor(7) <= x(7) or y(7);

    slda <= y;

    snot <= not(x);

    u_somador : somador8bit port map(x, y, '0', scout, sadd);

    ss <= slda when ula_op = "000" else
          sadd when ula_op = "001" else
          sor when ula_op = "010" else
          sand when ula_op = "011" else
          snot when ula_op = "100";

    flags_nz(1) <= ss(7);
    flags_nz(0) <= not(ss(7) or ss(6) or ss(5) or ss(4) or ss(3) or ss(2) or ss(1) or ss(0));
    s <= ss;
end architecture domathstuff;
