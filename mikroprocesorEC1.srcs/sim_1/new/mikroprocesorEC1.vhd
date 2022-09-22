----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/20/2022 04:39:24 PM
-- Design Name: 
-- Module Name: mikroprocesorEC1_tb - Behavioral
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

entity mikroprocesorEC1_tb is
--  Port ( );
end mikroprocesorEC1_tb;

architecture Behavioral of mikroprocesorEC1_tb is
    signal clk_s, reset_s : std_logic;
    signal INPUT_s, OUTPUT_s : std_logic_vector(7 downto 0);
begin
    
    duv: entity work.mikoprocesorEC1(Behavioral)
    port map (clk => clk_s,
              reset => reset_s,
              INPUT => INPUT_s,
              OUTPUT => OUTPUT_s);
    
    clk_gen: process
    begin
        clk_s <= '0', '1' after 100 ns;
        wait for 200 ns;
    end process;
              
    stim_gen: process
    begin 
        INPUT_s <= "00000011", "00000010" after 3000 ns;
        reset_s <= '0', '1' after 50 ns, '0' after 150 ns , '1' after 5950 ns, '0' after 6150 ns;
    
    wait;
    end process;           

end Behavioral;
