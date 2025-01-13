-- https://www.texttool.com/crc-online
-- INPUT VALUE = 0x5
--
--  Algorithm	                  Result	        Check	          Poly	          Init	    RefIn	  RefOut	      XorOut
--  
--  CRC-8	                      0x"6B"  	      0x"F4"  	      0x"07"  	      0x"00"	  false	  false 	      0x"00"
--  CRC-8/CDMA2000	            0x"1A"  	      0x"DA"  	      0x"9B"  	      0x"FF"	  false	  false 	      0x"00"
--  CRC-8/DARC	                0x"8D"  	      0x"15"  	      0x"39"  	      0x"00"	  true	  true  	      0x"00"
--  CRC-8/DVB-S2	              0x"7F"  	      0x"BC"  	      0x"D5"  	      0x"00"	  false	  false 	      0x"00"
--  CRC-8/EBU	                  0x"0E"  	      0x"97"  	      0x"1D"  	      0x"FF"	  true	  true  	      0x"00"
--  CRC-8/I-CODE                0x"D9"  	      0x"7E"  	      0x"1D"  	      0x"FD"	  false	  false 	      0x"00"
--  CRC-8/ITU	                  0x"3E"  	      0x"A1"  	      0x"07"  	      0x"00"	  false	  false 	      0x"55"
--  CRC-8/MAXIM	                0x"4F"  	      0x"A1"  	      0x"31"  	      0x"00"	  true	  true  	      0x"00"
--  CRC-8/ROHC	                0x"2F"  	      0x"D0"  	      0x"07"  	      0x"FF"	  true	  true  	      0x"00"
--  CRC-8/WCDMA	                0x"E6"  	      0x"25"  	      0x"9B"  	      0x"00"	  true	  true  	      0x"00"
--  
--  CRC-16/CCITT-FALSE        0x"4B7A"  	    0x"29B1"  	    0x"1021"  	    0x"FFFF"	  false	  false 	    0x"0000"
--  CRC-16/ARC	              0x"25B4"        0x"BB3D"  	    0x"8005"  	    0x"0000"	  true	  true  	    0x"0000"
--  CRC-16/AUG-CCITT	        0x"ABB8"  	    0x"E5CC"  	    0x"1021"  	    0x"1D0F"	  false	  false 	    0x"0000"
--  CRC-16/BUYPASS	          0x"8372"  	    0x"FEE8"  	    0x"8005"  	    0x"0000"	  false	  false 	    0x"0000"
--  CRC-16/CDMA2000	          0x"9A83"  	    0x"4C06"  	    0x"C867"  	    0x"FFFF"	  false	  false 	    0x"0000"
--  CRC-16/DDS-110	          0x"5B72"  	    0x"9ECF"  	    0x"8005"  	    0x"800D"	  false	  false 	    0x"0000"
--  CRC-16/DECT-R	            0x"B82B"  	    0x"007E"  	    0x"0589"  	    0x"0000"	  false	  false 	    0x"0001"
--  CRC-16/DECT-X	            0x"B82A"  	    0x"007F"  	    0x"0589"  	    0x"0000"	  false	  false 	    0x"0000"
--  CRC-16/DNP	              0x"4535"  	    0x"EA82"  	    0x"3D65"  	    0x"0000"	  true	  true  	    0x"FFFF"
--  CRC-16/EN-13757	          0x"F455"  	    0x"C2B7"  	    0x"3D65"  	    0x"0000"	  false	  false 	    0x"FFFF"
--  CRC-16/GENIBUS	          0x"B485"  	    0x"D64E"  	    0x"1021"  	    0x"FFFF"	  false	  false 	    0x"FFFF"
--  CRC-16/MAXIM	            0x"DA4B"  	    0x"44C2"  	    0x"8005"  	    0x"0000"	  true	  true  	    0x"FFFF"
--  CRC-16/MCRF4XX	          0x"5AA1"  	    0x"6F91"  	    0x"1021"  	    0x"FFFF"	  true	  true  	    0x"0000"
--  CRC-16/RIELLO	            0x"6C3E"  	    0x"63D0"  	    0x"1021"  	    0x"B2AA"	  true	  true  	    0x"0000"
--  CRC-16/T10-DIF	          0x"1D45"  	    0x"D0DB"  	    0x"8BB7"  	    0x"0000"	  false	  false 	    0x"0000"
--  CRC-16/TELEDISK	          0x"FD47"  	    0x"0FB3"  	    0x"A097"  	    0x"0000"	  false	  false 	    0x"0000"
--  CRC-16/TMS37157	          0x"44AB"  	    0x"26B1"  	    0x"1021"  	    0x"89EC"	  true	  true  	    0x"0000"
--  CRC-16/USB	              0x"DA6F"  	    0x"B4C8"  	    0x"8005"  	    0x"FFFF"	  true	  true  	    0x"FFFF"
--  CRC-A	                    0x"6A7F"        0x"BF05"  	    0x"1021"  	    0x"C6C6"	  true	  true  	    0x"0000"
--  CRC-16/KERMIT	            0x"6A29"  	    0x"2189"  	    0x"1021"  	    0x"0000"	  true	  true  	    0x"0000"
--  CRC-16/MODBUS	            0x"2590"  	    0x"4B37"  	    0x"8005"  	    0x"FFFF"	  true	  true  	    0x"0000"
--  CRC-16/X-25	              0x"A55E"  	    0x"906E"  	    0x"1021"  	    0x"FFFF"	  true	  true  	    0x"FFFF"
--  CRC-16/XMODEM	            0x"5A76"  	    0x"31C3"  	    0x"1021"  	    0x"0000"	  false	  false 	    0x"0000"
--  
--  CRC-32	              0x"55404551"  	0x"CBF43926"  	0x"04C11DB7"  	0x"FFFFFFFF"	  true	  true  	0x"FFFFFFFF"
--  CRC-32/BZIP2	        0x"7E68D2A4"  	0x"FC891918"  	0x"04C11DB7"  	0x"FFFFFFFF"	  false	  false 	0x"FFFFFFFF"
--  CRC-32C	              0x"C3989B4C"  	0x"E3069283"  	0x"1EDC6F41"  	0x"FFFFFFFF"	  true	  true  	0x"FFFFFFFF"
--  CRC-32D	              0x"778BBC7E"  	0x"87315576"  	0x"A833982B"  	0x"FFFFFFFF"	  true	  true  	0x"FFFFFFFF"
--  CRC-32/JAMCRC	        0x"AABFBAAE"  	0x"340BC6D9"  	0x"04C11DB7"  	0x"FFFFFFFF"	  true	  true  	0x"00000000"
--  CRC-32/MPEG-2	        0x"81972D5B"  	0x"0376E6E7"  	0x"04C11DB7"  	0x"FFFFFFFF"	  false	  false 	0x"00000000"
--  CRC-32/POSIX	        0x"39786938"  	0x"765E7680"  	0x"04C11DB7"  	0x"00000000"	  false	  false 	0x"FFFFFFFF"
--  CRC-32Q	              0x"E5997626"  	0x"3010BF7F"  	0x"814141AB"  	0x"00000000"	  false	  false 	0x"00000000"
--  CRC-32/XFER 	        0x"8EE76DB6"  	0x"BD0BE338"  	0x"000000AF"  	0x"00000000"	  false	  false 	0x"00000000"
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------

--Algorithm,  CRC-8,CRC-8/CDMA2000,CRC-8/DARC,CRC-8/DVB-S2,CRC-8/EBU,CRC-8/I-CODE,CRC-8/ITU,CRC-8/MAXIM,CRC-8/ROHC,CRC-8/WCDMA 
--Result,     x"1B",x"21",x"83",x"2B",x"A6",x"97",x"4E",x"3F",x"59",x"F6"
--Check,      x"F4",x"DA",x"15",x"BC",x"97",x"7E",x"A1",x"A1",x"D0",x"25"
--Poly,       x"07",x"9B",x"39",x"D5",x"1D",x"1D",x"07",x"31",x"07",x"9B"
--Init,       x"00",x"FF",x"00",x"00",x"FF",x"FD",x"00",x"00",x"FF",x"00"
--XorOut,     x"00",x"00",x"00",x"00",x"00",x"00",x"55",x"00",x"00",x"00"
--RefIn,      '0','0','1','0','1','0','0','1','1','1'
--RefOut,     '0','0','1','0','1','0','0','1','1','1'
--  
--Algorithm,  CRC-16/CCITT-FALS,CRC-16/ARC,CRC-16/AUG-CCITT,CRC-16/BUYPASS,CRC-16/CDMA2000,CRC-16/DDS-110,CRC-16/DECT-R,CRC-16/DECT-X,CRC-16/DNP,CRC-16/EN-13757,CRC-16/GENIBUS,CRC-16/MAXIM,CRC-16/MCRF4XX,CRC-16/RIELLO,CRC-16/T10-DIF,CRC-16/TELEDISK,CRC-16/TMS37157,CRC-16/USB,CRC-A,CRC-16/KERMIT,CRC-16/MODBUS,CRC-16/X-25,CRC-16/XMODEM
--Result,     x"B155",x"03C0",x"9C39",x"001E",x"1259",x"8E1D",x"13AC",x"13AD",x"10D9",x"370E",x"4EAA",x"FC3F",x"582A",x"CE19",x"39B2",x"C372",x"D29A",x"BC80",x"0653",x"57AD",x"437F",x"A7D5",x"50A5"
--Check,      x"29B1",x"BB3D",x"E5CC",x"FEE8",x"4C06",x"9ECF",x"007E",x"007F",x"EA82",x"C2B7",x"D64E",x"44C2",x"6F91",x"63D0",x"D0DB",x"0FB3",x"26B1",x"B4C8",x"BF05",x"2189",x"4B37",x"906E",x"31C3"
--Poly,       x"1021",x"8005",x"1021",x"8005",x"C867",x"8005",x"0589",x"0589",x"3D65",x"3D65",x"1021",x"8005",x"1021",x"1021",x"8BB7",x"A097",x"1021",x"8005",x"1021",x"1021",x"8005",x"1021",x"1021"
--Init,       x"FFFF",x"0000",x"1D0F",x"0000",x"FFFF",x"800D",x"0000",x"0000",x"0000",x"0000",x"FFFF",x"0000",x"FFFF",x"B2AA",x"0000",x"0000",x"89EC",x"FFFF",x"C6C6",x"0000",x"FFFF",x"FFFF",x"0000"
--XorOut,     x"0000",x"0000",x"0000",x"0000",x"0000",x"0000",x"0001",x"0000",x"FFFF",x"FFFF",x"FFFF",x"FFFF",x"0000",x"0000",x"0000",x"0000",x"0000",x"FFFF",x"0000",x"0000",x"0000",x"FFFF",x"0000"
--RefIn,      '0','1','0','0','0','0','0','0','1','0','0','1','1','1','0','0','1','1','1','1','1','1','0
--RefOut,     '0','1','0','0','0','0','0','0','1','0','0','1','1','1','0','0','1','1','1','1','1','1','0
--  
--Algorithm,  CRC-32,CRC-32/BZIP2,CRC-32C,CRC-32D,CRC-32/JAMCRC,CRC-32/MPEG-2,CRC-32/POSIX,CRC-32Q,CRC-32/XFER ,
--Result,     x"A2681B02",x"A6322B20",x"678C474D",x"FAF0A950",x"5D97E4FD",x"59CDD4DF",x"E83A9494",x"078785FA",x"00000213"
--Check,      x"CBF43926",x"FC891918",x"E3069283",x"87315576",x"340BC6D9",x"0376E6E7",x"765E7680",x"3010BF7F",x"BD0BE338" 
--Poly,       x"04C11DB7",x"04C11DB7",x"1EDC6F41",x"A833982B",x"04C11DB7",x"04C11DB7",x"04C11DB7",x"814141AB",x"000000AF" 
--Init,       x"FFFFFFFF",x"FFFFFFFF",x"FFFFFFFF",x"FFFFFFFF",x"FFFFFFFF",x"FFFFFFFF",x"00000000",x"00000000",x"00000000" 
--XorOut,     x"FFFFFFFF",x"FFFFFFFF",x"FFFFFFFF",x"FFFFFFFF",x"00000000",x"00000000",x"FFFFFFFF",x"00000000",x"00000000" 
--RefIn,      '1','0','1','1','1','0','0','0','0' 
--RefOut,     '1','0','1','1','1','0','0','0','0' 

--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package crc_pkg is

  type dataArray  is array (natural range <>) of std_logic_vector;
  type boolArray  is array (natural range <>) of std_logic;

  type innerArray is array (natural range <>) of std_logic_vector;
  type csumArray  is array (natural range <>) of InnerArray;

  constant CRC8_MAX   : natural := 10;
  constant CRC16_MAX  : natural := 23;
  constant CRC32_MAX  : natural := 9;
  constant TESTS_MAX  : natural := 3;

  type crc8_rec is record 
    chk  : dataArray(0 to CRC8_MAX-1)(7 downto 0);
    poly : dataArray(0 to CRC8_MAX-1)(7 downto 0);
    init : dataArray(0 to CRC8_MAX-1)(7 downto 0);
    fxor : dataArray(0 to CRC8_MAX-1)(7 downto 0);
    refi : boolArray(0 to CRC8_MAX-1);
    refo : boolArray(0 to CRC8_MAX-1);
  end record crc8_rec;

  type crc16_rec is record 
    chk  : dataArray(0 to CRC16_MAX-1)(15 downto 0);
    poly : dataArray(0 to CRC16_MAX-1)(15 downto 0);
    init : dataArray(0 to CRC16_MAX-1)(15 downto 0);
    fxor : dataArray(0 to CRC16_MAX-1)(15 downto 0);
    refi : boolArray(0 to CRC16_MAX-1);
    refo : boolArray(0 to CRC16_MAX-1);
  end record crc16_rec;

  type crc32_rec is record 
    chk  : dataArray(0 to CRC32_MAX-1)(31 downto 0);
    poly : dataArray(0 to CRC32_MAX-1)(31 downto 0);
    init : dataArray(0 to CRC32_MAX-1)(31 downto 0);
    fxor : dataArray(0 to CRC32_MAX-1)(31 downto 0);
    refi : boolArray(0 to CRC32_MAX-1);
    refo : boolArray(0 to CRC32_MAX-1);
  end record crc32_rec;

  constant CRC8_CONFIG : crc8_rec := (
    chk  => (x"F4", x"DA",  x"15",  x"BC",  x"97",  x"7E",  x"A1",  x"A1",  x"D0",  x"25"),
    poly => (x"07", x"9B",  x"39",  x"D5",  x"1D",  x"1D",  x"07",  x"31",  x"07",  x"9B"),
    init => (x"00", x"FF",  x"00",  x"00",  x"FF",  x"FD",  x"00",  x"00",  x"FF",  x"00"),
    fxor => (x"00", x"00",  x"00",  x"00",  x"00",  x"00",  x"55",  x"00",  x"00",  x"00"),
    refi => ('0',     '0',    '1',    '0',    '1',    '0',    '0',    '1',    '1',    '1'),
    refo => ('0',     '0',    '1',    '0',    '1',    '0',    '0',    '1',    '1',    '1')
    --        0        1       2       3       4       5       6       7       8       9
  );

  constant CRC16_CONFIG : crc16_rec := (
    chk  => (x"29B1",x"BB3D",x"E5CC",x"FEE8",x"4C06",x"9ECF",x"007E",x"007F",x"EA82",x"C2B7",x"D64E",x"44C2",x"6F91",x"63D0",x"D0DB",x"0FB3",x"26B1",x"B4C8",x"BF05",x"2189",x"4B37",x"906E",x"31C3"),
    poly => (x"1021",x"8005",x"1021",x"8005",x"C867",x"8005",x"0589",x"0589",x"3D65",x"3D65",x"1021",x"8005",x"1021",x"1021",x"8BB7",x"A097",x"1021",x"8005",x"1021",x"1021",x"8005",x"1021",x"1021"),
    init => (x"FFFF",x"0000",x"1D0F",x"0000",x"FFFF",x"800D",x"0000",x"0000",x"0000",x"0000",x"FFFF",x"0000",x"FFFF",x"B2AA",x"0000",x"0000",x"89EC",x"FFFF",x"C6C6",x"0000",x"FFFF",x"FFFF",x"0000"),
    fxor => (x"0000",x"0000",x"0000",x"0000",x"0000",x"0000",x"0001",x"0000",x"FFFF",x"FFFF",x"FFFF",x"FFFF",x"0000",x"0000",x"0000",x"0000",x"0000",x"FFFF",x"0000",x"0000",x"0000",x"FFFF",x"0000"),
    refi => ('0','1','0','0','0','0','0','0','1','0','0','1','1','1','0','0','1','1','1','1','1','1','0'),
    refo => ('0','1','0','0','0','0','0','0','1','0','0','1','1','1','0','0','1','1','1','1','1','1','0')
    --        0   1   2   3   4   5   6   7   8   9   10  11  12  13  14  15  16  17  18  19  20  21  22
  );

  constant CRC32_CONFIG : crc32_rec := (
    chk  => (x"CBF43926",x"FC891918",x"E3069283",x"87315576",x"340BC6D9",x"0376E6E7",x"765E7680",x"3010BF7F",x"BD0BE338"),
    poly => (x"04C11DB7",x"04C11DB7",x"1EDC6F41",x"A833982B",x"04C11DB7",x"04C11DB7",x"04C11DB7",x"814141AB",x"000000AF"),
    init => (x"FFFFFFFF",x"FFFFFFFF",x"FFFFFFFF",x"FFFFFFFF",x"FFFFFFFF",x"FFFFFFFF",x"00000000",x"00000000",x"00000000"),
    fxor => (x"FFFFFFFF",x"FFFFFFFF",x"FFFFFFFF",x"FFFFFFFF",x"00000000",x"00000000",x"FFFFFFFF",x"00000000",x"00000000"),
    refi => ('1','0','1','1','1','0','0','0','0'),
    refo => ('1','0','1','1','1','0','0','0','0')
    --        0   1   2   3   4   5   6   7   8
  );

  type data8_test_rec is record 
    data    : dataArray(0 to TESTS_MAX-1)(7 downto 0); -- input value
    csum8   : csumArray(0 to TESTS_MAX-1)(0 to CRC8_MAX-1)(7 downto 0);
    csum16  : csumArray(0 to TESTS_MAX-1)(0 to CRC16_MAX-1)(15 downto 0);
    csum32  : csumArray(0 to TESTS_MAX-1)(0 to CRC32_MAX-1)(31 downto 0);
  end record data8_test_rec;

  constant DATA8_TEST_VALUES : data8_test_rec := (
    data    => (x"05", x"75", x"ab"),
    csum8   => ((x"1B",x"21",x"83",x"2B",x"A6",x"97",x"4E",x"3F",x"59",x"F6"),
                (x"4C",x"BF",x"65",x"40",x"C3",x"CE",x"19",x"C7",x"0D",x"58"),
                (x"58",x"3B",x"F6",x"C8",x"AA",x"90",x"0D",x"8F",x"6B",x"D5")
               ),
    csum16  => ((x"B155",x"03C0",x"9C39",x"001E",x"1259",x"8E1D",x"13AC",x"13AD",x"10D9",x"370E",x"4EAA",x"FC3F",x"582A",x"CE19",x"39B2",x"C372",x"D29A",x"BC80",x"0653",x"57AD",x"437F",x"A7D5",x"50A5"),
                (x"CFC2",x"E7C1",x"E2AE",x"813D",x"5330",x"0F3E",x"9DD5",x"9DD4",x"D843",x"855C",x"303D",x"183E",x"2BAD",x"BD9E",x"1C66",x"0E7B",x"A11D",x"5881",x"75D4",x"242A",x"A77E",x"D452",x"2E32"),
                (x"E571",x"BF41",x"C81D",x"83F9",x"FC9E",x"0DFA",x"5C60",x"5C61",x"D587",x"0AEA",x"1A8E",x"40BE",x"145E",x"826D",x"6BF8",x"006D",x"9EEE",x"0001",x"4A27",x"1BD9",x"FFFE",x"EBA1",x"0481")
               ),

    csum32  => ((x"A2681B02",x"A6322B20",x"678C474D",x"FAF0A950",x"5D97E4FD",x"59CDD4DF",x"E83A9494",x"078785FA",x"00000213"),
                (x"F26D6A3E",x"468636C7",x"16141340",x"8A7F76D8",x"0D9295C1",x"B979C938",x"088E8973",x"CF0F3C83",x"000036C3"),
                (x"930695ED",x"6B93DD24",x"69BF4DCC",x"ABEBC7AE",x"6CF96A12",x"946C22DB",x"259B6290",x"7EBEF51F",x"000046E9")
               )
  );

  type data16_test_rec is record 
    data    : dataArray(0 to TESTS_MAX-1)(15 downto 0); -- input value
    csum8   : csumArray(0 to TESTS_MAX-1)(0 to CRC8_MAX-1)(7 downto 0);
    csum16  : csumArray(0 to TESTS_MAX-1)(0 to CRC16_MAX-1)(15 downto 0);
    csum32  : csumArray(0 to TESTS_MAX-1)(0 to CRC32_MAX-1)(31 downto 0);
  end record data16_test_rec;

  constant DATA16_TEST_VALUES : data16_test_rec := (
    data    => (x"fa05", x"9975", x"1234"),
    csum8   => ((x"8D",x"14",x"4E",x"74",x"B8",x"90",x"D8",x"41",x"8E",x"39"),
                (x"10",x"07",x"6E",x"08",x"B4",x"82",x"45",x"B6",x"13",x"16"),
                (x"F1",x"F1",x"7D",x"AE",x"57",x"CB",x"A4",x"A2",x"07",x"6B")
               ),
    csum16  => ((x"B1A0",x"A382",x"286F",x"9C11",x"FB94",x"9C35",x"6973",x"6972",x"F8AD",x"5837",x"4E5F",x"5C7D",x"266D",x"25E3",x"1413",x"0659",x"936C",x"EC7C",x"C875",x"D6D5",x"1383",x"D992",x"ACAF"),
                (x"914E",x"B7AB",x"0881",x"D737",x"C841",x"D713",x"4989",x"4988",x"D89E",x"3E5C",x"6EB1",x"4854",x"1AD7",x"1959",x"1902",x"28F7",x"AFD6",x"F855",x"F4CF",x"EA6F",x"07AA",x"E528",x"8C41"),
                (x"0EC9",x"770D",x"9706",x"ECBB",x"15D1",x"EC9F",x"4C57",x"4C56",x"798E",x"782C",x"F136",x"88F2",x"213E",x"22B0",x"56DD",x"89F5",x"943F",x"38F3",x"CF26",x"D186",x"C70C",x"DEC1",x"13C6")
               ),

    csum32  => ((x"DFE0EF47",x"310F3455",x"3A5BBEE6",x"F662AC98",x"201F10B8",x"CEF0CBAA",x"31B85028",x"44288F64",x"00677413"),
                (x"C135A61F",x"C2B52C0B",x"FFB86774",x"065618A8",x"3ECA59E0",x"3D4AD3F4",x"C2024876",x"A5F23D40",x"005891C3"),
                (x"18999699",x"88DD85D2",x"1E986813",x"D141112B",x"E7666966",x"77227A2D",x"886AE1AF",x"A3692CD7",x"000BB3AC")
               )
  );

  type data48_test_rec is record 
    data    : dataArray(0 to TESTS_MAX-1)(47 downto 0); -- input value
    csum8   : csumArray(0 to TESTS_MAX-1)(0 to CRC8_MAX-1)(7 downto 0);
    csum16  : csumArray(0 to TESTS_MAX-1)(0 to CRC16_MAX-1)(15 downto 0);
    csum32  : csumArray(0 to TESTS_MAX-1)(0 to CRC32_MAX-1)(31 downto 0);
  end record data48_test_rec;

  constant DATA48_TEST_VALUES : data48_test_rec := (
    data    => (x"fa051234554d", x"c6ddf7001053", x"12345678acbf"),
    csum8   => ((x"67",x"46",x"47",x"EA",x"0E",x"91",x"32",x"23",x"DC",x"54"),
                (x"7D",x"1B",x"52",x"F6",x"02",x"71",x"28",x"BD",x"81",x"74"),
                (x"7B",x"39",x"3F",x"4B",x"5E",x"07",x"2E",x"65",x"66",x"81")
               ),
    csum16  => ((x"BD70",x"8963",x"825E",x"2550",x"EA64",x"2780",x"7FD3",x"7FD2",x"4E5D",x"8B86",x"428F",x"769C",x"EC3F",x"8077",x"629B",x"35EF",x"437B",x"6D9C",x"D3FC",x"E44F",x"9263",x"13C0",x"B360"),
                (x"8CDC",x"FC82",x"B3F2",x"7AD3",x"A428",x"7803",x"88C7",x"88C6",x"36E4",x"D4CF",x"7323",x"037D",x"413F",x"2D77",x"27C1",x"583E",x"EE7B",x"187D",x"7EFC",x"494F",x"E782",x"BEC0",x"82CC"),
                (x"3710",x"971F",x"083E",x"AC82",x"9E54",x"AE52",x"C4B2",x"C4B3",x"AC7B",x"144D",x"C8EF",x"68E0",x"28E2",x"44AA",x"33BD",x"9ECB",x"87A6",x"73E0",x"1721",x"2092",x"8C1F",x"D71D",x"3900")
               ),

    csum32  => ((x"DBF852C8",x"41B3B244",x"5992F0BD",x"1C438E86",x"2407AD37",x"BE4C4DBB",x"7BC90E36",x"502E6718",x"8ED46C23"),
                (x"A407DBE3",x"59A883A6",x"444A50AD",x"F136E86A",x"5BF8241C",x"A6577C59",x"63D23FD4",x"738DF349",x"2F98DDD8"),
                (x"4695281B",x"B57C67AE",x"6BE0B71B",x"1602A139",x"B96AD7E4",x"4A839851",x"8F06DBDC",x"95F76FB3",x"E72DDABF")
               )
  );


end package crc_pkg;





