`timescale 1ns / 1ps


module BSUPDOWN(
    input clk1,
    output [1:0] s0,
    output [1:0] s1
    );
    reg [3:0] tmp;
    always@(posedge clk1)
    begin
          tmp <= tmp+1;
    end 
    assign s0[0] = tmp[0]; 
    assign s0[1] = tmp[2]; 
    assign s1[0] = tmp[1]; 
    assign s1[1] = tmp[3]; 
      
  

endmodule

