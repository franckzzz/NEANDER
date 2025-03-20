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
            clock, reset : in  std_logic;
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
            s : out std_logic_vector(10 downto 0)
        );
    end component;

    component STA is
        port(
            c : in std_logic_vector(2 downto 0);
            s : out std_logic_vector(10 downto 0)
        );
    end component;

    component NOP is
        port(
            c : in std_logic_vector(2 downto 0);
            s : out std_logic_vector(10 downto 0)
        );
    end component;

    component NNOT is
        port(
            c : in std_logic_vector(2 downto 0);
            s : out std_logic_vector(10 downto 0)
        );
    end component;

    component ADD is
        port(
            c : in std_logic_vector(2 downto 0);
            s : out std_logic_vector(10 downto 0)
        );
    end component;

    component AAND is
        port(
            c : in std_logic_vector(2 downto 0);
            s : out std_logic_vector(10 downto 0)
        );
    end component;

    component OOR is
        port(
            c : in std_logic_vector(2 downto 0);
            s : out std_logic_vector(10 downto 0)
        );
    end component;

    component HLT is
        port(
            c : in std_logic_vector(2 downto 0);
            s : out std_logic_vector(10 downto 0)
        );
    end component;

    component JMP is
        port(
            c : in std_logic_vector(2 downto 0);
            s : out std_logic_vector(10 downto 0)
        );
    end component;

    component JN is
        port(
            c : in std_logic_vector(2 downto 0);
            s : out std_logic_vector(10 downto 0);
            flagsNZ : in std_logic_vector(1 downto 0)
        );
    end component;

    component JZ is
        port(
            c : in std_logic_vector(2 downto 0);
            s : out std_logic_vector(10 downto 0);
            flagsNZ : in std_logic_vector(1 downto 0)
        );
    end component;

    -- 3bits de contador
    signal s_ciclo : std_logic_vector(2 downto 0) := (others => 'Z');

    signal s_ri2dec : std_logic_vector(7 downto 0) := (others => 'Z');

    signal s_dec2uc : std_logic_vector(10 downto 0) := (others => 'Z');

    signal s_bctrl  : std_logic_vector(10 downto 0) := (others => 'Z');

    -- nop, sta, lda, add, or, and, not, jmp, jn, jz, hlt
    signal sLDA : std_logic_vector(10 downto 0);
    signal sNOP : std_logic_vector(10 downto 0);
    signal sSTA : std_logic_vector(10 downto 0);
    signal sADD : std_logic_vector(10 downto 0);
    signal sNOT : std_logic_vector(10 downto 0);
    signal sOR : std_logic_vector(10 downto 0);
    signal sAND : std_logic_vector(10 downto 0);
    signal sJMP : std_logic_vector(10 downto 0);
    signal sJZ : std_logic_vector(10 downto 0);
    signal sJN : std_logic_vector(10 downto 0);
    signal sHLT : std_logic_vector(10 downto 0);

    -- observacao
    signal sFlags : std_logic_vector(1 downto 0);

begin

    sFlags <= flags_nz;
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
                "00000000001" when s_ri2dec = "11110000" else
                (others => 'Z');

   
    -- contador
    u_contador : contador port map(clk, rst, s_ciclo);

    -- Unidade de Controle
    u_lda : LDA  port map(s_ciclo, sLDA);
    u_sta : STA  port map(s_ciclo, sSTA);
    u_nop : NOP  port map(s_ciclo, sNOP);
    u_not : NNOT port map(s_ciclo, sNOT);
    u_add : ADD  port map(s_ciclo, sADD);
    u_or  : OOR  port map(s_ciclo, sOR );
    u_and : AAND port map(s_ciclo, sAND);
    u_jmp : JMP  port map(s_ciclo, sJMP);
    u_jz  : JZ   port map(s_ciclo, sJZ, sFlags);
    u_jn  : JN   port map(s_ciclo, sJN, sFlags);
    u_hlt : HLT  port map(s_ciclo, sHLT);

    s_bctrl <= sLDA when s_dec2uc = "00100000000" else
               sNOP when s_dec2uc = "10000000000" else
               sSTA when s_dec2uc = "01000000000" else
               sADD when s_dec2uc = "00010000000" else
               sAND when s_dec2uc = "00000100000" else
               sOR  when s_dec2uc = "00001000000" else
               sNOT when s_dec2uc = "00000010000" else
               sJMP when s_dec2uc = "00000001000" else
               sJN  when s_dec2uc = "00000000100" else
               sJZ  when s_dec2uc = "00000000010" else
               sHLT when s_dec2uc = "00000000001" else
               (others => 'Z');

    bctrl <= s_bctrl;
end architecture docontrolstuff;