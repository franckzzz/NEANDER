library ieee;
use ieee.std_logic_1164.all;

entity ffjk is
    port(
        j, k   : in std_logic;
        clk    : in std_logic;
        pr, cl : in std_logic;
        q, nq  : out std_logic
    );
end entity ffjk;

architecture flipflop of ffjk is

    signal s_snj , s_snk    : std_logic;
    signal s_sns , s_snr    : std_logic;
    signal s_sns2 , s_snr2  : std_logic;
    signal s_eloS , s_eloR  : std_logic;
    signal s_eloQ , s_elonQ : std_logic;
    signal s_nClock         : std_logic;

begin 

    s_nClock  <= not(clk);
    s_snj     <= not(j and clk and s_elonQ); 
    s_snk     <= not(k and clk and s_eloQ);
    s_sns     <= not(pr and s_snj and s_eloR);
    s_snr     <= not(cl and s_snk and s_eloS);
    s_sns2    <= not(s_sns and s_nClock);
    s_snr2    <= not(s_snr and s_nClock);
    s_eloS    <= not(s_snj and pr and s_eloR);
    s_eloR    <= not(s_snk and cl and s_eloS);
    s_eloQ    <= not(pr and s_sns2 and s_elonQ);
    s_elonQ   <= not(cl and s_snr2 and s_eloQ);

    q  <= s_eloQ;
    nq <= s_elonQ;

end architecture flipflop;