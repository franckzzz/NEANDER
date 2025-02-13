library ieee;
use ieee.std_logic_1164.all;

entity tb_fftd is

end tb_fftd;

architecture tb_flipflop of tb_fftd is

    constant CLK_PERIOD : time := 20 ns;

    component fftd is
        port(

            d      : in std_logic;
            clk    : in std_logic;
            pr, cl : in std_logic;
            q, nq  : out std_logic

        );
    end component fftd;

    signal sd, spr, scl, sq, snq : std_logic;
    signal sclk : std_logic := '1';

begin 

    u1 : fftd

    port map(sd, sclk, spr, scl, sq, snq);

    tbp : process

    begin
        scl <= '1';
        spr <= '1';
        sd  <= '0';
        wait for CLK_PERIOD;
        
        scl <= '0';
        wait for CLK_PERIOD;

        scl <= '1';
        wait for CLK_PERIOD;
        
        spr <= '0';
        wait for CLK_PERIOD;

        spr <= '1';
        wait for CLK_PERIOD;

        sd  <= '1';
        wait for CLK_PERIOD;
        
        sd  <= '0';
        wait for CLK_PERIOD;
        
        sd  <= '1';
        wait for CLK_PERIOD;
        
        wait;

    end process tbp;

    clock : process 

    begin

        sclk <= not(sclk);
        wait for CLK_PERIOD/2;

    end process clock;

end architecture tb_flipflop;

        