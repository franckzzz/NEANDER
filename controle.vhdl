library ieee;
use ieee.std_logic_1164.all;

entity controle is
    port (
        q    : in  std_logic_vector (2 downto 0);
        j, k : out std_logic_vector (2 downto 0)
    );
end entity;

architecture controlar of controle is

    begin

        j(0) <= '1';
        k(0) <= (not q(2)) and q(1);

        j(1) <= q(0);
        k(1) <= (not q(0)) or q(2);

        j(2) <= q(1) and (not q(0));
        k(2) <= (not q(0)) or q(1);
end architecture controlar;