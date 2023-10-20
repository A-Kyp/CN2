`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2022 04:29:17 PM
// Design Name: 
// Module Name: Mealy
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


module Mealy(clk, reset, bit, found);
    input clk, reset;
    input bit;
    output reg found;

    parameter[2:0] s0 = 3'b000;
    parameter[2:0] s1 = 3'b001;
    parameter[2:0] s2 = 3'b010;
    parameter[2:0] s3 = 3'b011;

    reg[2:0] next_state, crt_state;
    reg ok;
    
    always @(posedge clk or posedge reset)
    begin
        if(reset)
        begin
            crt_state = s0;
            ok = 0;
            found = 0;
            next_state = s0;
        end
        else 
            crt_state = next_state;
            found = ok;
    end
    
    always @(crt_state or bit)
    begin
        case (crt_state)
            s0: begin
                if(bit == 1)
                    next_state = s1;
                else
                    next_state = s0;
                ok = 0;
            end

            s1: begin
                if(bit == 1)
                    next_state = s2;
                else
                    next_state = s3;
                ok = 0;
            end

            s2: begin
                if(bit == 1) begin
                    next_state  = s2;
                    ok = 0;
                end
                else begin
                    next_state = s3;
                    ok = 1;
                end
            end

            s3: begin
                if(bit == 1) begin
                    next_state  =s1;
                    ok = 1;
                end
                else begin
                    next_state = s0;
                    ok = 0;
                end
            end
        endcase
    end
endmodule
