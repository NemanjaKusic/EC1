----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/20/2022 09:38:53 AM
-- Design Name: 
-- Module Name: data_path - Behavioral
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
use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_path is
    Port ( clk : in std_logic;
           reset : in std_logic;
           IRload : in std_logic;
           JNZmux : in std_logic;
           PCload : in std_logic;
           INmux : in std_logic;
           Aload : in std_logic;
           Input : in std_logic_vector(7 downto 0);
           IR : out std_logic_vector(2 downto 0);
           Aneq0 : out std_logic;
           Output : out std_logic_vector(7 downto 0));
end data_path;

architecture Behavioral of data_path is
    signal ROM_IR : std_logic_vector(7 downto 0);
    signal IR_mux : std_logic_vector(7 downto 0); 
    signal incr_mux : std_logic_vector(3 downto 0);
    signal mux_PC : std_logic_vector(3 downto 0);
    signal PC_incr_ROM : std_logic_vector(3 downto 0);
    signal decr_mux : std_logic_vector(7 downto 0);
    signal mux_A : std_logic_vector(7 downto 0);
    signal outp : std_logic_vector(7 downto 0);
begin

    IR_reg: entity work.reg(Behavioral)
    generic map (WIDTH => 8)
    port map ( clk => clk,
               d => ROM_IR,
               clear => reset,
               load => IRload,
               q => IR_mux);
               
    mux_4bit: entity work.mux2na1(beh)
    generic map (WIDTH => 4)
    port map (x1 => incr_mux, 
              x2 => (IR_mux(3),IR_mux(2),IR_mux(1),IR_mux(0)),
              sel => JNZmux,
              y => mux_PC);
              
    IR <= (IR_mux(7),IR_mux(6),IR_mux(5));
              
    PC_reg: entity work.reg(Behavioral)
    generic map (WIDTH => 4)
    port map ( clk => clk,
               d => mux_PC,
               clear => reset,
               load => PCload,
               q => PC_incr_ROM);
              
    incr : entity work.increment(Behavioral)
    port map (in1 => PC_incr_ROM, 
              out1 => incr_mux);
              
    ROM_mem: entity work.ROM16x8(Behavioral)
    port map (clk => clk,
              address => PC_incr_ROM,
              data => ROM_IR);
              
    mux_8bit: entity work.mux2na1(beh)
    generic map (WIDTH => 8)
    port map (x1 => decr_mux, 
              x2 => Input,
              sel => INmux,
              y => mux_A);
    
    A_reg: entity work.reg(Behavioral)
    generic map (WIDTH => 8)
    port map ( clk => clk,
               d => mux_A,
               clear => reset,
               load => Aload,
               q => outp);
               
    decr: entity work.dekrement(Behavioral)
    port map (in1 => outp,
              out1 => decr_mux);
              
    or_gate: entity work.ili(Behavioral)
    port map (in1 => outp,
              out1 => Aneq0);
              
    Output <= outp;

end Behavioral;
