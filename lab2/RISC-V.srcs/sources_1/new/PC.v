`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2022 16:15:35
// Design Name: 
// Module Name: PC
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


module PC(
    input clk,
    input res,
    input write,
    input [31:0] in,
    output reg [31:0] out
    );
    
    always @(posedge res)
        out = 0;
            
    always @(posedge clk)
    begin
        if(!res && write)
        begin
            out <= in;
        end
    end
endmodule
