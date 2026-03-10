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
    
    always@(posedge clk or posedge reset) begin
        if(reset)
            fifo_counter <= 0;
        else if((!buf_full && wr_en) && (!buf_empty && rd_en))
            fifo_counter <= fifo_counter;
        else if(!buf_full && wr_en)
            fifo_counter <= fifo_counter+1;
        else if(!buf_empty && rd_en)
            fifo_counter <= fifo_counter-1;
            else
            fifo_counter <= fifo_counter;
    end
    
    always@(posedge clk or posedge reset) begin
        if(reset)
            buf_out <= 0;
        else if(rd_en && !buf_empty)
            buf_out <= buf_mem[rd_ptr];
        else
        buf_out <= buf_out;
    end
    
    always@(posedge clk) begin
        if(wr_en && !buf_full)
            buf_mem[wr_ptr] <= buf_in;
        else
            buf_mem[wr_ptr] <= buf_mem[wr_ptr];
    end
    
    always@(posedge clk or posedge reset) begin
        if(reset) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            end
        else begin
        if(wr_en && !buf_full) begin
            wr_ptr <= wr_ptr + 1;
        end
        if(rd_en && !buf_empty) begin
            rd_ptr <= rd_ptr + 1;
        end
        else begin
        rd_ptr <= rd_ptr;
        wr_ptr <= wr_ptr;
        end
        end
    end
    
endmodule
