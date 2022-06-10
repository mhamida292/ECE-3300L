`timescale 1ns / 1ps
module bin2bcd_tb(
    );
    reg [31:0]bin_tb;
    wire [31:0] bcd_tb;    
        
    bin2bcd COMP (
    .bin(bin_tb),
    .bcd(bcd_tb)
    );    
    initial 
        begin
        bin_tb = 45;
        //$finish
        end        
    
   
endmodule
