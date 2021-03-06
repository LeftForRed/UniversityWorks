LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU4 is port (
    ALUin1: in std_logic_vector(3 downto 0);
    ALUin2: in std_logic_vector(3 downto 0);
    ALUctrl: in std_logic_vector(3 downto 0);
    ALUout1: out std_logic_vector(3 downto 0);
    zero: out std_logic);
end ALU4;

architecture behavioural of ALU4 is
    signal sig: std_logic_vector(3 downto 0);
begin

    with ALUctrl select
        sig <= 
            ALUin1 AND ALUin2 when "0000",
            ALUin1 OR  ALUin2 when "0001",
            std_logic_vector(signed(ALUin1) + signed(ALUin2)) when "0010",
            std_logic_vector(signed(ALUin1) - signed(ALUin2)) when "0110",
            "1111" when others;
    with sig select
        zero <= 
            '1' when "0000",
            '0' when others;

    ALUout1 <= sig; 
end behavioural;