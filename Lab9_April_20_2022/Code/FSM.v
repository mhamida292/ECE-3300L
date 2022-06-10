module FSM(
    input[2:0] sel,
    input  fsmBTN,
    input  rst,
    input  clk,
    output reg [2:0] led1,
    output reg [2:0] led2
    );
    wire debouncedSig; 
    debounce debounce(
        .clk(clk), 
        .btnIN(fsmBTN),
        .outSig(debouncedSig)
    );
    reg state;
    reg next_state;
    //
    always@(posedge clk)
    begin
        if (rst) 
            state = 0;
        else state = next_state;
    end
    
    always@(debouncedSig)
    begin
       next_state <= debouncedSig; 
    end
    
    always@(state or sel)
    begin
        if(state)
            led1 = sel;
        else
            led2 = sel;
    end
endmodule