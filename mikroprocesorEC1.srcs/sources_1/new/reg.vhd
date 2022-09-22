----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/19/2022 05:34:34 PM
-- Design Name: 
-- Module Name: reg - Behavioral
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


entity reg is
    Generic (WIDTH : positive :=8);
    Port ( clk : in STD_LOGIC;
           d : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           clear : in STD_LOGIC;
           load : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end reg;

architecture Behavioral of reg is
    
begin
    
    reg: process (clk, clear) is
    begin
        if (clear = '1') then
            q <= (others => '0');
        else    
            if ((rising_edge(clk)) and (load = '1')) then
                q <= d;
            end if;
        end if;
    end process;

end Behavioral;
