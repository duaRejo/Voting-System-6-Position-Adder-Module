----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2022 07:23:49 PM
-- Design Name: 
-- Module Name: full_adder - Structural
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

entity full_adder is
 Port  (a : in STD_LOGIC;
        b : in STD_LOGIC; 
        c_in : in STD_LOGIC;
        s : out STD_LOGIC; 
        c_out : out STD_LOGIC); 
end full_adder;

architecture Structural of full_adder is
    component nand_gate is
    Port(a : in std_logic; b : in std_logic; c : out std_logic); 
    end component;
    
    component half_adder is 
    Port(a : in std_logic; b : in std_logic; s : out std_logic; c : out std_logic); 
    end component;
    
    signal s0, s1, s2, s3, s4 : std_logic;
    
begin
    
    u0 : half_adder port map(a, b, s0, s1); 
    u1 : half_adder port map(s0, c_in, s, s2); 
    u2 : nand_gate port map(s2, s2, s4); 
    u3 : nand_gate port map(s1, s1, s3); 
    u4 : nand_gate port map(s4, s3, c_out); 

end Structural;
