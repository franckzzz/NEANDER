library ieee;
use ieee.std_logic_1164.all;

entity Neander is
    port (
        clk : in std_logic;
        rst : in std_logic
    );
end entity Neander;

architecture docomputingstuff of Neander is
    component moduloMEM is
        port(
            rst, clk   : in    std_logic;
            nbarrPC    : in    std_logic;
            REM_nrw    : in    std_logic;
            MEM_nrw    : in    std_logic;
            RDM_nrw    : in    std_logic;
            end_PC     : in    std_logic_vector(7 downto 0);       
            end_Barr   : in    std_logic_vector(7 downto 0);
            barramento : inout std_logic_vector(7 downto 0)
	);
    end component;

    component moduloULA is
        port(
            rst, clk    : in    std_logic;
            AC_nrw      : in    std_logic;
            ula_op      : in    std_logic_vector(2 downto 0);
            MEM_nrw     : in    std_logic;
            flags_nz    : out   std_logic_vector(1 downto 0);
            barramento  : inout std_logic_vector(7 downto 0)
        );
    end component;

    component moduloPC is
        port(
            rst, clk   : in  std_logic;
            PC_nrw     : in  std_logic;
            nbarrINC   : in    std_logic;
            barramento : in  std_logic_vector(7 downto 0);
	        endereco   : out std_logic_vector(7 downto 0)
	    );
    end component;

    component moduloUC is
        port(
            rst, clk   : in  std_logic;
            barramento : in  std_logic_vector(7 downto 0);
            RI_nrw     : in  std_logic;
            flags_nz   : in  std_logic_vector(1 downto 0);
	        bctrl      : out std_logic_vector(10 downto 0)
	    );
    end component;

    signal barramento : std_logic_vector(7 downto 0);
    signal s_endPC, s_endBarr : std_logic_vector(7 downto 0);
    signal flagsNZ : std_logic_vector(1 downto 0);
    signal s_bctrl : std_logic_vector(10 downto 0);
    signal nbarrINC, nbarrPC, PC_nrw, AC_nrw, MEM_nrw, REM_nrw, RDM_nrw, RI_nrw : std_logic;
    signal ula_op : std_logic_vector(2 downto 0);

begin
    nbarrINC <= s_bctrl(0);
    nbarrpc  <= s_bctrl(1);
    ula_op   <= s_bctrl(4 downto 2);
    PC_nrw   <= s_bctrl(5);
    AC_nrw   <= s_bctrl(6);
    MEM_nrw  <= s_bctrl(7);
    REM_nrw  <= s_bctrl(8);
    RDM_nrw  <= s_bctrl(9);
    RI_nrw   <= s_bctrl(10);

    u_ula : moduloULA port map(rst, clk, s_bctrl(6), s_bctrl(4 downto 2), s_bctrl(7), flagsNZ, barramento);
    u_mem : moduloMEM port map(rst, clk, s_bctrl(1), s_bctrl(8), s_bctrl(7), s_bctrl(9), s_endPC, barramento, barramento);
    u_pc  : moduloPC  port map(rst, clk, s_bctrl(5), s_bctrl(0), barramento, s_endPC);
    u_uc  : moduloUC  port map(rst, clk, barramento, s_bctrl(10), flagsNZ, s_bctrl);
  
end architecture;