library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity crc_hw_test_vhdl is
  port (
    clk               : in  std_logic;
    rst               : in  std_logic;
    crc_en            : in  std_logic;
    data              : in  std_logic_vector(15 downto 0); -- must be divisible by 8
    checksum1         : out std_logic_vector(7 downto 0); -- length of poly_i - 1
    checksum2         : out std_logic_vector(7 downto 0) -- length of poly_i - 1
    );
end crc_hw_test_vhdl;

architecture rtl of crc_hw_test_vhdl is

  constant   POLY_WIDTH   : integer := 8;
  constant   POLY         : std_logic_vector(POLY_WIDTH-1 downto 0)   := x"af";
  constant   INIT         : std_logic_vector(POLY_WIDTH-1 downto 0)   := x"00";
  constant   REFLECT      : std_logic := '0';
  constant   XOROUT       : std_logic_vector(POLY_WIDTH-1 downto 0)   := x"00";

----------------------------------------------------------------------------------------------------
begin  -- architecture
-------------------------------------------------------------------------------------------------       

  generic_crc_vhdl : entity work.generic_crc
    generic map (
      Polynomial        => POLY,          -- std_logic_vector := "100000111";-- default = z^8 + z^2 + z + 1
      InitialConditions => INIT,          -- std_logic_vector := "0";
      ReflectIO         => REFLECT,
      FinalXOR          => XOROUT         -- std_logic_vector := "0";
      )
    port map (
      clk               => clk,           -- in  std_logic;
      rst               => rst,           -- in  std_logic;
      crc_en            => crc_en,        -- in  std_logic;
      data              => data,          -- in  std_logic_vector
      checksum          => checksum1,      -- out std_logic_vector
      checksum_rdy      => open   -- out std_logic
      );

  crc_parallel_verilog : entity work.crc_parallel
    generic map (
      POLY        => POLY,
      INIT        => INIT,
      REFLECT     => REFLECT,
      XOR_OUT     => XOROUT,
      DATA_WIDTH  => 16
      )
    port map (
      clk               => clk,           -- in  std_logic;
      reset_n           => not rst,           -- in  std_logic;
      data_i            => data,          -- in  std_logic_vector
      data_valid_i      => crc_en, 
      crc_o             => checksum2      -- out std_logic_vector
      );



end architecture rtl;
