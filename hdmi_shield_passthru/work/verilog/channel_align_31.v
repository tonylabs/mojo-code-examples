/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module channel_align_31 (
    input clk,
    input [9:0] data_in,
    input data_valid,
    input others_ready,
    output reg ready,
    output reg [9:0] data_out
  );
  
  
  
  reg [1:0] M_ctrl_rx_d, M_ctrl_rx_q = 1'h0;
  reg M_skip_d, M_skip_q = 1'h0;
  reg M_am_ready_d, M_am_ready_q = 1'h0;
  reg M_read_en_d, M_read_en_q = 1'h0;
  reg [1:0] M_valid_rise_d, M_valid_rise_q = 1'h0;
  
  wire [1-1:0] M_fifo_full;
  wire [10-1:0] M_fifo_dout;
  wire [1-1:0] M_fifo_empty;
  reg [1-1:0] M_fifo_wrst;
  reg [10-1:0] M_fifo_din;
  reg [1-1:0] M_fifo_wput;
  reg [1-1:0] M_fifo_rrst;
  reg [1-1:0] M_fifo_rget;
  async_fifo_51 fifo (
    .wclk(clk),
    .rclk(clk),
    .wrst(M_fifo_wrst),
    .din(M_fifo_din),
    .wput(M_fifo_wput),
    .rrst(M_fifo_rrst),
    .rget(M_fifo_rget),
    .full(M_fifo_full),
    .dout(M_fifo_dout),
    .empty(M_fifo_empty)
  );
  
  always @* begin
    M_am_ready_d = M_am_ready_q;
    M_valid_rise_d = M_valid_rise_q;
    M_skip_d = M_skip_q;
    M_read_en_d = M_read_en_q;
    M_ctrl_rx_d = M_ctrl_rx_q;
    
    M_fifo_rrst = !data_valid;
    M_fifo_wrst = !data_valid;
    M_fifo_din = data_in;
    M_fifo_wput = data_valid;
    M_fifo_rget = M_read_en_q;
    data_out = M_fifo_dout;
    ready = M_am_ready_q;
    M_valid_rise_d = {M_valid_rise_q[0+0-:1], data_valid};
    M_ctrl_rx_d[0+0-:1] = (M_fifo_dout == 10'h354) || (M_fifo_dout == 10'h0ab) || (M_fifo_dout == 10'h154) || (M_fifo_dout == 10'h2ab);
    M_ctrl_rx_d[1+0-:1] = M_ctrl_rx_q[0+0-:1];
    if (M_ctrl_rx_q == 2'h1) begin
      M_skip_d = 1'h1;
      if (M_skip_q) begin
        M_am_ready_d = 1'h1;
      end
    end
    if (M_valid_rise_q == 2'h1 || (others_ready && M_am_ready_q)) begin
      M_read_en_d = 1'h1;
    end else begin
      if (M_ctrl_rx_q == 2'h1 && M_skip_q && !(others_ready && M_am_ready_q)) begin
        M_read_en_d = 1'h0;
      end
    end
  end
  
  always @(posedge clk) begin
    if (!data_valid == 1'b1) begin
      M_ctrl_rx_q <= 1'h0;
      M_skip_q <= 1'h0;
      M_am_ready_q <= 1'h0;
      M_read_en_q <= 1'h0;
      M_valid_rise_q <= 1'h0;
    end else begin
      M_ctrl_rx_q <= M_ctrl_rx_d;
      M_skip_q <= M_skip_d;
      M_am_ready_q <= M_am_ready_d;
      M_read_en_q <= M_read_en_d;
      M_valid_rise_q <= M_valid_rise_d;
    end
  end
  
endmodule
