--
-- find/replace DATA48_TEST_VALUES, DATA8_TEST_VALUES, DATA16_TEST_VALUES
-- need better way to test all at same time

library ieee, crc_lib;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use crc_lib.crc_pkg.all;

entity generic_crc_tb is
end entity generic_crc_tb;

architecture bhv of generic_crc_tb is
-- constants
constant poly         : std_logic_vector := x"04C11DB7";
constant init         : std_logic_vector := x"ffffffff"; --ffffffff
constant refio        : std_logic        := '1';
constant xorout       : std_logic_vector := x"ffffffff"; --00000000
constant data         : std_logic_vector := x"fa051234554d";

-- types
type checkSumArray is array (natural range <>) of std_logic_vector;
type verif8dataType is array (natural range <>) of crc8_rec;

-- signals
signal clk            : std_logic := '0';
signal clk_n          : std_logic;
signal rst            : std_logic := '1';
signal crc_en         : std_logic := '0';
signal checksum       : std_logic_vector((poly'length - 1) downto 0);
signal checksum_rdy   : std_logic;

signal cs8            : csumArray(0 to TESTS_MAX-1)(0 to CRC8_MAX-1)(7 downto 0);
signal cs16           : csumArray(0 to TESTS_MAX-1)(0 to CRC16_MAX-1)(15 downto 0);
signal cs32           : csumArray(0 to TESTS_MAX-1)(0 to CRC32_MAX-1)(31 downto 0);
signal verif8         : dataArray(0 to TESTS_MAX-1)(CRC8_MAX-1 downto 0);
signal verif16        : dataArray(0 to TESTS_MAX-1)(CRC16_MAX-1 downto 0);
signal verif32        : dataArray(0 to TESTS_MAX-1)(CRC32_MAX-1 downto 0);

signal test1          : std_logic_vector(7 downto 0);
signal verif8data     : verif8dataType(0 to TESTS_MAX-1);

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
  test1 <= CRC8_CONFIG.poly(0);
  wait for 10 ns;
  test1 <= CRC8_CONFIG.poly(1);

  wait until (checksum_rdy = '1');
  wait until (checksum_rdy = '0');

  wait for 500 ns;

  for i in 0 to (TESTS_MAX-1) loop 
    for x in 0 to (CRC8_MAX-1) loop 
      --wait until (checksum_rdy = '1');
      if (cs8(i)(x) = DATA48_TEST_VALUES.csum8(i)(x)) then 
--      if (cs8(i)(x) = chksums8(i)(x)) then 
        verif8(i)(x) <= '1';
      else 
        --verif8data(i).poly(x) <= CRC8_CONFIG.poly(x);
        --verif8data(i).init(x) <= CRC8_CONFIG.init(x);
        --verif8data(i).fxor(x) <= CRC8_CONFIG.fxor(x);
        --verif8data(i).refi(x) <= CRC8_CONFIG.refi(x);
        --verif8data(i).refo(x) <= CRC8_CONFIG.refo(x);
        --verif8data(i).chk(x)  <= DATA8_TEST_VALUES.csum8(i)(x);
        
        verif8(i)(x) <= '0';
        report "CRC8 FAILED i:" & integer'image(i) & " x:" & integer'image(x) severity warning;
      end if;
    end loop;
  end loop;
  wait for 1 ns;
  for i in 0 to (TESTS_MAX-1) loop 
    if (AND verif8(i)) then 
      report "CRC8 PASSED iteration:" & integer'image(i) severity note;
    end if; 
  end loop;
  
  for i in 0 to (TESTS_MAX-1) loop 
    for x in 0 to (CRC16_MAX-1) loop 
      if (cs16(i)(x) = DATA48_TEST_VALUES.csum16(i)(x)) then 
        verif16(i)(x) <= '1';
      else 
        verif16(i)(x) <= '0';
        report "CRC16 FAILED i:" & integer'image(i) & " x:" & integer'image(x) severity warning;
      end if;
    end loop;
  end loop;
  wait for 1 ns;
  for i in 0 to (TESTS_MAX-1) loop 
    if (AND verif16(i)) then 
      report "CRC16 PASSED iteration:" & integer'image(i) severity note;
    end if; 
  end loop;

  for i in 0 to (TESTS_MAX-1) loop 
    for x in 0 to (CRC32_MAX-1) loop 
      if (cs32(i)(x) = DATA48_TEST_VALUES.csum32(i)(x)) then 
        verif32(i)(x) <= '1';
      else 
        verif32(i)(x) <= '0';
        report "CRC32 FAILED i:" & integer'image(i) & " x:" & integer'image(x) severity warning;
      end if;
    end loop;
  end loop;
  wait for 1 ns;
  for i in 0 to (TESTS_MAX-1) loop 
    if (AND verif32(i)) then 
      report "CRC32 PASSED iteration:" & integer'image(i) severity note;
    end if; 
  end loop;

  wait;
end process;

  inst0 : entity crc_lib.generic_crc
    generic map (
      Polynomial        => poly,          -- std_logic_vector := "100000111";-- default = z^8 + z^2 + z + 1
      InitialConditions => init,          -- std_logic_vector := "0";
      ReflectIO         => refio,
      FinalXOR          => xorout         -- std_logic_vector := "0";
      )
    port map (
      clk               => clk,           -- in  std_logic;
      rst               => rst,           -- in  std_logic;
      crc_en            => crc_en,        -- in  std_logic;
      data              => data,          -- in  std_logic_vector
      checksum          => checksum,      -- out std_logic_vector
      checksum_rdy      => checksum_rdy   -- out std_logic
      );

gen_crc8_test : for i in 0 to (TESTS_MAX-1) generate 
  gen_crc8_inst : for x in 0 to (CRC8_MAX-1) generate 
    generic_crc : entity crc_lib.generic_crc
      generic map (
        Polynomial        => CRC8_CONFIG.poly(x),
        InitialConditions => CRC8_CONFIG.init(x),
        ReflectIO         => CRC8_CONFIG.refi(x),
        FinalXOR          => CRC8_CONFIG.fxor(x)
        )
      port map (
        clk               => clk,       -- in  std_logic;
        rst               => rst,       -- in  std_logic;
        crc_en            => crc_en,    -- in  std_logic;
        data              => DATA48_TEST_VALUES.data(i),      -- in  std_logic_vector
        checksum          => cs8(i)(x),      -- out std_logic_vector
        checksum_rdy      => open       -- out std_logic
        );
  end generate;
end generate;

gen_crc16_test : for i in 0 to (TESTS_MAX-1) generate 
  gen_crc16_inst : for x in 0 to (CRC16_MAX-1) generate 
    generic_crc : entity crc_lib.generic_crc
      generic map (
        Polynomial        => CRC16_CONFIG.poly(x),
        InitialConditions => CRC16_CONFIG.init(x),
        ReflectIO         => CRC16_CONFIG.refi(x),
        FinalXOR          => CRC16_CONFIG.fxor(x)
        )
      port map (
        clk               => clk,       -- in  std_logic;
        rst               => rst,       -- in  std_logic;
        crc_en            => crc_en,    -- in  std_logic;
        data              => DATA48_TEST_VALUES.data(i),      -- in  std_logic_vector
        checksum          => cs16(i)(x),      -- out std_logic_vector
        checksum_rdy      => open       -- out std_logic
        );
  end generate;
end generate;

gen_crc32_test : for i in 0 to (TESTS_MAX-1) generate 
  gen_crc32_inst : for x in 0 to (CRC32_MAX-1) generate 
    generic_crc : entity crc_lib.generic_crc
      generic map (
        Polynomial        => CRC32_CONFIG.poly(x),
        InitialConditions => CRC32_CONFIG.init(x),
        ReflectIO         => CRC32_CONFIG.refi(x),
        FinalXOR          => CRC32_CONFIG.fxor(x)
        )
      port map (
        clk               => clk,       -- in  std_logic;
        rst               => rst,       -- in  std_logic;
        crc_en            => crc_en,    -- in  std_logic;
        data              => DATA48_TEST_VALUES.data(i),      -- in  std_logic_vector
        checksum          => cs32(i)(x),      -- out std_logic_vector
        checksum_rdy      => open       -- out std_logic
        );
  end generate;
end generate;

end architecture bhv;
