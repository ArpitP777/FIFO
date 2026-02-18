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


module FIFO(
    input clk,
    input reset,
    input [7:0]buff_in,
    output [7:0]buff_out,
    input wr_en,
    input rd_en,
    output buf_empty,
    output buf_full,
    output[6:0] fifo_counter
    );
    
    
endmodule
