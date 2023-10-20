`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2022 05:29:30 PM
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
    reg bit, clk, reset;
    wire found;
    
    always #5 clk = ~clk;
    
    Mealy vm(clk, reset, bit, found);
    
    initial begin
        clk = 1; bit = 0; reset = 0;
        
        #10 reset = 1;
        #10 reset = 0;
        
        #10 bit = 0;
        #10 bit = 0;
        #10 bit = 1;
        #10 bit = 1;
        #10 bit = 0;
        #10 bit = 1;
        #10 bit = 0;
        #10 bit = 1;
        #10 bit = 0;
        #10 bit = 0;
        #10 bit = 1;
        #10 bit = 0;
        #10 bit = 1;
        #10 bit = 1;
        #10 bit = 1;
        #10 bit = 0;
        #10 bit = 0;
    end
endmodule
