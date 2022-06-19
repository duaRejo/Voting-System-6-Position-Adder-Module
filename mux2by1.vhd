----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2022 12:36:54 AM
-- Design Name: 
-- Module Name: mux2by1 - Structural
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

entity mux2by1 is
  Port (S : in std_logic; D0 : in std_logic; D1 : in std_logic; Y : out std_logic );
end mux2by1;

architecture Structural of mux2by1 is
    component nand_gate is 
    Port(a : in std_logic; b : in std_logic; c : out std_logic); 
    end component;
    
    signal s0, s1, s2 : std_logic;
begin
    N0 : nand_gate port map(S, S, s0);
    N1 : nand_gate port map(s0, D0, s1); 
    N2 : nand_gate port map(S, D1, s2); 
    N3 : nand_gate port map(s1, s2, Y); 


end Structural;
