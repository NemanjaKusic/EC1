----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/19/2022 06:20:05 PM
-- Design Name: 
-- Module Name: dekrement - Behavioral
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dekrement is
    Port ( in1 : in std_logic_vector(7 downto 0);
           out1 : out std_logic_vector(7 downto 0));
end dekrement;

architecture Behavioral of dekrement is

begin

    out1 <= std_logic_vector(unsigned(in1) - 1);

end Behavioral;
