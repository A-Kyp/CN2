`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2022 05:01:24 PM
// Design Name: 
// Module Name: ALUcontrol
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


module ALUcontrol(
    input [1:0] ALUop,
    input [6:0] funct7,
    input [2:0] funct3,
    output reg [3:0] ALUinput
    );
    
    always @(*)
    
    casez({ALUop, funct7, funct3})
        12'b00??????????: ALUinput <= 2;
        12'b01??????????: ALUinput <= 6;
        
        12'b100000000000: ALUinput <= 2; //ld, sd
        12'b100000000111: ALUinput <= 0; //R-type AND
        12'b100000000110: ALUinput <= 1; //R-type OR
        12'b100100000000: ALUinput <= 1;
//    case(ALUop)
//        00: ALUinput <= 2;
//        01: ALUinput <= 6;
//        10: //de vazut ce se intampla daca nu e 2'b ^-^
//            if(funct7 == 0)
//                case(funct3)
//                    3'b000: ALUinput <= 2;
//                    3'b111: ALUinput <= 0; 
//                    3'b110: ALUinput <= 1;
//                endcase 
            
//            else 
//                ALUinput <= 6;             
//    endcase
endmodule
