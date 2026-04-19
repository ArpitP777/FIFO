`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Arpit
// 
// Create Date: 19.04.2026 21:02:34
// Design Name: 
// Module Name: FIFO_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FIFO_tb;

reg clk;
reg reset;
reg [7:0] buf_in;
reg wr_en;
reg rd_en;

wire [7:0] buf_out;
wire buf_empty;
wire buf_full;
wire [6:0] fifo_counter;

FIFO uut (
    .clk(clk),
    .reset(reset),
    .buf_in(buf_in),
    .buf_out(buf_out),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .buf_empty(buf_empty),
    .buf_full(buf_full),
    .fifo_counter(fifo_counter)
);

always #5 clk = ~clk;

integer i;

initial begin
    clk = 0;
    reset = 1;
    wr_en = 0;
    rd_en = 0;
    buf_in = 0;

    #10 reset = 0;

    for(i = 0; i < 64; i = i + 1) begin
        @(posedge clk);
        wr_en = 1;
        rd_en = 0;
        buf_in = i;
    end

    @(posedge clk);
    wr_en = 0;

    for(i = 0; i < 32; i = i + 1) begin
        @(posedge clk);
        rd_en = 1;
        wr_en = 0;
    end

    @(posedge clk);
    rd_en = 0;

    for(i = 64; i < 96; i = i + 1) begin
        @(posedge clk);
        wr_en = 1;
        rd_en = 0;
        buf_in = i;
    end

    @(posedge clk);
    wr_en = 0;

    for(i = 0; i < 64; i = i + 1) begin
        @(posedge clk);
        rd_en = 1;
        wr_en = 0;
    end

    @(posedge clk);
    rd_en = 0;

    #50 $finish;
end

endmodule
