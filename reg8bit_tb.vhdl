library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity reg8bit_tb is
end reg8bit_tb;

architecture tb of reg8bit_tb is
    constant CLK_PERIOD : time := 20 ns;
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
    signal sclk : std_logic := '1';
    signal spr, sclr, scarga : std_logic;
    signal sdatain, sdataout : std_logic_vector(7 downto 0);
    
begin
    u_reg8bit: reg8bit port map(sdatain, sclk, spr, sclr, scarga, sdataout);
    u_tb : process 
    begin 
        sdatain <= "10010011";
        spr <= '1';
        sclr <= '0';
        scarga <= '0';
        wait for CLK_PERIOD;

        sdatain <= "10010011";
        spr <= '0';
        sclr <= '1';
        scarga <= '1';
        wait for CLK_PERIOD;

        sdatain <= "10010011";
        spr <= '1';
        sclr <= '1';
        scarga <= '0';
        wait for CLK_PERIOD;

        sdatain <= "10010011";
        scarga <= '1';
        wait for CLK_PERIOD;

        sdatain <= "11111111";
        scarga <= '1';
        wait for CLK_PERIOD;

        sdatain <= "10010011";
        scarga <= '0';
        wait for CLK_PERIOD;

        sdatain <= "01010101";
        scarga <= '1';
        wait for CLK_PERIOD;

        wait;
    
    end process u_tb;

end architecture tb;