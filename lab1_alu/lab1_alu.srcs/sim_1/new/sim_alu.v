`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2022 17:37:16
// Design Name: 
// Module Name: sim_alu
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


module sim_alu;

    reg[3:0] a, b;
    reg[2:0] sel;
    wire[3:0]out;
    wire carry;
    
    alu myAlu(a, b, sel, out, carry);
    
    initial begin
        a = 0; b = 0; sel = 0; // 0+0 = 0
        #5 a = 5; //0+5 = 5
        #5 b = 15; //5+15 = 4 si overflow = 1
        #5 sel = 1;
        #5 a = 15;
        #5 a = 5;
        #10 sel = 2;
        #10 sel = 3;
        #10 sel = 4;
        #10 sel = 5;   
    end

endmodule
