library ieee;
use ieee.std_logic_1164.all;

entity contador is
    port (
        clock, reset : in std_logic;
        c                : out std_logic_vector (2 downto 0)
    );
end entity;

architecture Contador of contador is

component controle is
    port (
        q : in  std_logic_vector (2 downto 0);
        reset : in std_logic;
        j, k : out std_logic_vector (2 downto 0)
    );
end component;

component ffjk is
    port(
        j, k   : in std_logic;
        clk  : in std_logic;
        pr, cl : in std_logic;
        q, nq  : out std_logic
        );
end component;


signal sj, sk : std_logic_vector (2 downto 0);
signal sq , snq   : std_logic_vector (2 downto 0);
signal vcc : std_logic := '1';

begin

    u_ffjk2 : ffjk port map (sj(2), sk(2), clock, vcc, reset, sq(2), snq(2));
    u_ffjk1 : ffjk port map (sj(1), sk(1), clock, vcc, reset, sq(1), snq(1));
    u_ffjk0 : ffjk port map (sj(0), sk(0), clock, vcc, reset, sq(0), snq(0));

    u_controle : controle port map (sq, reset, sj, sk);

    c <= sq;

end architecture;