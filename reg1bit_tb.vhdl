library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity reg1bit_tb is
end reg1bit_tb;

architecture tb of reg1bit_tb is

    constant CLK_PERIOD : time := 20 ns;

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
    signal sclk : std_logic := '1';
    signal spr, sclr, scarga : std_logic;
    signal sdatain, sdataout : std_logic;
    
begin
    u_reg1bit: reg1bit port map(sdatain, sclk, spr, sclr, scarga, sdataout);
    u_tb : process 
    begin 
        sdatain <= '1';
        spr <= '1';
        sclr <= '0';
        scarga <= '0';
        wait for CLK_PERIOD;

        sdatain <= '1';
        spr <= '0';
        sclr <= '1';
        scarga <= '1';
        wait for CLK_PERIOD;

        sdatain <= '1';
        spr <= '1';
        sclr <= '1';
        scarga <= '0';
        wait for CLK_PERIOD;

        sdatain <= '1';
        scarga <= '1';
        wait for CLK_PERIOD;

        sdatain <= '0';
        scarga <= '1';
        wait for CLK_PERIOD;

        sdatain <= '1';
        scarga <= '0';
        wait for CLK_PERIOD;

        sdatain <= '1';
        scarga <= '1';
        wait for CLK_PERIOD;

        wait;
    
    end process u_tb;

    clock : process 

    begin

        sclk <= not(sclk);
        wait for CLK_PERIOD/2;

    end process clock;
    
end architecture tb;