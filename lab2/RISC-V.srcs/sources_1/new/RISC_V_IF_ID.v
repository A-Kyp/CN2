`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2022 12:04:31 AM
// Design Name: 
// Module Name: RISC_V_IF_ID
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


module RISC_V_IF_ID(
    input clk,   //semnalul de ceas global
    input reset, //semnalul de reset global
    
    //semnale provenite din stagii viitoare
    //sunt pre-testate pentru aceasta lucrare
    //vor fi discutate in lucrarile urmatoare
    input IF_ID_write,  //semnal de scriere pt registrul de pipeline reg_IF_ID
    input PCSrc, PC_write,  //semnale de control pt PC
    input [31:0] PC_Branch, //PC-ul calculat in etapa EX pentru instructiunile de salt
    input RegWrite_WB,  //semnalul de activare a scrierii in bancul de registrii
    input [31:0] ALU_DATA_WB, //rezultatul calculat de ALU
    input [4:0] RD_WB, //registrul rezultat in care se face ALU_DATA_WB
    
    //semnale de iesire din ID
    //vor fi vizualizate pe simulare
    output [31:0] PC_ID,  //adresa PC a instructiunii din etapa ID    
    output [31:0] INSTRUCTION_ID, //instructiunea curenta in etapa ID    
    output [31:0] IMM_ID, //valoarea calculata
    output [31:0] REG_DATA1_ID, //valoarea primului registru sursa citit
    output [31:0] REG_DATA2_ID, //valoarea celui de-al doilea registru sursa citit
    
    output [2:0] FUNC3_ID, //funct3 din codificarea instructiunii
    output [6:0] FUNC7_ID, //funct7 din codificarea instructiunii
    output [6:0] OPCODE_ID, //opcode-ul instructiunii
    output [4:0] RD_ID, //registrul destinatie
    output [4:0] RS1_ID, //registrul sursa 1
    output [4:0] RS2_ID //registrul sursa 2
    );
    
    wire [31:0]PC_IF, INSTRUCTION_IF;
    
    IF fetch(clk, reset, PCSrc, PC_write, PC_Branch, PC_IF , INSTRUCTION_IF);
    reg_IF_ID r(clk, reset, IF_ID_write, PC_IF, INSTRUCTION_IF, PC_ID, INSTRUCTION_ID);
    ID decode(clk, PC_ID, INSTRUCTION_ID, RegWrite_WB, ALU_DATA_WB, RD_WB, IMM_ID, REG_DATA1_ID, REG_DATA2_ID, FUNC3_ID, FUNC7_ID, OPCODE_ID, RD_ID, RS1_ID, RS2_ID);
endmodule 
