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
    output reg [3:0] hdmi1_tmds,
    output reg [3:0] hdmi1_tmdsb,
    input [3:0] hdmi2_tmds,
    input [3:0] hdmi2_tmdsb,
    inout hdmi2_sda,
    input hdmi2_scl
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  edid_rom_2 edid (
    .clk(clk),
    .rst(rst),
    .sda(hdmi2_sda),
    .scl(hdmi2_scl)
  );
  
  wire [1-1:0] M_hdmi_pclk;
  wire [4-1:0] M_hdmi_tmds_out;
  wire [4-1:0] M_hdmi_tmdsb_out;
  wire [1-1:0] M_hdmi_active;
  wire [11-1:0] M_hdmi_x;
  wire [10-1:0] M_hdmi_y;
  wire [8-1:0] M_hdmi_red_out;
  wire [8-1:0] M_hdmi_green_out;
  wire [8-1:0] M_hdmi_blue_out;
  reg [4-1:0] M_hdmi_tmds_in;
  reg [4-1:0] M_hdmi_tmdsb_in;
  reg [8-1:0] M_hdmi_red_in;
  reg [8-1:0] M_hdmi_green_in;
  reg [8-1:0] M_hdmi_blue_in;
  hdmi_passthru_3 hdmi (
    .rst(1'h0),
    .tmds_in(M_hdmi_tmds_in),
    .tmdsb_in(M_hdmi_tmdsb_in),
    .red_in(M_hdmi_red_in),
    .green_in(M_hdmi_green_in),
    .blue_in(M_hdmi_blue_in),
    .pclk(M_hdmi_pclk),
    .tmds_out(M_hdmi_tmds_out),
    .tmdsb_out(M_hdmi_tmdsb_out),
    .active(M_hdmi_active),
    .x(M_hdmi_x),
    .y(M_hdmi_y),
    .red_out(M_hdmi_red_out),
    .green_out(M_hdmi_green_out),
    .blue_out(M_hdmi_blue_out)
  );
  
  reg [7:0] M_red_d, M_red_q = 1'h0;
  reg [7:0] M_green_d, M_green_q = 1'h0;
  reg [7:0] M_blue_d, M_blue_q = 1'h0;
  
  always @* begin
    M_red_d = M_red_q;
    M_blue_d = M_blue_q;
    M_green_d = M_green_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    M_hdmi_tmds_in = hdmi2_tmds;
    M_hdmi_tmdsb_in = hdmi2_tmdsb;
    hdmi1_tmds = M_hdmi_tmds_out;
    hdmi1_tmdsb = M_hdmi_tmdsb_out;
    M_red_d = M_hdmi_red_out;
    M_green_d = M_hdmi_green_out;
    M_blue_d = M_hdmi_blue_out;
    M_hdmi_red_in = M_red_q;
    M_hdmi_green_in = M_green_q;
    M_hdmi_blue_in = M_blue_q;
  end
  
  always @(posedge M_hdmi_pclk) begin
    M_red_q <= M_red_d;
    M_green_q <= M_green_d;
    M_blue_q <= M_blue_d;
  end
  
endmodule