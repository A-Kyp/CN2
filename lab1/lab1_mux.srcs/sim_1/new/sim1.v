`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2022 03:10:17 PM
// Design Name: 
// Module Name: sim1
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


module sim1;
    reg A, B, C, D, a, b;
    wire Q;
    mux circuit(A, B, C, D, Q, a, b);
    initial begin
        a = 1'b0;
        b = 1'b0;
        D = 1'b0;
        C = 1'b0;
        B = 1'b0;
        A = 1'b0;
        
        #5 A = 1'b1; C = 1'b1;
        #5 A = 1'b0;
        
        #5 a = 1'b1;
        #5 B = 1'b1; C = 1'b0; A = 1'b0;
        
        #5 a = 1'b0; b = 1'b1;
        #5 C = 1'b1;
    end
endmodule
