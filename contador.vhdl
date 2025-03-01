library ieee;
use ieee.std_logic_1164.all;

entity contador is
    port (
        clock, pr, reset : in std_logic;
        c                : out std_logic_vector (2 downto 0)
    );
end entity;

architecture Contador of contador is

component controle is
    port (
        q    : in  std_logic_vector (2 downto 0);
        j, k : out std_logic_vector (2 downto 0)
    );
end component;

component ffjk is
    port(
        j, k   : in std_logic;
        clock  : in std_logic;
        pr, cl : in std_logic;
        q, nq  : out std_logic
        );
end component;

signal sj, sk : std_logic_vector (2 downto 0);
signal sq     : std_logic_vector (2 downto 0);

begin

    u_controle : controle port map (sq, sj, sk);

    u_ffjk2 : ffjk port map (sj(2), sk(2), clock, pr, reset, sq(2));
    u_ffjk1 : ffjk port map (sj(1), sk(1), clock, pr, reset, sq(1));
    u_ffjk0 : ffjk port map (sj(0), sk(0), clock, pr, reset, sq(0));

    c <= sq;

end architecture;