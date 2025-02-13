library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg8bit is
    port (
        datain : in std_logic_vector(7 downto 0);
        clk : in std_logic;
        pr : in std_logic;
        clr : in std_logic;
        carga : in std_logic;
        dataout : out std_logic_vector(7 downto 0)
    );
end reg8bit;

architecture reg of reg8bit is
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
    signal sclk, sclr, spr, scarga: std_logic;

begin
    u_reg0 : reg1bit port map(datain(0), sclk, spr, sclr, scarga, dataout(0));
    u_reg1 : reg1bit port map(datain(1), sclk, spr, sclr, scarga, dataout(1));
    u_reg2 : reg1bit port map(datain(2), sclk, spr, sclr, scarga, dataout(2));
    u_reg3 : reg1bit port map(datain(3), sclk, spr, sclr, scarga, dataout(3));
    u_reg4 : reg1bit port map(datain(4), sclk, spr, sclr, scarga, dataout(4));
    u_reg5 : reg1bit port map(datain(5), sclk, spr, sclr, scarga, dataout(5));
    u_reg6 : reg1bit port map(datain(6), sclk, spr, sclr, scarga, dataout(6));
    u_reg7 : reg1bit port map(datain(7), sclk, spr, sclr, scarga, dataout(7));
end architecture;