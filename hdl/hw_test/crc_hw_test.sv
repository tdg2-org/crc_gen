

module crc_hw_test (
  input         clk,
  input         rst,
  input         crc_en,
  input  [15:0]  data,
  output [7:0]  checksum1,
  output [7:0]  checksum2
);

  localparam POLY_WIDTH       = 8;
  localparam [POLY_WIDTH-1:0] POLY    = 'haf;
  localparam [POLY_WIDTH-1:0] INIT    = 'h00;
  localparam REFLECT                  = 0;
  localparam [POLY_WIDTH-1:0] XOROUT  = 'h00;

  logic [15:0] data_v;

  assign data_v = data;

  generic_crc #(
      .Polynomial        (POLY    ),
      .InitialConditions (INIT    ),
      .ReflectIO         (REFLECT ),
      .FinalXOR          (XOROUT  )
  ) generic_crc_instVHDL (
      .clk               (clk        ),
      .rst               (rst        ),
      .crc_en            (crc_en     ),
      .data              (data_v       ),
      .checksum          (checksum1  ),
      .checksum_rdy      (           )
  );


  crc_parallel #(
    .POLY         (POLY         ),
    .INIT         (INIT         ),
    .REFLECT      (REFLECT      ),
    .XOR_OUT      (XOROUT       ),
    .DATA_WIDTH   ($size(data)  )
  ) crc_parallel_instVerilog (
    .clk          (clk          ),
    .reset_n      (~rst         ),
    .data_i       (data         ),
    .data_valid_i (crc_en       ),
    .crc_o        (checksum2    )
);



endmodule