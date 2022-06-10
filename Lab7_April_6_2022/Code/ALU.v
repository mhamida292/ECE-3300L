`timescale 1ns / 1ps


module ALU(
    input [3:0] opa,
    input [3:0] opb,
    input signa,
    input signb,
    input [1:0] asm,
    output [7:0] opc,
    output signc1
    );
    reg [7:0] ropc=0;
    reg signc=0;
    always@(*)
    begin
    case(asm)
            2'b00: 
            begin
            ropc <= 0;
            signc <=0;
            end
            
            2'b01://ADD
            begin
                if(signa==0 && signb==1)
                begin
                    if(opa<opb)
                    begin
                    ropc <= opb-opa;
                    signc <=1;
                    end
                   else if(opa>opb)
                    begin
                    ropc <= opa-opb;
                    signc <=0;
                    end
                    else
                    begin
                    ropc <=0;
                    signc <=0;
                    end
                end
               else if(signa==1 && signb==0)
                begin
                    if(opa<opb)
                    begin
                    ropc <= opb-opa;
                    signc <=0;
                    end
                   else if(opa>opb)
                    begin
                    ropc <= opa-opb;
                    signc <=1;
                    end
                    else
                    begin
                    ropc <=0;
                    signc <=0;
                    end
                end
                else if(signa==1 && signb==1)
                begin
                ropc <=opa+opb;
                signc <=1;                
                end
                else 
                begin
                ropc <=opa+opb;
                signc <=0;                
                end
            end 
            
            2'b10://SUBTRACT
            begin
                if(signa==0 && signb==0)
                begin
                    if(opa<opb)
                    begin
                    ropc <= opb-opa;
                    signc <=1;
                    end
                   else if(opa>opb)
                    begin
                    ropc <= opa-opb;
                    signc <=0;
                    end
                    else
                    begin
                    ropc <=0;
                    signc <=0;
                    end
                end
               else if(signa==1 && signb==1)
                begin
                    if(opa<opb)
                    begin
                    ropc <= opb-opa;
                    signc <=0;
                    end
                   else if(opa>opb)
                    begin
                    ropc <= opa-opb;
                    signc <=1;
                    end
                    else
                    begin
                    ropc <=0;
                    signc <=0;
                    end
                end
                else if(signa==1 && signb==0)
                begin
                ropc <=opa+opb;
                signc <=1;                
                end
                else 
                begin
                ropc <=opa+opb;
                signc <=0;                
                end
            end 
            
            2'b11: //MULTIPICATION
            begin
             ropc = opa * opb;
                if(signa==1 || signb==1)
                    signc <= 1;
                else if(signa==0 && signb==0)
                    signc <= 0;
                else
                    signc <= 0;
            
            end 
           
        endcase
   end 
   assign opc = ropc;
   assign signc1 = signc;
endmodule
