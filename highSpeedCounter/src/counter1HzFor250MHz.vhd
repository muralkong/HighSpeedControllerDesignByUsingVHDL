-------------------------------------------------------------------------------
--
-- Title       : counter1HzFor250MHz
-- Design      : 00 highSpeedCounter
-- Author      : USER
-- Company     : whoAmI
--
-------------------------------------------------------------------------------
--
-- File        : counter1HzFor250MHz.vhd
-- Generated   : Sat Sep  7 13:25:45 2024
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description :   250MHz 입력 받아서 1Hz 클럭을 만들어 냄.
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {counter1HzFor250MHz} architecture {kingdom}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;   
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity counter1HzFor250MHz is
	port(
		clk250MHz : in STD_LOGIC;
		nReset : in STD_LOGIC;
		clk1Hz : out STD_LOGIC
		);
end counter1HzFor250MHz;


architecture kingdom of counter1HzFor250MHz is
	
	constant	cntLimit	:	integer := 125000000;
	
	signal	clkCnt	:	integer range 0 to cntLimit - 1 := 0;
	signal	sigClk	:	std_logic;
	
begin
	
	clk1Hz	<= sigClk;
	
	makesigClk	:	process(clk250MHz, nReset, clkCnt, sigClk)
	begin
		if nReset = '0' then
			clkCnt <= 0;
			sigClk <= '0';
		elsif	clk250MHz'event and clk250MHz = '1' then
			if clkCnt = (cntLimit-1) then
				clkCnt <= 0;
				sigClk <= not(sigClk);
			else
				clkCnt <= clkCnt + 1;
			end if;	  
		end if;
	end process;
	
	
end kingdom;
