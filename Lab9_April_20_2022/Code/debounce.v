`timescale 1ns / 1ps

module debounce(
    input clk, //slowclock
    input btnIN, //push button
    output reg outSig 
    );
    
    reg Qbar;
    
    always @(posedge clk) 
    begin
        outSig<=btnIN; 
        Qbar<=!outSig; 
    end
    
endmodule