`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2022 11:40:09 PM
// Design Name: 
// Module Name: reg_IF_ID
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


module reg_IF_ID(
    input clk,
    input res,
    input write,
    input [31:0]PC_IF,
    input[31:0] instruction_IF,
    output reg [31:0]PC_ID,
    output reg [31:0]instruction_ID
    );
    
    always @(posedge res)
    begin 
        instruction_ID  = 0;
        PC_ID = 0;
    end
    
    always @(posedge clk)
    begin
        if(!res && write)
        begin
            instruction_ID <= instruction_IF;
            PC_ID <= PC_IF;
        end
    end
endmodule
