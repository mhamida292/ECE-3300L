`timescale 1ns / 1ps

module comparator(
    input [3:0] a, b,
    output result
    );
    
    assign result = a>b;
    
endmodule