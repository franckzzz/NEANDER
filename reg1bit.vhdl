library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg1bit is
    port(
        datain  : in std_logic;
        clk     : in std_logic;
        pr      : in std_logic;
        clr     : in std_logic;
        carga   : in std_logic;
        dataout : out std_logic
    );
end entity reg1bit;

architecture reg of reg1bit is
    component fftd is    
        port(
        d      : in std_logic;
        clk    : in std_logic;
        pr, cl : in std_logic;
        q, nq  : out std_logic
        );
    end component;
    signal sclk, sclr, spr : std_logic;
    signal sdataout , sndataout, sdatain: std_logic;
begin
    sdatain <= datain when carga = '1' else
               sdataout when carga = '0';
    u_fftd : fftd port map(sdatain, sclk, sclr, spr, sdataout, sndataout);
    dataout <= sdataout;

end architecture reg;