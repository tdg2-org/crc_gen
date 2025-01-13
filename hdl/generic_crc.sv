


module crc_parallel #(
    parameter POLY        = 8'h07,
    parameter INIT        = 8'h00,
    parameter REFLECT     = 0,
    parameter XOR_OUT     = 8'h00,
    parameter DATA_WIDTH  = 8  // Width of the input data block
) (
    input  logic                    clk,
    input  logic                    reset_n,
    input  logic [DATA_WIDTH-1:0]   data_i,
    input  logic                    data_valid_i,
    output logic [$size(POLY)-1:0]  crc_o
);

    // Internal signals
    logic [DATA_WIDTH-1:0]  data,data2;
    logic [$size(POLY)-1:0] crc_out,crc_comb,checksum;

    always_comb begin 
      integer x;
      if (REFLECT) begin 
        for (x = 0; x < DATA_WIDTH; x = x + 8) begin 
          data[x +: 8] = flipVec(data_i[x +: 8]);
        end 
      end
      else  data = data_i;
    end

    // Generate the CRC in a combinational logic block
    always_comb begin
        integer i;
        logic [$size(POLY)-1:0] crc;

        crc = INIT;  // Initial CRC value

        // Process each bit of the input data block
        for (i = DATA_WIDTH-1; i >= 0; i = i - 1) begin
            crc = crc_next(crc, data[i]);
        end

        crc_comb = crc;
    end

    // Sequential logic to register the CRC output
    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            checksum <= '0;
        end else if (data_valid_i) begin
            checksum <= crc_comb;
        end
    end

    always_comb begin 
      integer x;
      if (REFLECT) begin
        for (x = 0; x < $size(POLY); x = x + 8) begin 
          crc_out[$bits(checksum) - 8 - x +: 8] = flipVec(checksum[x +: 8]); // reflect bits in each byte, and swap bytes
        end 
      end 
      else  crc_out = checksum;
    end

    assign crc_o = crc_out ^ XOR_OUT;

//-------------------------------------------------------------------------------------------------
// flip bits 
//-------------------------------------------------------------------------------------------------
    function automatic logic [7:0] flipVec(
      input logic [7:0] data
    );
      logic [7:0] flipped;
      integer x;

      begin 
        for (x = 0; x < 8; x = x + 1) begin 
          flipped[x] = data[7-x];
        end
        return flipped;
      end  

    endfunction

//-------------------------------------------------------------------------------------------------
// crc
//-------------------------------------------------------------------------------------------------
    // Function to calculate the next CRC value for a single bit
    function automatic logic [$size(POLY)-1:0] crc_next(
        input logic [$size(POLY)-1:0] crc_in,
        input logic       data_bit
    );
        logic [$size(POLY)-1:0] crc;
        logic       crc_msb;

        begin
            crc_msb = crc_in[$size(POLY)-1] ^ data_bit;
            crc     = {crc_in[$size(POLY)-2:0], 1'b0};

            if (crc_msb) begin
                crc = crc ^ POLY;  // XOR with polynomial
            end

            return crc;
        end
    endfunction

endmodule