`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Create Date: 18.02.2026 22:25:15
// Design Name: 
// Module Name: FIFO
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


module FIFO(clk, reset, buf_in, buf_out, wr_en, rd_en, buf_empty, buf_full, fifo_counter);
    
    reg[3:0] rd_ptr;
    reg[3:0] wr_ptr;
    input [7:0]buf_in;
    output reg [7:0]buf_out;
    input clk;
    input reset;
    input wr_en;
    input rd_en;
    output reg buf_full;
    output reg buf_empty;
    output reg [6:0]fifo_counter;
    reg[7:0] buf_mem[63:0];
    
    
endmodule
