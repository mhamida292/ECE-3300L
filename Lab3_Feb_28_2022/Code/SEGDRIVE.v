`timescale 1ns / 1ps

module SEGDRIVE(
   // input en,
    //input [31:0] SW,
    input [3:0] tmp_SW,
    output reg [6:0] Cnode,
    output dp,
    output wire [7:0] AN
    );
    //reg [31:0] temp;
    //reg [3:0] tmp_SW;
    
    assign AN = 8'b11111110;
    assign dp = 1'b1;
    always@(tmp_SW)
    begin
        case (tmp_SW)
            4'd0: Cnode <= 7'b0000001; 
            4'd1: Cnode <= 7'b1001111; 
            4'd2: Cnode <= 7'b0010010; 
            4'd3: Cnode <= 7'b0000110; 
            4'd4: Cnode <= 7'b1001100; 
            4'd5: Cnode <= 7'b0100100; 
            4'd6: Cnode <= 7'b0100000; 
            4'd7: Cnode <= 7'b0001111; 
            4'd8: Cnode <= 7'b0000000; 
            4'd9: Cnode <= 7'b0000100; 
            4'd10:Cnode <= 7'b0001000; 
            4'd11:Cnode <= 7'b1100000; 
            4'd12:Cnode <= 7'b0110001; 
            4'd13:Cnode <= 7'b1000010; 
            4'd14:Cnode <= 7'b0110000; 
            4'd15:Cnode <= 7'b0111000; 
        endcase
    end
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
endmodule