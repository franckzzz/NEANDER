library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg2bit is
    port (
        datain : in std_logic_vector(1 downto 0);
        clk : in std_logic;
        pr : in std_logic;
        clr : in std_logic;
        carga : in std_logic;
        dataout : out std_logic_vector(1 downto 0)
    );
end reg2bit;

architecture reg of reg2bit is
    component reg1bit is    
        port (
        datain : in std_logic;
        clk : in std_logic;
        pr : in std_logic;
        clr : in std_logic;
        carga : in std_logic;
        dataout : out std_logic
    );
    end component;

begin
    u_reg0 : reg1bit port map(datain(0), clk, pr, clr, carga, dataout(0));
    u_reg1 : reg1bit port map(datain(1), clk, pr, clr, carga, dataout(1));
    
end architecture;