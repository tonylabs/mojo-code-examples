/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     LATENCY = 1
*/
module hdmi_passthru_3 (
    input rst,
    output reg pclk,
    input [3:0] tmds_in,
    input [3:0] tmdsb_in,
    output reg [3:0] tmds_out,
    output reg [3:0] tmdsb_out,
    output reg active,
    output reg [10:0] x,
    output reg [9:0] y,
    output reg [7:0] red_out,
    output reg [7:0] green_out,
    output reg [7:0] blue_out,
    input [7:0] red_in,
    input [7:0] green_in,
    input [7:0] blue_in
  );
  
  localparam LATENCY = 1'h1;
  
  
  wire [1-1:0] M_decoder_pll_locked;
  wire [1-1:0] M_decoder_pclk;
  wire [1-1:0] M_decoder_pclkx2;
  wire [1-1:0] M_decoder_pclkx10;
  wire [1-1:0] M_decoder_strobe;
  wire [1-1:0] M_decoder_hsync;
  wire [1-1:0] M_decoder_vsync;
  wire [1-1:0] M_decoder_de;
  wire [8-1:0] M_decoder_red;
  wire [8-1:0] M_decoder_green;
  wire [8-1:0] M_decoder_blue;
  reg [4-1:0] M_decoder_tmds;
  reg [4-1:0] M_decoder_tmdsb;
  reg [1-1:0] M_decoder_rst;
  dvi_decoder_5 decoder (
    .tmds(M_decoder_tmds),
    .tmdsb(M_decoder_tmdsb),
    .rst(M_decoder_rst),
    .pll_locked(M_decoder_pll_locked),
    .pclk(M_decoder_pclk),
    .pclkx2(M_decoder_pclkx2),
    .pclkx10(M_decoder_pclkx10),
    .strobe(M_decoder_strobe),
    .hsync(M_decoder_hsync),
    .vsync(M_decoder_vsync),
    .de(M_decoder_de),
    .red(M_decoder_red),
    .green(M_decoder_green),
    .blue(M_decoder_blue)
  );
  
  wire [4-1:0] M_encoder_tmds;
  wire [4-1:0] M_encoder_tmdsb;
  reg [1-1:0] M_encoder_pclk;
  reg [1-1:0] M_encoder_pclkx2;
  reg [1-1:0] M_encoder_pclkx10;
  reg [1-1:0] M_encoder_strobe;
  reg [1-1:0] M_encoder_rst;
  reg [8-1:0] M_encoder_red;
  reg [8-1:0] M_encoder_green;
  reg [8-1:0] M_encoder_blue;
  reg [1-1:0] M_encoder_hsync;
  reg [1-1:0] M_encoder_vsync;
  reg [1-1:0] M_encoder_de;
  dvi_encoder_6 encoder (
    .pclk(M_encoder_pclk),
    .pclkx2(M_encoder_pclkx2),
    .pclkx10(M_encoder_pclkx10),
    .strobe(M_encoder_strobe),
    .rst(M_encoder_rst),
    .red(M_encoder_red),
    .green(M_encoder_green),
    .blue(M_encoder_blue),
    .hsync(M_encoder_hsync),
    .vsync(M_encoder_vsync),
    .de(M_encoder_de),
    .tmds(M_encoder_tmds),
    .tmdsb(M_encoder_tmdsb)
  );
  
  reg [10:0] M_x_ctr_d, M_x_ctr_q = 1'h0;
  reg [9:0] M_y_ctr_d, M_y_ctr_q = 1'h0;
  wire [1-1:0] M_hedge_out;
  reg [1-1:0] M_hedge_in;
  edge_detector_7 hedge (
    .clk(M_decoder_pclk),
    .in(M_hedge_in),
    .out(M_hedge_out)
  );
  wire [(2'h3+0)-1:0] M_pipe_out;
  reg [(2'h3+0)-1:0] M_pipe_in;
  
  genvar GEN_pipe0;
  generate
  for (GEN_pipe0=0;GEN_pipe0<2'h3;GEN_pipe0=GEN_pipe0+1) begin: pipe_gen_0
    pipeline_8 pipe (
      .clk(M_decoder_pclk),
      .in(M_pipe_in[GEN_pipe0*(1)+(1)-1-:(1)]),
      .out(M_pipe_out[GEN_pipe0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  always @* begin
    M_x_ctr_d = M_x_ctr_q;
    M_y_ctr_d = M_y_ctr_q;
    
    M_decoder_rst = rst;
    M_decoder_tmds = tmds_in;
    M_decoder_tmdsb = tmdsb_in;
    M_pipe_in = {M_decoder_hsync, M_decoder_vsync, M_decoder_de};
    M_encoder_pclk = M_decoder_pclk;
    M_encoder_pclkx2 = M_decoder_pclkx2;
    M_encoder_pclkx10 = M_decoder_pclkx10;
    M_encoder_strobe = M_decoder_strobe;
    M_encoder_rst = ~M_decoder_pll_locked;
    M_encoder_blue = blue_in;
    M_encoder_green = green_in;
    M_encoder_red = red_in;
    M_encoder_hsync = M_pipe_out[2+0-:1];
    M_encoder_vsync = M_pipe_out[1+0-:1];
    M_encoder_de = M_pipe_out[0+0-:1];
    tmds_out = M_encoder_tmds;
    tmdsb_out = M_encoder_tmdsb;
    pclk = M_decoder_pclk;
    active = M_decoder_de;
    x = M_x_ctr_q;
    y = M_y_ctr_q;
    red_out = M_decoder_red;
    green_out = M_decoder_green;
    blue_out = M_decoder_blue;
    M_hedge_in = M_decoder_hsync;
    if (M_decoder_de) begin
      M_x_ctr_d = M_x_ctr_q + 1'h1;
      if (M_hedge_out) begin
        M_y_ctr_d = M_y_ctr_q + 1'h1;
      end
    end
    if (M_decoder_vsync) begin
      M_x_ctr_d = 1'h0;
      M_y_ctr_d = 1'h0;
    end
  end
  
  always @(posedge M_decoder_pclk) begin
    M_x_ctr_q <= M_x_ctr_d;
    M_y_ctr_q <= M_y_ctr_d;
  end
  
endmodule