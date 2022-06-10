`timescale 1ns / 1ps
module UPCOUNT (
    input clk, 
    input rst, 
    input en,
    output reg [4:0] count
    );
    assign en = 1; 
    reg [4:0] tmp = 0;
    always@(posedge rst or posedge clk)
    begin
        if(rst)
            begin
                tmp <= 4'b1111;
            end
        else
            begin
                if(en)
                    begin
                        tmp <= tmp+1;
                    end
            end
        count <= tmp;
    end
endmodule
