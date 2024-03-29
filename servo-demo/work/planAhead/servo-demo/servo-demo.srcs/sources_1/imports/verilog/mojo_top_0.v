/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [-1:0] servo,
    output reg [-1:0] servo_en
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_servo_controller_servo;
  reg [16-1:0] M_servo_controller_position;
  servo_2 servo_controller (
    .clk(clk),
    .rst(rst),
    .position(M_servo_controller_position),
    .servo(M_servo_controller_servo)
  );
  wire [17-1:0] M_ctr_value;
  counter_3 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h11;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    servo_en = 8'h11;
    M_servo_controller_position = M_ctr_value[0+15-:16] ^ ({5'h10{M_ctr_value[16+0-:1]}});
    servo = M_servo_controller_servo;
  end
endmodule
