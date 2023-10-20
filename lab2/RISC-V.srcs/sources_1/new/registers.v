`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2022 17:19:42
// Design Name: 
// Module Name: registers
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


module registers(
    input clk,
    input reg_write,
    input [4:0] read_reg1,
    input [4:0] read_reg2,
    input [4:0] write_reg,
    input [31:0] write_data,
    output reg [31:0] read_data1,
    output reg [31:0] read_data2
    );
    
    reg[31:0] regs [0:31];
    integer i;
    
    initial begin 
        for(i = 0; i < 32; i = i + 1) 
        begin
            regs[i] = i;
        end
    end
    
    always @(posedge clk)
    begin
        if(reg_write && write_reg != 0)
            regs[write_reg] = write_data; 
    end

    always @(read_reg1)
    begin 
        read_data1 <= regs[read_reg1];
    end
    
    always @(read_reg2)
    begin 
        read_data2 <= regs[read_reg2];
    end
endmodule
