`timescale 1ns / 1ps


module ALU(
    input [3:0] opa,
    input [3:0] opb,
    input [1:0] asm,
    output [7:0] opc
    );
    reg [7:0] ropc=0;
    always@(*)
    begin
    case(asm)
            2'b00: 
            begin
            ropc <= 0;
            end
            
            2'b01://ADD
            begin
            ropc <=opa+opb;
            end 
            
            2'b10://SUBTRACT
            begin
            ropc= opa-opb;
            end 
            
            2'b11: //MULTIPICATION
            begin
             ropc = opa * opb;
            end 
           
        endcase
   end 
   assign opc = ropc;
endmodule
