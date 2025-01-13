
module crc_hw_test_tb ;

  logic clk=0, rstn=0, rst, start, crc_en;

  //always #2 clk = ~clk; // 250mhz period = 4ns, invert every 2ns
  always #5 clk = ~clk; // 100mhz period = 10ns, invert every 5ns

  initial begin
    rstn <= 0;
    #20;
    rstn <= 1;
  end
  assign rst = !rstn;

  localparam DATA_WIDTH       = 16;
  localparam [DATA_WIDTH-1:0] data    = 'hAB576612;


  crc_hw_test crc_hw_test_inst(
    .clk        (clk),
    .rst        (rst),
    .crc_en     (crc_en),
    .data       (data),
    .checksum1  (),
    .checksum2  ()
  );


//-------------------------------------------------------------------------------------------------
//
//-------------------------------------------------------------------------------------------------


initial begin 
  crc_en = 0;
  wait(rst==0);
//  #200ns;tready=1;
//  wait(axil_done == 1);
  #10 crc_en = 1;
  #10 crc_en = 0;

end

endmodule