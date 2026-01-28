-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : highSpeedCounter
-- Author      : USER
-- Company     : whoAmI
--
-------------------------------------------------------------------------------
--
-- File        : d:\MyDesigns\05FPGAPart\CenoTech\20240800FPGA4nsStrobe\project4nsStrobe\highSpeedCounter\compile\dcmblocktest.vhd
-- Generated   : Mon Sep  9 15:16:31 2024
-- From        : d:\MyDesigns\05FPGAPart\CenoTech\20240800FPGA4nsStrobe\project4nsStrobe\highSpeedCounter\src\dcmblocktest.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;


-- other libraries declarations
-- synopsys translate_off 
library SPARTAN3A;
library IEEE;
use IEEE.vital_timing.all;
-- synopsys translate_on 

entity DCMBlockTest is
  port(
       inputClk : in std_ulogic;
       nReset : in std_ulogic;
       clk250MHz : out std_ulogic;
       clk25Mhz : out std_ulogic;
       clkOn : out std_ulogic;
       originOut : out std_ulogic
  );
end DCMBlockTest;

architecture DCMBlockTest of DCMBlockTest is

---- Component declarations -----

component DCM_SP
  generic(
-- synopsys translate_off
       FACTORY_JF : BIT_VECTOR := X"C080";
       InstancePath : STRING := "*";
       MsgOn : BOOLEAN := False;
       TimingChecksOn : BOOLEAN := False;
       Xon : BOOLEAN := true;
-- synopsys translate_on
       CLKDV_DIVIDE : REAL := 2.0;
       CLKFX_DIVIDE : INTEGER := 1;
       CLKFX_MULTIPLY : INTEGER := 4;
       CLKIN_DIVIDE_BY_2 : BOOLEAN := FALSE;
       CLKIN_PERIOD : REAL := 0.0;
       CLKOUT_PHASE_SHIFT : STRING := "NONE";
       CLK_FEEDBACK : STRING := "1X";
       DESKEW_ADJUST : STRING := "SYSTEM_SYNCHRONOUS";
       DFS_FREQUENCY_MODE : STRING := "LOW";
       DLL_FREQUENCY_MODE : STRING := "LOW";
       DSS_MODE : STRING := "NONE";
       DUTY_CYCLE_CORRECTION : BOOLEAN := TRUE;
       PHASE_SHIFT : INTEGER := 0;
       STARTUP_WAIT : BOOLEAN := FALSE
  );
  port (
       CLKFB : in std_ulogic := '0';
       CLKIN : in std_ulogic := '0';
       DSSEN : in std_ulogic := '0';
       PSCLK : in std_ulogic := '0';
       PSEN : in std_ulogic := '0';
       PSINCDEC : in std_ulogic := '0';
       RST : in std_ulogic := '0';
       CLK0 : out std_ulogic := '0';
       CLK180 : out std_ulogic := '0';
       CLK270 : out std_ulogic := '0';
       CLK2X : out std_ulogic := '0';
       CLK2X180 : out std_ulogic := '0';
       CLK90 : out std_ulogic := '0';
       CLKDV : out std_ulogic := '0';
       CLKFX : out std_ulogic := '0';
       CLKFX180 : out std_ulogic := '0';
       LOCKED : out std_ulogic := '0';
       PSDONE : out std_ulogic := '0';
       STATUS : out STD_LOGIC_VECTOR(7 downto 0) := "00000000"
  );
end component;
component INV
  port (
       I : in std_ulogic;
       O : out std_ulogic
  );
end component;

---- Signal declarations used on the diagram ----

signal NET257 : std_ulogic;
signal originFB : std_ulogic;

---- Configuration specifications for declared components 

-- synopsys translate_off
for U1 : DCM_SP use entity SPARTAN3A.DCM_SP(dcm_sp_v);
-- synopsys translate_on
-- synopsys translate_off
for U2 : INV use entity SPARTAN3A.INV;
-- synopsys translate_on

begin

----  Component instantiations  ----

U1 : DCM_SP
  generic map (
       CLKFX_DIVIDE => 1,
       CLKFX_MULTIPLY => 5,
       CLKIN_PERIOD => 16.6
  )
  port map(
       CLK0 => originFB,
       CLKDV => clk25MHz,
       CLKFB => originFB,
       CLKFX => clk250MHz,
       CLKIN => inputClk,
       LOCKED => clkOn,
       RST => NET257
  );

U2 : INV
  port map(
       I => nReset,
       O => NET257
  );


---- Terminal assignment ----

    -- Output\buffer terminals
	originOut <= originFB;


end DCMBlockTest;
