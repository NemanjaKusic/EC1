----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/19/2022 05:45:53 PM
-- Design Name: 
-- Module Name: mux2na1 - Behavioral
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


entity mux2na1 is
    Generic (WIDTH : positive :=8);
    port (x1: in std_logic_vector(WIDTH-1 downto 0); -- ulazni port podataka 1
          x2: in std_logic_vector(WIDTH-1 downto 0); -- ulazni port podataka 2
          sel: in std_logic;                         -- selekcioni ulaz
          y: out std_logic_vector(WIDTH-1 downto 0));-- izlazni port podataka
end entity mux2na1;

architecture beh of mux2na1 is
    begin
    
        mux: process (x1, x2, sel) is
        begin
            case sel is
                when '1' =>
                        y <= x2;
                when others =>
                        y <= x1;
            end case;
        end process;
        
end architecture beh;
