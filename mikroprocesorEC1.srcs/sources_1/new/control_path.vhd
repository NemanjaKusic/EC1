----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/20/2022 02:36:06 PM
-- Design Name: 
-- Module Name: control_path - Behavioral
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

entity control_path is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           IR : in STD_LOGIC_VECTOR (2 downto 0);
           Aneq0 : in STD_LOGIC;
           IRload : out STD_LOGIC;
           JNZmux : out STD_LOGIC;
           PCload : out STD_LOGIC;
           INmux : out STD_LOGIC;
           Aload : out STD_LOGIC);
end control_path;

architecture Behavioral of control_path is
    type state_type is (start, zahvat, dekod, input, output, dec, jnz, halt);
    signal next_state, state : state_type; 
begin
    
    process (state, IR, Aneq0)
    begin

        case state is 
            when start => 
                next_state <= zahvat;
                IRload <= '0';
                JNZmux <= '0';
                PCload <= '0';
                INmux <= '0';
                Aload <= '0';
            when zahvat =>
                next_state <= dekod;
                IRload <= '1';
                JNZmux <= '0';
                PCload <= '0';
                INmux <= '0';
                Aload <= '0';
            when dekod => 
                if (IR = "011") then next_state <= input;
                elsif (IR = "100") then next_state <= output;
                elsif (IR = "101") then next_state <= dec;
                elsif (IR = "110") then next_state <= jnz;
                elsif (IR = "111") then next_state <= halt;
                elsif (IR = "000") then next_state <= start;
                else next_state <= zahvat;
                end if;
                PCload <= '1';
                IRload <= '0';
                JNZmux <= '0';
                INmux <= '0';
                Aload <= '0';
            when input =>
                next_state <= zahvat;
                INmux <= '1';
                Aload <= '1';
                PCload <= '0';
                IRload <= '0';
                JNZmux <= '0';
            when output =>
                next_state <= zahvat;
                IRload <= '0';
                JNZmux <= '0';
                PCload <= '0';
                INmux <= '0';
                Aload <= '0';
            when dec =>
                next_state <= zahvat;
                Aload <= '1';
                IRload <= '0';
                JNZmux <= '0';
                PCload <= '0';
                INmux <= '0';
            when jnz =>
                if (Aneq0 = '1') then
                    next_state <= start;
                    PCload <= '1';
                    JNZmux <= '1';
                    IRload <= '0';
                    INmux <= '0';
                    Aload <= '0';
                else
                    next_state <= zahvat;
                    PCload <= '0';
                    IRload <= '0';
                    JNZmux <= '0';
                    INmux <= '0';
                    Aload <= '0';
                end if;
            when halt =>
                next_state <= halt;
                PCload <= '0';
                IRload <= '0';
                JNZmux <= '0';
                INmux <= '0';
                Aload <= '0';
        end case;
    
    end process;

    process (clk, reset)
    begin
        if (clk'event and clk = '1') then
            if (reset = '1') then
                state <= start;
            else
                state <= next_state;
            end if;    
        end if;
    end process;

end Behavioral;
