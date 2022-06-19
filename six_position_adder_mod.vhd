----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2022 05:32:13 PM
-- Design Name: 
-- Module Name: six_position_adder_mod - Structural
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

entity six_position_adder_mod is
  Port (sel : in STD_LOGIC_VECTOR(0 to 5);
        yes : out STD_LOGIC_VECTOR(0 to 3);
        no  : out STD_LOGIC_VECTOR(0 to 3);
        f1 : inout STD_LOGIC_VECTOR(0 to 3);
        f2 : inout STD_LOGIC_VECTOR(0 to 3);
        f3 : inout STD_LOGIC_VECTOR(0 to 3);
         f4 :inout STD_LOGIC_VECTOR(0 to 3)
        ); 
end six_position_adder_mod;

architecture Structural of six_position_adder_mod is
    component full_adder is
        port (a : in STD_LOGIC;
              b : in STD_LOGIC; 
              c_in : in STD_LOGIC;
              s : out STD_LOGIC; 
              c_out : out STD_LOGIC); 
    end component;
    
    component mux2by1 is
        port (S : in std_logic;
              D0 : in std_logic; 
              D1 : in std_logic; 
              Y : out std_logic );
    end component;

    component parallel_adder_4bit is
        port (a_vec : in STD_LOGIC_VECTOR(0 to 3); 
              b_vec : in STD_LOGIC_VECTOR(0 to 3);
              c0 : in STD_LOGIC;
              s_vec : out STD_LOGIC_VECTOR(0 to 3);
              c4 : out STD_LOGIC);
    end component;
    
    component nand_gate is
    Port(a : in std_logic; b : in std_logic; c : out std_logic); 
    end component;
    
    signal mux_out : std_logic_vector(0 to 5);
    signal mux_out_inv : std_logic_vector(0 to 5);  
   -- signal f1, f2, f3, f4 : std_logic_vector(0 to 3); -- fn(0) = sum, fn(1) = carry
    signal c0, c1 : std_logic; 
begin
    m1 : mux2by1 port map(sel(0), '0', '1', mux_out(0));
    m2 : mux2by1 port map(sel(1), '0', '1', mux_out(1));
    m3 : mux2by1 port map(sel(2), '0', '1', mux_out(2));
    m4 : mux2by1 port map(sel(3), '0', '1', mux_out(3));
    m5 : mux2by1 port map(sel(4), '0', '1', mux_out(4));
    m6 : mux2by1 port map(sel(5), '0', '1', mux_out(5));
    
    n1 : nand_gate port map(mux_out(0), mux_out(0), mux_out_inv(0)); 
    n2 : nand_gate port map(mux_out(1), mux_out(1), mux_out_inv(1)); 
    n3 : nand_gate port map(mux_out(2), mux_out(2), mux_out_inv(2)); 
    n4 : nand_gate port map(mux_out(3), mux_out(3), mux_out_inv(3)); 
    n5 : nand_gate port map(mux_out(4), mux_out(4), mux_out_inv(4)); 
    n6 : nand_gate port map(mux_out(5), mux_out(5), mux_out_inv(5)); 
    
    -- yes logic
    fa1 : full_adder port map(mux_out(0), mux_out(1), mux_out(2), f1(3), f1(2)); --f1(0) = LSB = sum, f1(1) = MSB = carry
    fa2 : full_adder port map(mux_out(3), mux_out(4), mux_out(5), f2(3), f2(2)); 
    
    f1(0) <= '0'; 
    f1(1) <= '0'; 
    f2(0) <= '0'; 
    f2(1) <= '0'; 
    
    p1 : parallel_adder_4bit port map(f1, f2, '0', yes, c0); 
    -- no logic
    fa3 : full_adder port map(mux_out_inv(0), mux_out_inv(1), mux_out_inv(2), f3(3), f3(2)); 
    fa4 : full_adder port map(mux_out_inv(3), mux_out_inv(4), mux_out_inv(5), f4(3), f4(2)); 
    
    f3(0) <= '0'; 
    f3(1) <= '0'; 
    f4(0) <= '0'; 
    f4(1) <= '0'; 
    
    p2 : parallel_adder_4bit port map(f3, f4, '0', no, c1); 
end Structural;




















