----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2022 06:47:37 PM
-- Design Name: 
-- Module Name: half_adder - Structural
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity half_adder is
  Port (a : in STD_LOGIC;
        b : in STD_LOGIC; 
        s : out STD_LOGIC; 
        c : out STD_LOGIC); 
end half_adder;

architecture Structural of half_adder is
    component nand_gate is
    Port(a : in std_logic; b : in std_logic; c : out std_logic); 
    end component;
    
    signal na, nb, s0, s1, s2 : std_logic;
begin
    u0 : nand_gate port map(a, a, na); 
    u1 : nand_gate port map(b, b, nb); 
    u2 : nand_gate port map(a, nb, s0); 
    u3 : nand_gate port map(na, b, s1); 
    u4 : nand_gate port map(s0, s1, s); 
    
    u5 : nand_gate port map(a, b, s2); 
    u6 : nand_gate port map(s2,s2, c); 
end Structural;













