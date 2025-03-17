-----------------------------NOP--------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity NOP is
    port(
        c : in std_logic_vector(2 downto 0);
        s : out std_logic_vector(10 downto 0)
    );
end entity;

architecture doNOP of NOP is

begin
    s(0) <= '1';
    s(1) <= '1';
    s(4 downto 2) <= "000";
    s(5) <= not c(2) and not c(1) and c(0);
    s(6) <= '0';
    s(7) <= '0';
    s(8) <= not c(2) and not c(1) and not c(0);
    s(9) <= not c(2) and not c(1) and c(0);
    s(10) <= not c(2) and c(1) and not c(0); 

end architecture;
--------------------------STA-------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity STA is
    port(
        c : in std_logic_vector(2 downto 0);
        s : out std_logic_vector(10 downto 0)
    );
end entity;

architecture doSTA of STA is

begin
    s(0) <= '1';
    s(1) <= not(c(2)) or c(1) or not(c(0));
    s(4 downto 2) <= "000";
    s(5) <= not c(1) and (c(2) xor c(0));
    s(6) <= '0';
    s(7) <= not c(2) and not c(1) and c(0);
    s(8) <= (not c(1) and (c(2) xnor c(0))) or (not c(2) and c(1) and c(0));
    s(9) <= not c(1) and (c(2) xor c(0));
    s(10) <= not c(2) and c(1) and not c(0);  

end architecture;
------------------------------LDA-----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LDA is
    port(
        c : in std_logic_vector(2 downto 0);
        s : out std_logic_vector(10 downto 0)
    );
end entity;

architecture doLDA of LDA is

begin
    s(0) <= '1';
    s(1) <= not(c(2)) or c(1) or not(c(0));
    s(4 downto 2) <= "000";
    s(5) <= not c(1) and (c(2) xor c(0));
    s(6) <= c(2) and c(1) and c(0);
    s(7) <= '0';
    s(8) <= (not c(1) and (c(2) xnor c(0))) or (not c(2) and c(1) and c(0));
    s(9) <= (c(2) and not c(0)) or (not c(2) and not c(1) and c(0));
    s(10) <= not c(2) and c(1) and not c(0);  

end architecture;
---------------------------NOT----------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity NNOT is
    port(
        c : in std_logic_vector(2 downto 0);
        s : out std_logic_vector(10 downto 0)
    );
end entity;

architecture doNOT of NNOT  is

begin
    s(0) <= '1';
    s(1) <= '1';
    s(4 downto 2) <= "100";
    s(5) <= not c(2) and not c(1) and c(0);
    s(6) <= c(2) and c(1) and c(0);
    s(7) <= '0';
    s(8) <= not c(2) and not c(1) and not c(0);
    s(9) <= not c(2) and not c(1) and c(0);
    s(10) <= not c(2) and c(1) and not c(0);  

end architecture;
--------------------------ADD----------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ADD is
    port(
        c : in std_logic_vector(2 downto 0);
        s : out std_logic_vector(10 downto 0)
    );
end entity;

architecture doADD of ADD is

begin
    s(0) <= '1';
    s(1) <= not(c(2)) or c(1) or not(c(0));
    s(4 downto 2) <= "001";
    s(5) <= not c(1) and (c(2) xor c(0));
    s(6) <= c(2) and c(1) and c(0);
    s(7) <= '0';
    s(8) <= (not c(1) and (c(2) xnor c(0))) or (not c(2) and c(1) and c(0));
    s(9) <= (c(2) and not c(0)) or (not c(2) and not c(1) and c(0));
    s(10) <= not c(2) and c(1) and not c(0);
end architecture;
-------------------------OR---------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity OOR is
    port(
        c : in std_logic_vector(2 downto 0);
        s : out std_logic_vector(10 downto 0)
    );
end entity;

architecture doOR of OOR is

begin
    s(0) <= '1';
    s(1) <= not(c(2)) or c(1) or not(c(0));
    s(4 downto 2) <= "010";
    s(5) <= not c(1) and (c(2) xor c(0));
    s(6) <= c(2) and c(1) and c(0);
    s(7) <= '0';
    s(8) <= (not c(1) and (c(2) xnor c(0))) or (not c(2) and c(1) and c(0));
    s(9) <= (c(2) and not c(0)) or (not c(2) and not c(1) and c(0));
    s(10) <= not c(2) and c(1) and not c(0);
end architecture;
----------------------------AND----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AAND is
    port(
        c : in std_logic_vector(2 downto 0);
        s : out std_logic_vector(10 downto 0)
    );
end entity;

architecture doAND of AAND is

begin
    s(0) <= '1';
    s(1) <= not(c(2)) or c(1) or not(c(0));
    s(4 downto 2) <= "011";
    s(5) <= not c(1) and (c(2) xor c(0));
    s(6) <= c(2) and c(1) and c(0);
    s(7) <= '0';
    s(8) <= (not c(1) and (c(2) xnor c(0))) or (not c(2) and c(1) and c(0));
    s(9) <= (c(2) and not c(0)) or (not c(2) and not c(1) and c(0));
    s(10) <= not c(2) and c(1) and not c(0);
end architecture;
-------------------------JMP-----------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity JMP is
    port(
        c : in std_logic_vector(2 downto 0);
        s : out std_logic_vector(10 downto 0)
    );
end entity;

architecture doJMP of JMP is

begin
    s(0) <= not c(2) or c(1) or not c(0);
    s(1) <= '1';
    s(4 downto 2) <= "000";
    s(5) <= not c(1) and c(0);
    s(6) <= '0';
    s(7) <= '0';
    s(8) <= not c(2) and (c(1) xnor c(0));
    s(9) <= not c(1) and (c(2) xor c(0));
    s(10) <= not c(2) and c(1) and not c(0);
end architecture;
-----------------------JN----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity JN is
    port(
        c : in std_logic_vector(2 downto 0);
        s : out std_logic_vector(10 downto 0);
        flagsNZ : in std_logic_vector(1 downto 0)
    );
end entity;

architecture doJN of JN is

    component JMP is
        port(
        c : in std_logic_vector(2 downto 0);
        s : out std_logic_vector(10 downto 0)
    );
    end component;
    signal sJMP : std_logic_vector(10 downto 0);
begin
    s(0) <= '1';
    s(1) <= '1';
    s(4 downto 2) <= "000";
    s(5) <= not c(2) and c(0);
    s(6) <= '0';
    s(7) <= '0';
    s(8) <= not c(2) and not c(1) and not c(0);
    s(9) <= not c(2) and not c(1) and c(0);
    s(10) <= not c(2) and c(1) and not c(0);

    u_JMP : JMP port map(c, sJMP);
    s <= sJMP when flagsNZ(1) = '1';
end architecture;
--------------------------------JZ-------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity JZ is
    port(
        c : in std_logic_vector(2 downto 0);
        s : out std_logic_vector(10 downto 0);
        flagsNZ : in std_logic_vector(1 downto 0)
    );
end entity;

architecture doJZ of JZ is

    component JMP is
        port(
        c : in std_logic_vector(2 downto 0);
        s : out std_logic_vector(10 downto 0)
    );
    end component;
    signal sJMP : std_logic_vector(10 downto 0);
begin
    s(0) <= '1';
    s(1) <= '1';
    s(4 downto 2) <= "000";
    s(5) <= not c(2) and c(0);
    s(6) <= '0';
    s(7) <= '0';
    s(8) <= not c(2) and not c(1) and not c(0);
    s(9) <= not c(2) and not c(1) and c(0);
    s(10) <= not c(2) and c(1) and not c(0);

    u_JMP : JMP port map(c, sJMP);
    s <= sJMP when flagsNZ(0) = '1';
end architecture;
----------------------HLT--------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity HLT is
    port(
        c : in std_logic_vector(2 downto 0);
        s : out std_logic_vector(10 downto 0)
    );
end entity;

architecture doHLT of HLT is

begin
    s(0) <= '0';
    s(1) <= '0';
    s(4 downto 2) <= "000";
    s(5) <= '0';
    s(6) <= '0';
    s(7) <= '0';
    s(8) <= '0';
    s(9) <= '0';
    s(10) <= '0';

end architecture;