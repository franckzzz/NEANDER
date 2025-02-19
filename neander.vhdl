library ieee;
use ieee.std_logic_1164.all;

entity Neander is
    port (
        clk : in std_logic;
        rst : in std_logic;
    );
end entity Neander;

architecture docomputing of Neander is
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
begin


end architecture;