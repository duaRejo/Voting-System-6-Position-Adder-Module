----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2022 06:10:11 PM
-- Design Name: 
-- Module Name: six_position_adder_mod_tb - Testbench
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

entity six_position_adder_mod_tb is
--  Port ( );
end six_position_adder_mod_tb;

architecture Testbench of six_position_adder_mod_tb is
    component six_position_adder_mod is
        port (sel : in STD_LOGIC_VECTOR(0 to 5);
              yes : out STD_LOGIC_VECTOR(0 to 3);
              no  : out STD_LOGIC_VECTOR(0 to 3)); 
    end component;
    
    signal sel_in : std_logic_vector(0 to 5); 
    signal yes_out, no_out : std_logic_vector(0 to 3);  
    
begin
dut : six_position_adder_mod
    port map(sel => sel_in, 
             yes => yes_out, 
             no => no_out); 
             
stimuli : process 
begin 
sel_in <= "111111"; 
wait for 100 ns; 
sel_in <= "000000";
wait for 100 ns;
sel_in <= "010011";
wait for 100 ns;
sel_in <= "101010";
wait for 100 ns;
sel_in <= "100000";
wait for 100 ns;

wait;  
end process;  
end Testbench;
































