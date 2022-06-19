----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2022 10:19:48 PM
-- Design Name: 
-- Module Name: parallel_adder_4bit - Structural
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

-- a(0) is MSB, a(3) is LSB
-- b(0) is MSB, b(3) is LSB

entity parallel_adder_4bit is
  Port (a_vec : in STD_LOGIC_VECTOR(0 to 3); 
        b_vec : in STD_LOGIC_VECTOR(0 to 3);
        c0 : in STD_LOGIC;
        s_vec : out STD_LOGIC_VECTOR(0 to 3);
        c4 : out STD_LOGIC);
end parallel_adder_4bit;

architecture Structural of parallel_adder_4bit is
    component full_adder is
         Port(a : in STD_LOGIC;
              b : in STD_LOGIC; 
              c_in : in STD_LOGIC;
              s : out STD_LOGIC; 
              c_out : out STD_LOGIC); 
    end component;

signal c1, c2, c3 : STD_LOGIC; 

begin
    u0 : full_adder port map(a_vec(3), b_vec(3), c0, s_vec(3), c1); 
    u1 : full_adder port map(a_vec(2), b_vec(2), c1, s_vec(2), c2); 
    u3 : full_adder port map(a_vec(1), b_vec(1), c2, s_vec(1), c3); 
    u4 : full_adder port map(a_vec(0), b_vec(0), c3, s_vec(0), c4); 
    
    
    
end Structural;































