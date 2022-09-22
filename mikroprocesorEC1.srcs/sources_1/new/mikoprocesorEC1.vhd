----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/20/2022 03:28:22 PM
-- Design Name: 
-- Module Name: mikoprocesorEC1 - Behavioral
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

entity mikoprocesorEC1 is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           INPUT : in STD_LOGIC_VECTOR (7 downto 0);
           OUTPUT : out STD_LOGIC_VECTOR (7 downto 0));
end mikoprocesorEC1;

architecture Behavioral of mikoprocesorEC1 is
    signal IRload_s, JNZmux_s, PCload_s, INmux_s, Aload_s, Aneq0_s : std_logic;
    signal IR_s : std_logic_vector(2 downto 0);
begin
    putanja_podataka: entity work.data_path(Behavioral)
    port map (clk => clk,
              reset => reset,
              IRload => IRload_s,
              JNZmux => JNZmux_s,
              PCload => PCload_s,
              INmux => INmux_s,
              Aload => Aload_s,
              Input => INPUT,
              IR => IR_s,
              Aneq0 => Aneq0_s,
              Output => OUTPUT);
              
    upravljacka_jedinica: entity work.control_path(Behavioral)
    port map ( clk => clk,
               reset => reset,
               IR => IR_s,
               Aneq0 => Aneq0_s,
               IRload => IRload_s,
               JNZmux => JNZmux_s,
               PCload => PCload_s,
               INmux => INmux_s,
               Aload => Aload_s);

end Behavioral;
