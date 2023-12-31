//////////////////////////////////////////////RISC-V_MODULE///////////////////////////////////////////////////
module RISC_V(input clk,reset,
              input IF_ID_write,
              input PCSrc,PC_write,
              input [31:0] PC_Branch,
              input RegWrite_WB, 
              input [31:0] ALU_DATA_WB,
              input [4:0] RD_WB,
              output [31:0] PC_ID,
              output [31:0] INSTRUCTION_ID,
              output [31:0] IMM_ID,
              output [31:0] REG_DATA1_ID,REG_DATA2_ID,
              output RegWrite_ID,MemtoReg_ID,MemRead_ID,MemWrite_ID,
              output [1:0] ALUop_ID,
              output ALUSrc_ID,
              output Branch_ID);
  
  //////////////////////////////////////////IF signals////////////////////////////////////////////////////////
  wire [31:0] PC_IF;               //current PC
  wire [31:0] INSTRUCTION_IF;
  
 
 /////////////////////////////////////IF Module/////////////////////////////////////
 IF instruction_fetch(clk, reset, 
                      PCSrc, PC_write,
                      PC_Branch,
                      PC_IF,INSTRUCTION_IF);
  
  
 //////////////////////////////////////pipeline registers////////////////////////////////////////////////////
 IF_ID_reg IF_ID_REGISTER(clk,reset,
                          IF_ID_write,
                          PC_IF,INSTRUCTION_IF,
                          PC_ID,INSTRUCTION_ID);
  
  
 ////////////////////////////////////////ID Module//////////////////////////////////
 ID instruction_decode(clk,
                       PC_ID,INSTRUCTION_ID,
                       RegWrite_WB, 
                       ALU_DATA_WB,
                       RD_WB,
                       IMM_ID,
                       REG_DATA1_ID,REG_DATA2_ID,
                       RegWrite_ID,MemtoReg_ID,MemRead_ID,MemWrite_ID,
                       ALUop_ID,
                       ALUSrc_ID,
                       Branch_ID);
 

  
  
                                               
endmodule
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
