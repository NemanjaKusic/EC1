----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/19/2022 06:03:00 PM
-- Design Name: 
-- Module Name: ili - Behavioral
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

entity ili is
    Port ( in1 : in std_logic_vector(7 downto 0);
           out1 : out STD_LOGIC);
end ili;

architecture Behavioral of ili is

begin
    out1 <= ((in1(7) or in1(6)) or (in1(5) or in1(4))) or ((in1(3) or in1(2)) or (in1(1) or in1(0)));

end Behavioral;
