`timescale 1ns / 1ps


module SERIALIZER(
    input [11:0] pull_in,
    input pull_but,
    output reg [3:0] out_red,
    output reg [3:0] out_green,
    output reg [3:0] out_blue
    );
   reg state=0;
   
 always@(pull_but or pull_in)
     begin
        if (pull_but) 
        state = ~state;
        else 
        state = state;
     end 
     
 always@(pull_but or state)
     begin
     case(state)
     1'b0:
     begin end
     1'b1:
     begin
        out_red = pull_in[3:0];
        out_green = pull_in[7:4];
        out_blue = pull_in[11:8];
     end
        endcase 
     end   
        
endmodule
