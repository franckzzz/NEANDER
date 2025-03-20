library ieee;
use ieee.std_logic_1164.all;

entity controle is
    port (
        q       : in  std_logic_vector (2 downto 0);
        reset : in std_logic;       
        j, k : out std_logic_vector (2 downto 0)
    );
end entity;

architecture controlar of controle is

    begin

        j(0) <= '1' when reset = '1' else '0';
        k(0) <= '1' when reset = '1' else '0';

        j(1) <= q(0) when reset = '1' else '0';
        k(1) <= q(0) when reset = '1' else '0';

        j(2) <= q(1) and q(0) when reset = '1' else '0';
        k(2) <= q(1) and q(0) when reset = '1' else '0';
end architecture controlar;