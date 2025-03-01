-- neander módulo secundario UC-PC ==================================
library IEEE;
use IEEE.std_logic_1164.all;

entity moduloPC is
	port(
        rst, clk   : in  std_logic;
        PC_nrw     : in  std_logic;
        nbarrINC   : in    std_logic;
        barramento : in  std_logic_vector(7 downto 0);
	    endereco   : out std_logic_vector(7 downto 0)
	);
end entity moduloPC;

architecture dopointstuff of moduloPC is

    -- componente regPC
    component reg8bit is 
        port (
        datain : in std_logic_vector(7 downto 0);
        clk : in std_logic;
        pr : in std_logic;
        clr : in std_logic;
        carga : in std_logic;
        dataout : out std_logic_vector(7 downto 0)
    );
    end component;

    -- componente mux2x8

    -- somador 8 bits
    component somador8bit is
        port (
            a    : in std_logic_vector(7 downto 0);
            b    : in std_logic_vector(7 downto 0);
            cin  : in std_logic;
            cout : out std_logic;
            s    : out std_logic_vector(7 downto 0)
        );
    end component;

    signal sendereco, s_mux2pc : std_logic_vector(7 downto 0) := (others => 'Z');
    signal sadd, x, y          : std_logic_vector(7 downto 0) := (others => 'Z');
    signal s_um                : std_logic_vector(7 downto 0) := "00000001";
    signal saddc               : std_logic;

begin

    -- registrador PC
    u_regPC : reg8bit port map (s_mux2pc, clk, '1', rst, PC_nrw, sendereco);


    -- incrementador
    x <= sendereco;
    y <= "00000001";

    -- ADDER
    u_somador : somador8bit port map (x, y, '0', saddc, sadd);

    -- mux2x8
    s_mux2pc <= sadd when nbarrINC = '1' else barramento;

end architecture dopointstuff;
