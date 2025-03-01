library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LDA is
    port(
        c : in std_logic_vector(2 downto 0);
        s : out std_logic_vector(10 downto 0);
    );
end entity;

architecture doLDA of LDA is

begin
    s(0) <= '1';
    s(1) <= not(c(2)) or c(1) or not(c(0));
    s(4 downto 2) <= "000";
    s(5) <= not c(1) and (c(2) xor c(0));
    s(6) <= c(2) or c(1) or c(0);
    s(7) <= '0';
    s(8) <= (not c(1) and (c(2) xnor c(0))) or (not c(2) and c(1) and c(0));
    s(9) <= (c(2) and not c(0)) or (not c(2) and not c(1) and c(0));
    s(10) <= not c(2) and c(1) and not c(0);  

end architecture;