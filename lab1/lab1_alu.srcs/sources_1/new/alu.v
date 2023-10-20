`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2022 17:07:29
// Design Name: 
// Module Name: alu
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


module alu(a, b, sel, out, overflow);
    input [3:0]a, b;
    input [2:0] sel;
    output [3:0] out;
    output overflow;
    
    parameter[2:0] adunare = 3'b000;
    parameter[2:0] egalitate= 3'b001;
    parameter[2:0] rshift = 3'b010;
    parameter[2:0] complement = 3'b011;
    parameter[2:0] si = 3'b100;
    
    reg[3:0] rez;
    reg check;
    assign overflow = check;
    assign out = rez[3:0];
    
    always@(*)
    begin
        case(sel)
        adunare: {check,rez} = a + b; //{overflow, out} = a+b
        egalitate: begin
            check = 0; 
            if(a == b) rez = 4'b1111; else rez = 4'b0000;
            end
        rshift: begin
            check = 0;
            rez = a>>1;
            end
        complement: begin
            check = 0;
            rez = -a;
            end
        si: begin
            check = 0;
            rez = a&b;
            end
        default: begin
            rez = 4'b0000;
            check = 0;
            end
        endcase
//        reg[3:0} = {
    end  
//    assign out = r[3:0]
endmodule
