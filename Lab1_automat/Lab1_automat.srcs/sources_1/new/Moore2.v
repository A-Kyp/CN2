`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2022 07:41:26 PM
// Design Name: 
// Module Name: Moore2
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


module Moore2(clk, reset, bit, found);
    input clk, reset;
    input bit;
    output reg found;

    parameter[2:0] s0_0 = 3'b000; //0
    parameter[2:0] s1_0 = 3'b001; //1
    parameter[2:0] s2_0 = 3'b010; //2
    parameter[2:0] s1_1 = 3'b011; //3
    parameter[2:0] s3_0 = 3'b100; //4
    parameter[2:0] s3_1 = 3'b101; //5

    reg[2:0] next_state, crt_state;
    reg ok;
    
    always @(posedge clk or posedge reset)
    begin
        if(reset)
        begin
            crt_state = s0_0 ;
            ok = 0;
            found  = 0;
            next_state = s0_0;
        end
        else 
            crt_state <= next_state;
            found <= ok;
    end
    
    always @(crt_state or bit)
    begin
        case (crt_state)
//        case (next_state)
            s0_0: begin
                ok = 0;
                if(bit == 1)
                    next_state = s1_0;
                else
                    next_state = s0_0;
            end

            s1_0: begin
                ok = 0;
                if(bit == 1)
                    next_state = s2_0;
                else
                    next_state = s3_0;
            end

            s1_1: begin
                ok = 1;
                if(bit == 1)
                    next_state = s2_0;
                else
                    next_state = s3_0;
            end

            s2_0: begin
                ok = 0;
                if(bit == 1)
                    next_state = s2_0;
                else
                    next_state = s3_1;
            end

            s3_0: begin
                ok = 0;
                if(bit == 1)
                    next_state = s1_1;
                else
                    next_state = s0_0;
            end

            s3_1: begin
                ok = 1;
                if(bit == 1)
                    next_state = s1_1;
                else
                    next_state = s0_0;
            end
        endcase
    end
endmodule 