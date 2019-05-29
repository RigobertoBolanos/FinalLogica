--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.4
--  \   \         Application : sch2hdl
--  /   /         Filename : VGA_Image_tets.vhf
-- /___/   /\     Timestamp : 05/28/2019 20:41:45
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -sympath C:/Users/1107521942/Documents/Semana14_VGA/FinalLogica/VGA_Image/ipcore_dir -intstyle ise -family spartan3e -flat -suppress -vhdl C:/Users/1107521942/Documents/Semana14_VGA/FinalLogica/VGA_Image/VGA_Image_tets.vhf -w C:/Users/1107521942/Documents/Semana14_VGA/FinalLogica/VGA_Image/VGA_Image_tets.sch
--Design Name: VGA_Image_tets
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity VGA_Image_tets is
   port ( CLK_50MHZ : in    std_logic; 
          SW0       : in    std_logic; 
          VGA_BLUE  : out   std_logic; 
          VGA_GREEN : out   std_logic; 
          VGA_HSYNC : out   std_logic; 
          VGA_RED   : out   std_logic; 
          VGA_VSYNC : out   std_logic; 
          PS2_CLK   : inout std_logic; 
          PS2_DATA  : inout std_logic);
end VGA_Image_tets;

architecture BEHAVIORAL of VGA_Image_tets is
   attribute BOX_TYPE   : string ;
   signal XLXN_47   : std_logic;
   signal XLXN_48   : std_logic;
   signal XLXN_49   : std_logic;
   signal XLXN_52   : std_logic_vector (13 downto 0);
   signal XLXN_53   : std_logic_vector (2 downto 0);
   signal XLXN_54   : std_logic_vector (9 downto 0);
   signal XLXN_55   : std_logic_vector (9 downto 0);
   signal XLXN_75   : std_logic;
   signal XLXN_78   : std_logic;
   signal XLXN_81   : std_logic;
   signal XLXN_87   : std_logic;
   component VGA_SYNC
      port ( clock_25Mhz    : in    std_logic; 
             red            : in    std_logic; 
             green          : in    std_logic; 
             blue           : in    std_logic; 
             red_out        : out   std_logic; 
             green_out      : out   std_logic; 
             blue_out       : out   std_logic; 
             horiz_sync_out : out   std_logic; 
             vert_sync_out  : out   std_logic; 
             pixel_row      : out   std_logic_vector (9 downto 0); 
             pixel_column   : out   std_logic_vector (9 downto 0));
   end component;
   
   component Clk_div_25MHz
      port ( clk       : in    std_logic; 
             clk_25MHz : out   std_logic);
   end component;
   
   component memoryDino3
      port ( addra : in    std_logic_vector (13 downto 0); 
             clka  : in    std_logic; 
             douta : out   std_logic_vector (2 downto 0));
   end component;
   
   component reader
      port ( clk    : in    std_logic; 
             reset  : in    std_logic; 
             mouse  : in    std_logic; 
             row    : in    std_logic_vector (9 downto 0); 
             col    : in    std_logic_vector (9 downto 0); 
             datain : in    std_logic_vector (2 downto 0); 
             R      : out   std_logic; 
             G      : out   std_logic; 
             B      : out   std_logic; 
             addr   : out   std_logic_vector (13 downto 0));
   end component;
   
   component MouseRefComp
      port ( CLK        : in    std_logic; 
             RESOLUTION : in    std_logic; 
             RST        : in    std_logic; 
             SWITCH     : in    std_logic; 
             LEFT       : out   std_logic; 
             MIDDLE     : out   std_logic; 
             NEW_EVENT  : out   std_logic; 
             RIGHT      : out   std_logic; 
             XPOS       : out   std_logic_vector (9 downto 0); 
             YPOS       : out   std_logic_vector (9 downto 0); 
             ZPOS       : out   std_logic_vector (3 downto 0); 
             PS2_CLK    : inout std_logic; 
             PS2_DATA   : inout std_logic);
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   XLXI_2 : VGA_SYNC
      port map (blue=>XLXN_49,
                clock_25Mhz=>XLXN_87,
                green=>XLXN_48,
                red=>XLXN_47,
                blue_out=>VGA_BLUE,
                green_out=>VGA_GREEN,
                horiz_sync_out=>VGA_HSYNC,
                pixel_column(9 downto 0)=>XLXN_55(9 downto 0),
                pixel_row(9 downto 0)=>XLXN_54(9 downto 0),
                red_out=>VGA_RED,
                vert_sync_out=>VGA_VSYNC);
   
   XLXI_5 : Clk_div_25MHz
      port map (clk=>CLK_50MHZ,
                clk_25MHz=>XLXN_87);
   
   XLXI_15 : memoryDino3
      port map (addra(13 downto 0)=>XLXN_52(13 downto 0),
                clka=>XLXN_87,
                douta(2 downto 0)=>XLXN_53(2 downto 0));
   
   XLXI_16 : reader
      port map (clk=>XLXN_87,
                col(9 downto 0)=>XLXN_55(9 downto 0),
                datain(2 downto 0)=>XLXN_53(2 downto 0),
                mouse=>XLXN_78,
                reset=>SW0,
                row(9 downto 0)=>XLXN_54(9 downto 0),
                addr(13 downto 0)=>XLXN_52(13 downto 0),
                B=>XLXN_49,
                G=>XLXN_48,
                R=>XLXN_47);
   
   XLXI_18 : MouseRefComp
      port map (CLK=>XLXN_87,
                RESOLUTION=>XLXN_75,
                RST=>XLXN_81,
                SWITCH=>XLXN_75,
                LEFT=>XLXN_78,
                MIDDLE=>open,
                NEW_EVENT=>open,
                RIGHT=>open,
                XPOS=>open,
                YPOS=>open,
                ZPOS=>open,
                PS2_CLK=>PS2_CLK,
                PS2_DATA=>PS2_DATA);
   
   XLXI_19 : GND
      port map (G=>XLXN_75);
   
   XLXI_20 : INV
      port map (I=>SW0,
                O=>XLXN_81);
   
end BEHAVIORAL;


