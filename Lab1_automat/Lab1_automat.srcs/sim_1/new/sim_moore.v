`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2022 07:42:17 PM
// Design Name: 
// Module Name: sim_moore
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


module sim_moore();
    reg bit, clk, reset;
    wire found;
    
    always #5 clk = ~clk;
    
    Moore2 vm(clk, reset, bit, found);
    
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
