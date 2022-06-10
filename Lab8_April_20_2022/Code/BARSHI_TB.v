`timescale 1ns / 1ps

module BARSHI_TB(
    );
    reg [3:0] Btb;
    reg [1:0] SWtb;
    reg seltb;
    wire [3:0] Ptb;
    
    BARSHI COMP(
    .B(Btb),
    .SW(SWtb),
    .sel(seltb),
    .P(Ptb)
    );
    
    initial 
        begin
        Btb = 7;
        SWtb = 2;
        seltb = 1;
        end 
    
endmodule
