<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="VGA_RED" />
        <signal name="VGA_GREEN" />
        <signal name="VGA_BLUE" />
        <signal name="VGA_HSYNC" />
        <signal name="VGA_VSYNC" />
        <signal name="CLK_50MHZ" />
        <signal name="XLXN_39" />
        <signal name="XLXN_40" />
        <signal name="XLXN_43(9:0)" />
        <signal name="XLXN_44(9:0)" />
        <signal name="XLXN_45(2:0)" />
        <signal name="XLXN_47" />
        <signal name="XLXN_48" />
        <signal name="XLXN_49" />
        <signal name="XLXN_50" />
        <signal name="XLXN_51" />
        <signal name="XLXN_52(13:0)" />
        <signal name="XLXN_53(2:0)" />
        <signal name="XLXN_54(9:0)" />
        <signal name="XLXN_55(9:0)" />
        <signal name="XLXN_57" />
        <signal name="XLXN_58(9:0)" />
        <signal name="XLXN_59(9:0)" />
        <signal name="XLXN_60(2:0)" />
        <signal name="XLXN_62" />
        <signal name="XLXN_63(9:0)" />
        <signal name="XLXN_64(9:0)" />
        <signal name="XLXN_65(2:0)" />
        <signal name="XLXN_67" />
        <signal name="XLXN_68(9:0)" />
        <signal name="XLXN_69(9:0)" />
        <signal name="XLXN_70(2:0)" />
        <signal name="XLXN_72" />
        <signal name="XLXN_73" />
        <signal name="XLXN_75" />
        <signal name="PS2_DATA" />
        <signal name="PS2_CLK" />
        <signal name="XLXN_78" />
        <signal name="SW0" />
        <signal name="XLXN_80" />
        <signal name="XLXN_81" />
        <signal name="XLXN_83" />
        <signal name="XLXN_86" />
        <signal name="XLXN_87" />
        <port polarity="Output" name="VGA_RED" />
        <port polarity="Output" name="VGA_GREEN" />
        <port polarity="Output" name="VGA_BLUE" />
        <port polarity="Output" name="VGA_HSYNC" />
        <port polarity="Output" name="VGA_VSYNC" />
        <port polarity="Input" name="CLK_50MHZ" />
        <port polarity="BiDirectional" name="PS2_DATA" />
        <port polarity="BiDirectional" name="PS2_CLK" />
        <port polarity="Input" name="SW0" />
        <blockdef name="Clk_div_25MHz">
            <timestamp>2019-5-2T19:16:28</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="VGA_SYNC">
            <timestamp>2019-5-2T19:16:5</timestamp>
            <rect width="336" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <line x2="464" y1="-352" y2="-352" x1="400" />
            <line x2="464" y1="-288" y2="-288" x1="400" />
            <line x2="464" y1="-224" y2="-224" x1="400" />
            <line x2="464" y1="-160" y2="-160" x1="400" />
            <rect width="64" x="400" y="-108" height="24" />
            <line x2="464" y1="-96" y2="-96" x1="400" />
            <rect width="64" x="400" y="-44" height="24" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
        </blockdef>
        <blockdef name="memoryDino3">
            <timestamp>2019-5-28T20:51:8</timestamp>
            <rect width="512" x="32" y="32" height="1344" />
            <line x2="32" y1="80" y2="80" style="linewidth:W" x1="0" />
            <line x2="32" y1="272" y2="272" x1="0" />
            <line x2="544" y1="80" y2="80" style="linewidth:W" x1="576" />
        </blockdef>
        <blockdef name="reader">
            <timestamp>2019-5-29T1:41:13</timestamp>
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-208" y2="-208" x1="320" />
            <line x2="384" y1="-128" y2="-128" x1="320" />
            <rect width="64" x="320" y="-60" height="24" />
            <line x2="384" y1="-48" y2="-48" x1="320" />
            <rect width="256" x="64" y="-320" height="384" />
        </blockdef>
        <blockdef name="MouseRefComp">
            <timestamp>2019-5-28T22:14:24</timestamp>
            <rect width="304" x="64" y="-576" height="576" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
            <line x2="432" y1="-544" y2="-544" x1="368" />
            <line x2="432" y1="-480" y2="-480" x1="368" />
            <line x2="432" y1="-416" y2="-416" x1="368" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <rect width="64" x="368" y="-300" height="24" />
            <line x2="432" y1="-288" y2="-288" x1="368" />
            <rect width="64" x="368" y="-236" height="24" />
            <line x2="432" y1="-224" y2="-224" x1="368" />
            <rect width="64" x="368" y="-172" height="24" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="VGA_SYNC" name="XLXI_2">
            <blockpin signalname="XLXN_87" name="clock_25Mhz" />
            <blockpin signalname="XLXN_47" name="red" />
            <blockpin signalname="XLXN_48" name="green" />
            <blockpin signalname="XLXN_49" name="blue" />
            <blockpin signalname="VGA_RED" name="red_out" />
            <blockpin signalname="VGA_GREEN" name="green_out" />
            <blockpin signalname="VGA_BLUE" name="blue_out" />
            <blockpin signalname="VGA_HSYNC" name="horiz_sync_out" />
            <blockpin signalname="VGA_VSYNC" name="vert_sync_out" />
            <blockpin signalname="XLXN_54(9:0)" name="pixel_row(9:0)" />
            <blockpin signalname="XLXN_55(9:0)" name="pixel_column(9:0)" />
        </block>
        <block symbolname="Clk_div_25MHz" name="XLXI_5">
            <blockpin signalname="CLK_50MHZ" name="clk" />
            <blockpin signalname="XLXN_87" name="clk_25MHz" />
        </block>
        <block symbolname="memoryDino3" name="XLXI_15">
            <blockpin signalname="XLXN_52(13:0)" name="addra(13:0)" />
            <blockpin signalname="XLXN_87" name="clka" />
            <blockpin signalname="XLXN_53(2:0)" name="douta(2:0)" />
        </block>
        <block symbolname="reader" name="XLXI_16">
            <blockpin signalname="XLXN_87" name="clk" />
            <blockpin signalname="SW0" name="reset" />
            <blockpin signalname="XLXN_78" name="mouse" />
            <blockpin signalname="XLXN_54(9:0)" name="row(9:0)" />
            <blockpin signalname="XLXN_55(9:0)" name="col(9:0)" />
            <blockpin signalname="XLXN_53(2:0)" name="datain(2:0)" />
            <blockpin signalname="XLXN_47" name="R" />
            <blockpin signalname="XLXN_48" name="G" />
            <blockpin signalname="XLXN_49" name="B" />
            <blockpin signalname="XLXN_52(13:0)" name="addr(13:0)" />
        </block>
        <block symbolname="MouseRefComp" name="XLXI_18">
            <blockpin signalname="XLXN_87" name="CLK" />
            <blockpin signalname="XLXN_75" name="RESOLUTION" />
            <blockpin signalname="XLXN_81" name="RST" />
            <blockpin signalname="XLXN_75" name="SWITCH" />
            <blockpin signalname="XLXN_78" name="LEFT" />
            <blockpin name="MIDDLE" />
            <blockpin name="NEW_EVENT" />
            <blockpin name="RIGHT" />
            <blockpin name="XPOS(9:0)" />
            <blockpin name="YPOS(9:0)" />
            <blockpin name="ZPOS(3:0)" />
            <blockpin signalname="PS2_CLK" name="PS2_CLK" />
            <blockpin signalname="PS2_DATA" name="PS2_DATA" />
        </block>
        <block symbolname="gnd" name="XLXI_19">
            <blockpin signalname="XLXN_75" name="G" />
        </block>
        <block symbolname="inv" name="XLXI_20">
            <blockpin signalname="SW0" name="I" />
            <blockpin signalname="XLXN_81" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2464" y="1504" name="XLXI_2" orien="R0">
        </instance>
        <branch name="VGA_RED">
            <wire x2="2960" y1="1088" y2="1088" x1="2928" />
        </branch>
        <iomarker fontsize="28" x="2960" y="1088" name="VGA_RED" orien="R0" />
        <branch name="VGA_GREEN">
            <wire x2="2960" y1="1152" y2="1152" x1="2928" />
        </branch>
        <iomarker fontsize="28" x="2960" y="1152" name="VGA_GREEN" orien="R0" />
        <branch name="VGA_BLUE">
            <wire x2="2960" y1="1216" y2="1216" x1="2928" />
        </branch>
        <iomarker fontsize="28" x="2960" y="1216" name="VGA_BLUE" orien="R0" />
        <branch name="VGA_HSYNC">
            <wire x2="2960" y1="1280" y2="1280" x1="2928" />
        </branch>
        <iomarker fontsize="28" x="2960" y="1280" name="VGA_HSYNC" orien="R0" />
        <branch name="VGA_VSYNC">
            <wire x2="2960" y1="1344" y2="1344" x1="2928" />
        </branch>
        <iomarker fontsize="28" x="2960" y="1344" name="VGA_VSYNC" orien="R0" />
        <branch name="CLK_50MHZ">
            <wire x2="192" y1="2048" y2="2064" x1="192" />
        </branch>
        <instance x="160" y="2064" name="XLXI_5" orien="R90">
        </instance>
        <iomarker fontsize="28" x="192" y="2048" name="CLK_50MHZ" orien="R270" />
        <instance x="176" y="256" name="XLXI_15" orien="R0">
        </instance>
        <branch name="XLXN_47">
            <wire x2="2448" y1="1152" y2="1152" x1="2000" />
            <wire x2="2448" y1="1152" y2="1216" x1="2448" />
            <wire x2="2464" y1="1216" y2="1216" x1="2448" />
        </branch>
        <branch name="XLXN_48">
            <wire x2="2448" y1="1232" y2="1232" x1="2000" />
            <wire x2="2448" y1="1232" y2="1344" x1="2448" />
            <wire x2="2464" y1="1344" y2="1344" x1="2448" />
        </branch>
        <branch name="XLXN_52(13:0)">
            <wire x2="160" y1="192" y2="336" x1="160" />
            <wire x2="176" y1="336" y2="336" x1="160" />
            <wire x2="2304" y1="192" y2="192" x1="160" />
            <wire x2="2304" y1="192" y2="1392" x1="2304" />
            <wire x2="2304" y1="1392" y2="1392" x1="2000" />
        </branch>
        <branch name="XLXN_53(2:0)">
            <wire x2="768" y1="336" y2="336" x1="752" />
            <wire x2="768" y1="336" y2="1408" x1="768" />
            <wire x2="1616" y1="1408" y2="1408" x1="768" />
        </branch>
        <branch name="XLXN_54(9:0)">
            <wire x2="1568" y1="976" y2="1280" x1="1568" />
            <wire x2="1616" y1="1280" y2="1280" x1="1568" />
            <wire x2="2944" y1="976" y2="976" x1="1568" />
            <wire x2="2944" y1="976" y2="1408" x1="2944" />
            <wire x2="2944" y1="1408" y2="1408" x1="2928" />
        </branch>
        <branch name="XLXN_55(9:0)">
            <wire x2="1616" y1="1344" y2="1344" x1="1536" />
            <wire x2="1536" y1="1344" y2="1568" x1="1536" />
            <wire x2="2944" y1="1568" y2="1568" x1="1536" />
            <wire x2="2944" y1="1472" y2="1472" x1="2928" />
            <wire x2="2944" y1="1472" y2="1568" x1="2944" />
        </branch>
        <instance x="1776" y="832" name="XLXI_18" orien="R0">
        </instance>
        <instance x="1616" y="1440" name="XLXI_16" orien="R0">
        </instance>
        <branch name="XLXN_49">
            <wire x2="2224" y1="1312" y2="1312" x1="2000" />
            <wire x2="2224" y1="1312" y2="1472" x1="2224" />
            <wire x2="2448" y1="1472" y2="1472" x1="2224" />
            <wire x2="2464" y1="1472" y2="1472" x1="2448" />
        </branch>
        <instance x="1472" y="800" name="XLXI_19" orien="R0" />
        <branch name="XLXN_75">
            <wire x2="1536" y1="448" y2="672" x1="1536" />
            <wire x2="1664" y1="448" y2="448" x1="1536" />
            <wire x2="1776" y1="448" y2="448" x1="1664" />
            <wire x2="1664" y1="448" y2="768" x1="1664" />
            <wire x2="1776" y1="768" y2="768" x1="1664" />
        </branch>
        <branch name="PS2_DATA">
            <wire x2="2400" y1="800" y2="800" x1="2208" />
        </branch>
        <iomarker fontsize="28" x="2400" y="800" name="PS2_DATA" orien="R0" />
        <branch name="PS2_CLK">
            <wire x2="2400" y1="736" y2="736" x1="2208" />
        </branch>
        <iomarker fontsize="28" x="2400" y="736" name="PS2_CLK" orien="R0" />
        <branch name="XLXN_78">
            <wire x2="1616" y1="1472" y2="1472" x1="1552" />
            <wire x2="1552" y1="1472" y2="1552" x1="1552" />
            <wire x2="2288" y1="1552" y2="1552" x1="1552" />
            <wire x2="2224" y1="288" y2="288" x1="2208" />
            <wire x2="2288" y1="288" y2="288" x1="2224" />
            <wire x2="2288" y1="288" y2="1552" x1="2288" />
        </branch>
        <branch name="SW0">
            <wire x2="1360" y1="896" y2="896" x1="1296" />
            <wire x2="1296" y1="896" y2="992" x1="1296" />
            <wire x2="1408" y1="992" y2="992" x1="1296" />
            <wire x2="1408" y1="992" y2="1216" x1="1408" />
            <wire x2="1600" y1="1216" y2="1216" x1="1408" />
            <wire x2="1616" y1="1216" y2="1216" x1="1600" />
            <wire x2="1408" y1="1216" y2="1216" x1="1296" />
        </branch>
        <iomarker fontsize="28" x="1296" y="1216" name="SW0" orien="R180" />
        <instance x="1360" y="928" name="XLXI_20" orien="R0" />
        <branch name="XLXN_81">
            <wire x2="1648" y1="896" y2="896" x1="1584" />
            <wire x2="1648" y1="608" y2="896" x1="1648" />
            <wire x2="1776" y1="608" y2="608" x1="1648" />
        </branch>
        <branch name="XLXN_87">
            <wire x2="176" y1="528" y2="528" x1="112" />
            <wire x2="112" y1="528" y2="1696" x1="112" />
            <wire x2="336" y1="1696" y2="1696" x1="112" />
            <wire x2="336" y1="1696" y2="2496" x1="336" />
            <wire x2="832" y1="2496" y2="2496" x1="336" />
            <wire x2="192" y1="2448" y2="2496" x1="192" />
            <wire x2="336" y1="2496" y2="2496" x1="192" />
            <wire x2="1776" y1="288" y2="288" x1="832" />
            <wire x2="832" y1="288" y2="1088" x1="832" />
            <wire x2="2464" y1="1088" y2="1088" x1="832" />
            <wire x2="832" y1="1088" y2="1152" x1="832" />
            <wire x2="832" y1="1152" y2="1856" x1="832" />
            <wire x2="832" y1="1856" y2="2176" x1="832" />
            <wire x2="832" y1="2176" y2="2496" x1="832" />
            <wire x2="1616" y1="1152" y2="1152" x1="832" />
        </branch>
    </sheet>
</drawing>