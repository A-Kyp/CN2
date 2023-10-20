`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2022 04:26:45 PM
// Design Name: 
// Module Name: imm_gen
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


module imm_gen(
    input [31:0] in,
    output reg [31:0] out
    );
    
    always @(in)
    begin
        case (in[6:0])
            7'b0000011, 7'b0010011: //tipul I
                out <= {{21{in[31]}}, in[30:20]};
            7'b0100011: //tipul S
                out <= {{21{in[31]}}, in[30:25], in[11:7]};
            7'b1100011: //tipul B
                out <= {{20{in[31]}}, in[7], in[30:25], in[11:8], 1'b0};
            default:
                out <= 32'b0;
        endcase    
    end
endmodule
