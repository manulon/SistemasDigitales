library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplicador is
    generic (
        N:          natural := 19;
        SIGNO:      natural := 1;
        EXPONENTE:  natural := 6;
        MANTISA:    natural := 12        
    );
    port(
        clk : in std_logic;
        resultado: out std_logic_vector(N-1 downto 0);
        test_a: out std_logic_vector(N-1 downto 0);
        test_b: out std_logic_vector(N-1 downto 0);
        exponente_final: out std_logic_vector(EXPONENTE-1 downto 0);
        mantisa_final:   out std_logic_vector(MANTISA-1 downto 0);
        test_exponente_a:     out std_logic_vector(EXPONENTE-1 downto 0);
        test_exponente_b:     out std_logic_vector(EXPONENTE-1 downto 0)
    );
end multiplicador;

architecture multiplicador_arq of multiplicador is
    
    signal a:                       integer := 479270;
    signal b:                       integer := 32204;

    signal a_unsigned:              unsigned(N-1 downto 0);
    signal b_unsigned:              unsigned(N-1 downto 0);

    signal a_vector:                std_logic_vector(N-1 downto 0);
    signal b_vector:                std_logic_vector(N-1 downto 0);

    -- variables parciales  
    signal exponente_a:             std_logic_vector(EXPONENTE-1 downto 0);
    signal exponente_b:             std_logic_vector(EXPONENTE-1 downto 0);
    signal exponente_parcial_1:     std_logic_vector(EXPONENTE downto 0);
    signal exponente_parcial_2:     std_logic_vector(EXPONENTE+1 downto 0);
    signal mantisa_a_mult:          std_logic_vector(MANTISA downto 0);        
    signal mantisa_b_mult:          std_logic_vector(MANTISA downto 0);
    signal producto_mantisas:       std_logic_vector(MANTISA+MANTISA+1 downto 0);
    signal msb_producto_mantisas:   std_logic_vector(0 downto 0);
    signal msb_a:                   std_logic_vector(0 downto 0);
    signal msb_b:                   std_logic_vector(0 downto 0);    
    signal excedente_vector:        std_logic_vector(EXPONENTE downto 0);
    signal excedente:               unsigned(EXPONENTE downto 0);
    
    -- variables finales
    signal signo_final:             std_logic_vector(SIGNO-1 downto 0);
    signal signo_final_aux:         std_logic_vector(SIGNO downto 0);
    signal exponente_final_aux:     std_logic_vector(EXPONENTE-1 downto 0);
    signal mantisa_final_aux:       std_logic_vector(MANTISA-1 downto 0);
    
begin
    msb_a(0) <= a_vector(N-1);
    msb_b(0) <= b_vector(N-1);
    
    signo_final_aux <= std_logic_vector('0' & unsigned(msb_a) + unsigned(msb_b));
    signo_final(0) <= signo_final_aux(0);

    a_unsigned <= to_unsigned(a, N);
    b_unsigned <= to_unsigned(b, N);

    a_vector <= std_logic_vector(a_unsigned);
    b_vector <= std_logic_vector(b_unsigned);

    -- 1 bit de signo; 6 de exponente; 16 de mantisa.
    exponente_a         <= a_vector(N-2 downto N-1-EXPONENTE);
    exponente_b         <= b_vector(N-2 downto N-1-EXPONENTE);
    excedente_vector    <= (0 => '1', others => '0');
    excedente           <= shift_left(unsigned(excedente_vector), EXPONENTE-1);
    
    test_exponente_a <= exponente_a;
    test_exponente_b <= exponente_b;

    exponente_parcial_1 <= std_logic_vector(('0' & unsigned(exponente_a)) + ('0' & unsigned(exponente_b)) - (excedente - 1));
    
    mantisa_a_mult(MANTISA) <= '1';
    mantisa_b_mult(MANTISA) <= '1';
    mantisa_a_mult(MANTISA-1 downto 0) <= a_vector(MANTISA-1 downto 0);
    mantisa_b_mult(MANTISA-1 downto 0) <= b_vector(MANTISA-1 downto 0);

    test_a <= a_vector;
    test_b <= b_vector;
    
    producto_mantisas           <= std_logic_vector(unsigned(mantisa_a_mult) * unsigned(mantisa_b_mult));
    msb_producto_mantisas(0)    <= producto_mantisas(MANTISA+MANTISA-1);

    exponente_parcial_2 <= std_logic_vector('0' & unsigned(exponente_parcial_1) + unsigned(msb_producto_mantisas));                          

    exponente_final_aux <= exponente_parcial_2(EXPONENTE-1 downto 0);
    mantisa_final_aux <= producto_mantisas(MANTISA+MANTISA downto MANTISA+1);

    exponente_final <= exponente_final_aux;
    mantisa_final <= mantisa_final_aux;

    resultado <= signo_final & exponente_final_aux & mantisa_final_aux;

end multiplicador_arq;
