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
    signal sdataout , sdatain: std_logic;
begin
    dataout <= '1' when pr = '0' else '0' when clr = '0' else sdataout;
    sdatain <= sdataout when carga = '0' else datain;
    u_reg : fftd port map(sdatain, clk, pr, clr, sdataout);
    

end architecture reg;