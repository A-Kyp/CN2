`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2022 05:33:49 PM
// Design Name: 
// Module Name: ID
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


module ID(
    input clk,
    input [31:0] PC_ID, INSTRUCTION_ID, //ext
    input RegWrite_WB, //ext
    input [31:0] ALU_DATA_WB, //ext
    input [4:0] RD_WB, //ext
    output [31:0] IMM_ID, //function IG
    output [31:0] REG_DATA1_ID, REG_DATA2_ID, // function R
    output [2:0] FUNCT3_ID,////assign din INSTRUCTION_ID
    output [6:0] FUNCT7_ID,//assign din INSTRUCTION_ID
    output [6:0] OPCODE_ID, //assign din INSTRUCTION_ID
    output [4:0] RD_ID, //assign din INSTRUCTION_ID
    output [4:0] RS1_ID, //assign din INSTRUCTION_ID
    output [4:0] RS2_ID //assign din INSTRUCTION_ID
    );
    
    registers R(clk, RegWrite_WB, INSTRUCTION_ID[19:15], INSTRUCTION_ID[24:20], RD_WB, ALU_DATA_WB, REG_DATA1_ID, REG_DATA2_ID);
    imm_gen IG(INSTRUCTION_ID, IMM_ID);
    
    assign RS1_ID = INSTRUCTION_ID[19:15];
    assign RS2_ID = INSTRUCTION_ID[24:20];
    assign RD_ID = INSTRUCTION_ID[11:7];

    assign OPCODE_ID = INSTRUCTION_ID[6:0];
    assign FUNCT3_ID = INSTRUCTION_ID[14:12];
    assign FUNCT7_ID = INSTRUCTION_ID[31:25];
endmodule
