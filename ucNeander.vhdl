-- neander módulo principal UC ===============================================
library IEEE;
use IEEE.std_logic_1164.all;

entity moduloUC is
	port(
        rst, clk   : in  std_logic;
        barramento : in  std_logic_vector(7 downto 0);
        RI_nrw     : in  std_logic;
        flags_nz   : in  std_logic_vector(1 downto 0);
	    bctrl      : out std_logic_vector(10 downto 0)
	);
end entity moduloUC;

architecture docontrolstuff of moduloUC is
    -- componente regRI
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

    -- componente DECODE
    -- on code!
    
    -- componente Contador0-7
    component contador is
	    port(
            clock, pr, reset : in  std_logic;
            c                : out std_logic_vector (2 downto 0)
        );
    end component;

    -- componente UC-interno
    component moduloPC is
        port(
        rst, clk   : in  std_logic;
        PC_nrw     : in  std_logic;
        nbarrINC   : in  std_logic;
        barramento : in  std_logic_vector(7 downto 0);
	    endereco   : out std_logic_vector(7 downto 0)
	);
    end component;

    component LDA is
        port(
            c : in std_logic_vector(2 downto 0);
            s : out std_logic_vector(10 downto 0);
        );
    end component;
    -- on code!

    -- 3bits de contador
    signal s_ciclo : std_logic_vector(2 downto 0) := (others => 'Z');

    signal s_ri2dec : std_logic_vector(7 downto 0) := (others => 'Z');

    -- nop, sta, lda, add, or, and, not, jmp, jn, jz, hlt
    signal s_dec2uc : std_logic_vector(10 downto 0) := (others => 'Z');

    signal s_bctrl  : std_logic_vector(10 downto 0) := (others => 'Z');

    signal sLDA : std_logic_vector(10 downto 0);

    -- observacao
    signal instrucaoAtiva : string(1 to 3);
    signal operacaoULA    : string(1 to 3);
    signal FLAGS          : string(1 to 2);

begin

    -- registrador RI
    u_regRI : reg8bit port map (barramento, clk, '1', rst, RI_nrw, s_ri2dec);

    -- decodificador 4 para 11
    s_dec2uc <= "10000000000" when s_ri2dec = "00000000" else
                "01000000000" when s_ri2dec = "00010000" else
                "00100000000" when s_ri2dec = "00100000" else
                "00010000000" when s_ri2dec = "00110000" else
                "00001000000" when s_ri2dec = "01000000" else
                "00000100000" when s_ri2dec = "01010000" else
                "00000010000" when s_ri2dec = "01100000" else
                "00000001000" when s_ri2dec = "10000000" else 
                "00000000100" when s_ri2dec = "10010000" else
                "00000000010" when s_ri2dec = "10100000" else
                "00000000001" when s_ri2dec = "11110000";

   
    -- contador
    u_contador : contador port map(clk, '1', rst, s_ciclo);
    u_lda : LDA port map(s_ciclo, sLDa)
    -- Unidade de Controle
    s_bctrl <= sLDA when sdec2uc = "00100000000";
end architecture docontrolstuff;