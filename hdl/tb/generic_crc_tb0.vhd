--
--
library ieee, crc_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity generic_crc_tb is
end entity generic_crc_tb;

architecture bhv of generic_crc_tb is
-- constants

-- types

-- signals
signal clk          : std_logic := '0';
signal clk_n        : std_logic;
signal rst          : std_logic := '1';
signal crc_en       : std_logic := '0';

signal checksum_rdy : std_logic;

--constant poly         : std_logic_vector := "1100000111";
--constant poly         : std_logic_vector := "00000111";
constant poly         : std_logic_vector := x"04C11DB7";
constant init         : std_logic_vector := x"ffffffff"; --ffffffff
constant refin        : std_logic        := '1';
constant refout       : std_logic        := '1';
constant xorout       : std_logic_vector := x"00000000"; --00000000

constant data         : std_logic_vector := x"45ababab99";

--signal checksum     : std_logic_vector((poly'length - 2) downto 0);
signal checksum     : std_logic_vector((poly'length - 1) downto 0);
----------------------------------------------------------------------------------------------------
begin  -- architecture
----------------------------------------------------------------------------------------------------
clk   <= not clk after 2.5 ns;        -- 200mhz
clk_n <= not clk;

process
begin
  wait for 100 ns;
  rst    <= not rst;
  wait for 20 ns;
  crc_en <= '1';
  wait for 10 ns;
  crc_en <= '0';

 -- if poly'ascending = true then
 --   report "*** true*****";
 -- else
 --   report "*** false*****";
 -- end if;
  

  wait;
end process;


generic_crc : entity crc_lib.generic_crc
  generic map (
    Polynomial        => poly,          -- std_logic_vector := "100000111";-- default = z^8 + z^2 + z + 1
    InitialConditions => init,          -- std_logic_vector := "0";
    DirectMethod      => '1',           -- std_logic := '0';
    ReflectInputBytes => refin,         -- std_logic := '0';
    ReflectChecksums  => refout,        -- std_logic := '0';
    FinalXOR          => xorout,        -- std_logic_vector := "0";
    ChecksumsPerFrame => 1              -- integer := 1
    )
  port map (
    clk               => clk,           -- in  std_logic;
    rst               => rst,           -- in  std_logic;
    crc_en            => crc_en,        -- in  std_logic;
    data              => data,          -- in  std_logic_vector
    checksum          => checksum,      -- out std_logic_vector
    checksum_rdy      => checksum_rdy   -- out std_logic
    );



end architecture bhv;
