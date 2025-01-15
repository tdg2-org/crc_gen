-- vhdl wrapper
library ieee,crc_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity generic_crc_wrapper is
  generic (
    Polynomial        : std_logic_vector(7 downto 0)  := "00000111"; -- default = z^8 + z^2 + z + 1 = x"07"
    InitialConditions : std_logic_vector(7 downto 0)  := "0";
    ReflectIO         : std_logic                     := '0';
    FinalXOR          : std_logic_vector(7 downto 0)  := "0"
  );
  port (
    clk               : in  std_logic;
    rst               : in  std_logic;
    crc_en            : in  std_logic;
    data              : in  std_logic_vector(31 downto 0); -- must be divisible by 8
    checksum          : out std_logic_vector(7 downto 0); -- length of poly_i - 1
    checksum_rdy      : out std_logic
  );
end generic_crc_wrapper;

architecture rtl of generic_crc_wrapper is

---------------------------------------------------------------------------------------------------
begin  -- architecture
---------------------------------------------------------------------------------------------------

generic_crc_vhdl : entity crc_lib.generic_crc
  generic map (
    Polynomial        => Polynomial,        -- std_logic_vector := "100000111";-- default = z^8 + z^2 + z + 1
    InitialConditions => InitialConditions, -- std_logic_vector := "0";
    ReflectIO         => ReflectIO,
    FinalXOR          => FinalXOR           -- std_logic_vector := "0";
  )
  port map (
    clk               => clk,           -- in  std_logic;
    rst               => rst,           -- in  std_logic;
    crc_en            => crc_en,        -- in  std_logic;
    data              => data,          -- in  std_logic_vector
    checksum          => checksum,      -- out std_logic_vector
    checksum_rdy      => checksum_rdy   -- out std_logic
  );

end architecture rtl;
