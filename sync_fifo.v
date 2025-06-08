`timescale 1ns / 1ps

module sync_fifo #(
    parameter Depth = 8,
    parameter Width = 16
)(
    input wire clk,
    input wire reset,
    input wire w_enb,         // Write enable
    input wire r_enb,         // Read enable
    input wire [Width-1:0] din, // Data input
    output reg [Width-1:0] dout, // Data output
    output wire empty,        // FIFO empty flag
    output wire full          // FIFO full flag
);

  // Internal signals
  reg [$clog2(Depth)-1:0] wptr;            // Write pointer
  reg [$clog2(Depth)-1:0] rptr;            // Read pointer
  reg [Width-1:0] fifo [0:Depth-1];        // FIFO memory
  reg [$clog2(Depth):0] count;             // Element count

  // Write and read operations
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      wptr <= 0;
      rptr <= 0;
      dout <= 0;
      count <= 0;
    end else begin
      // Write data
      if (w_enb && !full) begin
        fifo[wptr] <= din;
        wptr <= (wptr + 1) % Depth;
      end

      // Read data
      if (r_enb && !empty) begin
        dout <= fifo[rptr];
        rptr <= (rptr + 1) % Depth;
      end

      // Update count
      case ({w_enb && !full, r_enb && !empty})
        2'b10: count <= count + 1;  // Write only
        2'b01: count <= count - 1;  // Read only
        default: count <= count;    // No change or simultaneous R/W
      endcase
    end
  end

  // Status flags
  assign full = (count == Depth);
  assign empty = (count == 0);

endmodule

