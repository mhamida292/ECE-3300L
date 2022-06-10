`timescale 1ns / 1ps

module FSM(
    input  [1:0] in,
    input  but,
    //input  clk,
    output [1:0] outasm,
    output outsra,
    output outsrb
    );

    reg state=0;
    reg [1:0] next_state;
    reg [1:0] next_state2;

  always@(in or but)
    begin
        if (but) 
        state = ~state;
        else 
        state = state;
    end
    always@(in or state)
    begin
    case (state)
        1'b0://asm
            begin
                next_state = in;
            end
        1'b1://rot or shift for bar shift
            begin
                next_state2[0] = in[0];
                next_state2[1] = in[1];
            end
    endcase
    end
assign outasm = next_state;
assign outsra = next_state2[0];
assign outsrb = next_state2[1];
endmodule
