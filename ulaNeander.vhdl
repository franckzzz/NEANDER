-- neander módulo principal ULA ===============================================
library IEEE;
use IEEE.std_logic_1164.all;

entity moduloULA is
	port(
        rst, clk    : in    std_logic;
        AC_nrw      : in    std_logic;
        ula_op      : in    std_logic_vector(2 downto 0);
        MEM_nrw     : in    std_logic;
        flags_nz    : out   std_logic_vector(1 downto 0);
		barramento  : inout std_logic_vector(7 downto 0)
	);
end entity moduloULA;

architecture domathstuff of moduloULA is
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

    component reg2bit is
        port (
            datain : in std_logic_vector(1 downto 0);
            clk : in std_logic;
            pr : in std_logic;
            clr : in std_logic;
            carga : in std_logic;
            dataout : out std_logic_vector(1 downto 0)
        );
    end component;
    component moduloULAinterno is
        port(
            x, y        : in  std_logic_vector(7 downto 0);
            ula_op      : in  std_logic_vector(2 downto 0);
            flags_nz    : out std_logic_vector(1 downto 0);
            s           : out std_logic_vector(7 downto 0)
        );
    end component;  

    signal s_ac2ula, s_ula2ac : std_logic_vector(7 downto 0);
    signal s_ula2flags        : std_logic_vector(1 downto 0);
    signal s_interface_flags  : std_logic_vector(1 downto 0);

begin

    u_registradorAC: reg8bit port map(s_ula2ac, clk, '1', rst, AC_nrw, s_ac2ula);
    u_registradorFlags: reg2bit port map(s_ula2flags, clk, '1', rst, AC_nrw, s_interface_flags);
    u_ulaInterno: moduloULAinterno port map(s_ac2ula, barramento, ula_op, s_ula2flags, s_ula2ac);
    barramento <= s_ac2ula when MEM_nrw='1' else (others => 'Z');
    flags_nz <= s_interface_flags;
    
end architecture domathstuff;

