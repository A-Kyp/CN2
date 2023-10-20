`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2022 12:07:59 AM
// Design Name: 
// Module Name: sim_registers
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


module sim_registers();
    reg clk, reg_write;
    reg [4:0] read_reg1, read_reg2, write_reg;
    reg [31:0] write_data;
    wire [31:0] read_data1, read_data2;
    
    always #5 clk = ~clk;
    
    registers R(clk, reg_write, read_reg1, read_reg2, write_reg, write_data, read_data1, read_data2);
    
    initial begin
        clk = 1; read_reg1 = 0; read_reg2 = 0; write_reg = 0; write_data = 0;
                
        #10 reg_write = 0;
        
        #5 read_reg1 = 18;
           read_reg2 = 7;
        
        #5 read_reg1 = 21;
        #5 read_reg2 = 21;
        
        #5 read_reg1 = 16;
           read_reg2 = 11;
        
        #5 read_reg1 = 20;
           read_reg2 = 22;
        
        #5 reg_write = 1;
           write_reg = 25;
           write_data = 87;
           
        #5 write_reg = 4;
           write_data = 1024;
            
        #10 reg_write = 0;
           read_reg1 = 25;
           read_reg2 = 4;
        
    end
endmodule
