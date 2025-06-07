`timescale 1ns / 1ps

module sync_fifo_tb;

  parameter Depth = 8;
  parameter Width = 16;

  // Inputs
  reg clk;
  reg reset;
  reg w_enb;
  reg r_enb;
  reg [Width-1:0] din;

  // Outputs
  wire [Width-1:0] dout;
  wire full;
  wire empty;

  // Instantiate the FIFO
  sync_fifo #(Depth, Width) DUT (
    .clk(clk),
    .reset(reset),
    .w_enb(w_enb),
    .r_enb(r_enb),
    .din(din),
    .dout(dout),
    .full(full),
    .empty(empty)
  );

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk; // 100 MHz clock

  // Test procedure
  initial begin
    $display("Starting FIFO testbench...");
    $monitor("Time=%0t | clk=%b reset=%b w_enb=%b r_enb=%b din=%h dout=%h full=%b empty=%b", 
             $time, clk, reset, w_enb, r_enb, din, dout, full, empty);

    // Initial state
    reset = 1;
    w_enb = 0;
    r_enb = 0;
    din = 0;
    #15;

    // Release reset
    reset = 0;
    #10;

    // Write data into FIFO
    $display("\n--- Write Test ---");
    repeat (Depth) begin
      @(posedge clk);
      if (!full) begin
        w_enb = 1;
        din = $random;
      end
    end
    @(posedge clk);
    w_enb = 0;

    // Try to write when full (Overflow)
    $display("\n--- Overflow Test ---");
    repeat (2) begin
      @(posedge clk);
      w_enb = 1;
      din = $random;
    end
    w_enb = 0;

    // Read data from FIFO
    $display("\n--- Read Test ---");
    repeat (Depth) begin
      @(posedge clk);
      if (!empty)
        r_enb = 1;
    end
    @(posedge clk);
    r_enb = 0;

    // Try to read when empty (Underflow)
    $display("\n--- Underflow Test ---");
    repeat (2) begin
      @(posedge clk);
      r_enb = 1;
    end
    r_enb = 0;

    // Simultaneous Write and Read
    $display("\n--- Simultaneous Read/Write Test ---");
    repeat (4) begin
      @(posedge clk);
      w_enb = 1;
      r_enb = 1;
      din = $random;
    end
    w_enb = 0;
    r_enb = 0;

    // Alternating Read/Write
    $display("\n--- Alternating Read/Write Test ---");
    repeat (Depth) begin
      @(posedge clk);
      w_enb = 1; r_enb = 0; din = $random;
      @(posedge clk);
      w_enb = 0; r_enb = 1;
    end

    // Done
    $display("\nTestbench completed.");
    #50;
    $finish;
  end

endmodule

