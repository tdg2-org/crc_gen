//

`timescale 1ns / 1ps  // <time_unit>/<time_precision>
  // time_unit: measurement of delays / simulation time (#10 = 10<time_unit>)
  // time_precision: how delay values are rounded before being used in simulation (degree of accuracy of the time unit)

//-------------------------------------------------------------------------------------------------
//
//-------------------------------------------------------------------------------------------------

module generic_crc_tb ;

  logic clk=0, rstn=0, rst, start, crc_en;

  //always #2 clk = ~clk; // 250mhz period = 4ns, invert every 2ns
  always #5 clk = ~clk; // 100mhz period = 10ns, invert every 5ns

  initial begin
    rstn <= 0;
    #20;
    rstn <= 1;
  end
  assign rst = !rstn;

  localparam DATA_WIDTH       = 48;
  localparam POLY_WIDTH       = 32;
  localparam [DATA_WIDTH-1:0] data    = 'hAB5766123dda;
  localparam [POLY_WIDTH-1:0] POLY    = 'h000000af;
  localparam [POLY_WIDTH-1:0] INIT    = 'h0;
  localparam REFLECT                  = 0;
  localparam [POLY_WIDTH-1:0] XOROUT  = 'h0;

  crc_parallel #(
    .POLY         (POLY),       
    .INIT         (INIT),
    .REFLECT      (REFLECT),          
    .XOR_OUT      (XOROUT),   
    .DATA_WIDTH   ($size(data)) 
  ) crc_parallel (
    .clk          (clk      ),
    .reset_n      (rstn     ),
    .data_i       (data     ),
    .data_valid_i (crc_en   ),
    .crc_o        (         )
);


//-------------------------------------------------------------------------------------------------
//
//-------------------------------------------------------------------------------------------------


initial begin 
  crc_en = 0;
  wait(rst==0);
//  #200ns;tready=1;
//  wait(axil_done == 1);
  #20ns;start_en;
  #10 crc_en = 1;
  #10 crc_en = 0;

end


task start_en;
  begin 
    @(posedge clk); start <= 1;
    @(posedge clk); start <= 0;
  end 
endtask
  

endmodule