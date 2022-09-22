----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/19/2022 06:43:30 PM
-- Design Name: 
-- Module Name: ROM16x8 - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM16x8 is
    Port ( clk : in STD_LOGIC;
           address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (7 downto 0));
end ROM16x8;

architecture Behavioral of ROM16x8 is
    type rom_type_t is array (15 downto 0) of std_logic_vector(7 downto 0);
    signal rom_s : rom_type_t := ("11111111",   -- 15. adresa, halt
                                 "01111111",   -- 14. adresa, input
                                 "11111111",   -- 13. adresa, halt                              
                                 "11111111",   -- 12. adresa, halt
                                 "11111111",   -- 11. adresa, halt
                                 "11111111",   -- 10. adresa, halt
                                 "10011111",   -- 9. adresa, out
                                 "11011110",   -- 8. adresa, jnz to 14.
                                 "10111111",   -- 7. adresa, dec
                                 "11111111",   -- 6. adresa, halt
                                 "11111111",   -- 5. adresa, halt
                                 "11010111",   -- 4. adresa, jnz to 7.
                                 "10011111",   -- 3. adresa, out 
                                 "10111111",   -- 2. adresa, dec
                                 "10111111",   -- 1. adresa, dec     
                                 "01111111");  -- 0. adresa, input  
begin

    rom: process (clk) is
    begin
        if (clk'event and clk = '1') then
            data <= rom_s(conv_integer(address));
        end if;
    end process;


end Behavioral;
