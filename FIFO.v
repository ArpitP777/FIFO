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
    
    reg[5:0] rd_ptr;
    reg[5:0] wr_ptr;
    input [7:0]buf_in;
    output reg [7:0]buf_out;
    input clk;
    input reset;
    input wr_en;
    input rd_en;
    output buf_full;
    output buf_empty;
    output reg [6:0]fifo_counter;
    reg[7:0] buf_mem[63:0];

    assign buf_empty = (fifo_counter == 0);
    assign buf_full = (fifo_counter == 64);
    
    always@(posedge clk or posedge reset) begin
        if(reset)
            fifo_counter <= 0;
        else begin
        case ({wr_en, rd_en})
            2'b10: if (!buf_full)  fifo_counter <= fifo_counter + 1;
            2'b01: if (!buf_empty) fifo_counter <= fifo_counter - 1;
            2'b11: fifo_counter <= fifo_counter;
            default: fifo_counter <= fifo_counter;
        endcase
        end
    end
    
    always@(posedge clk or posedge reset) begin
        if(reset)
            buf_out <= 0;
        else if(rd_en && !buf_empty)
            buf_out <= buf_mem[rd_ptr];
    end
    
    always@(posedge clk) begin
        if(wr_en && !buf_full)
            buf_mem[wr_ptr] <= buf_in;
    end
    
    always @(posedge clk or posedge reset) begin
    if (reset) begin
        wr_ptr <= 0;
        rd_ptr <= 0;
    end
    else begin
        if (wr_en && !buf_full)
            wr_ptr <= wr_ptr + 1;

        if (rd_en && !buf_empty)
            rd_ptr <= rd_ptr + 1;
    end
end
    end
    
endmodule
