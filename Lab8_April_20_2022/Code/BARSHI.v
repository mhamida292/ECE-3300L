`timescale 1ns / 1ps



module BARSHI(
    input [3:0] B,
    input [1:0] SW,
    input sel,
    output reg [3:0] P
    ); 
    reg [3:0] sr;
    
     always@(*)
    begin
    if(sel)
    begin
    case(SW) // rotate
            2'b00: 
            begin
            sr[3]=B[3];
            sr[2]=B[2];
            sr[1]=B[1];
            sr[0]=B[0];
            end
            
            2'b01:
            begin
            sr[3]=B[0];
            sr[2]=B[3];
            sr[1]=B[2];
            sr[0]=B[1];
            end 
            
            2'b10:
            begin
            sr[3]=B[1];
            sr[2]=B[0];
            sr[1]=B[3];
            sr[0]=B[2];
            end 
            
            2'b11: 
            begin
            sr[3]=B[2];
            sr[2]=B[1];
            sr[1]=B[0];
            sr[0]=B[3];
            end 
        endcase
        end
       else
        begin//shift
        case(SW)
            2'b00: 
            begin
            sr[3]=B[3];
            sr[2]=B[2];
            sr[1]=B[1];
            sr[0]=B[0];
            end
            
            2'b01:
            begin
            sr[3]=0;
            sr[2]=B[3];
            sr[1]=B[2];
            sr[0]=B[1];
            end 
            
            2'b10:
            begin
            sr[3]=0;
            sr[2]=0;
            sr[1]=B[3];
            sr[0]=B[2];
            end 
            
            2'b11: 
            begin
            sr[3]=0;
            sr[2]=0;
            sr[1]=0;
            sr[0]=B[3];
            end 
            endcase
        end
        P = sr;
   end
endmodule
