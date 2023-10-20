`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2022 16:44:06
// Design Name: 
// Module Name: IF
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


module IF(
    input clk,
    input reset,
    input PCSrc,
    input PC_write,
    input [31:0] PC_Branch,
    output [31:0] PC_IF,
    output [31:0] INSTRUCTION_IF
    );
    
    parameter [31:0] CONS4 = 4; 
    wire [31:0] PC_IF_4; //out add
    wire [31:0] PC_mux; //out mux
    wire [31:0] PC_out; //out PC
    wire [31:0] instr_if; //out PC
    
    mux2_1 mux(PC_IF_4, PC_Branch, PCSrc, PC_mux);
    PC PC1(clk, reset, PC_write, PC_mux, PC_out);
    adder adder1(PC_out, 4 , PC_IF_4);
    
    instruction_memory IM(PC_out[11:2], instr_if);
    
    assign PC_IF = PC_out;
    assign INSTRUCTION_IF = instr_if;
endmodule
