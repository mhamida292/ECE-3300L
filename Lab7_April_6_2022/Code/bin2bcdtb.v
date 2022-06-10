`timescale 1ns / 1ps

module bin2bcdtb();
    reg [7:0]bin_tb;
    wire [7:0] bcd_tb;    
        
    bin2bcd COMP (
    .bin(bin_tb),
    .bcd(bcd_tb)
    ); 
    
     initial
           begin: TEST
                #100
                bin_tb = 8'b00100000;
                #100
                bin_tb = 8'b00010000;
                #1000
                $finish;            
           end
    
    
endmodule