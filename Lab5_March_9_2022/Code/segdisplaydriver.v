`timescale 1ns / 1ps

module segdisplaydriver( 
    input [31:0] inDigit, 
    output reg [6:0] Cnode,
    output dp,
    output reg [7:0] AN,
    input nexysCLK, // 100MHz
    output reg divided_clk = 0 // 10kHz => 10ms period, 0.5ms ON, 0.5ms OFF
    );
    reg [3:0] singledigit = 0; 
    reg [3:0] refreshcounter = 0;
    // Calculate division value = 100MHz / (2 * desired frequency) - 1 => 10kHz => 4999
    
    localparam div_value = 25000;
    
    integer counter_value = 0;
    
    always @(posedge nexysCLK) 
    begin
        if (counter_value == div_value)  // For every (div_value) clock cycles, reset counter back to 0
            counter_value <= 0; // Use <= for parallel & same time, = for sequential - one after the other
        else
            counter_value <= counter_value + 1;
    end
    
    // divide clock
    always @(posedge nexysCLK)
    begin
        if (counter_value == div_value)
            divided_clk <= ~divided_clk; // Flip signal
        else
            divided_clk <= divided_clk; // Keep signal the same
    end
    /*CLOCK DIVIDER CODE*/
     
    always @(posedge divided_clk)
    begin
        refreshcounter <= refreshcounter + 1;
    end
    
    always @(refreshcounter)
        begin 
            case(refreshcounter)
                4'b0000: singledigit = inDigit[3:0];    // digit 1 value (right digit)
                4'b0001: singledigit = inDigit[7:4];    // digit 2 value
                4'b0010: singledigit = inDigit[11:8];    // digit 3 value
                4'b0011: singledigit = inDigit[15:12];    // digit 4 value 
                4'b0101: singledigit = inDigit[19:16];    // digit 5 value 
                4'b0110: singledigit = inDigit[23:20];    // digit 6 value
                4'b0111: singledigit = inDigit[27:24];    // digit 7 value
                4'b1000: singledigit = inDigit[31:28];    // digit 8 value (left digit)
            endcase
        end
        
    always @(refreshcounter)
    begin
        case(refreshcounter)
            4'b0000: AN = 8'b11111110;     // digit 1 ON (right digit)
            4'b0001: AN = 8'b11111101;     // digit 2 ON
            4'b0010: AN = 8'b11111011;     // digit 3 ON
            4'b0011: AN = 8'b11110111;     // digit 4 ON 
            4'b0100: AN = 8'b11101111;     // digit 5 ON 
            4'b0101: AN = 8'b11011111;     // digit 6 ON 
            4'b0110: AN = 8'b10111111;     // digit 7 ON 
            4'b0111: AN = 8'b01111111;     // digit 8 ON (left digit)
            default: AN = 8'bZZZZZZZZ; 
        endcase 
    end
    
    assign dp = 1'b1;
    always@(singledigit)
        begin
            case (singledigit)
                4'd0: Cnode<= 7'b0000001; //0
                4'd1: Cnode<= 7'b1001111; //1
                4'd2: Cnode<= 7'b0010010; //2
                4'd3: Cnode<= 7'b0000110; //3
                4'd4: Cnode<= 7'b1001100; //4
                4'd5: Cnode<= 7'b0100100; //5
                4'd6: Cnode<= 7'b0100000; //6
                4'd7: Cnode<= 7'b0001111; //7
                4'd8: Cnode<= 7'b0000000; //8
                4'd9: Cnode<= 7'b0000100; //9
                4'd10:Cnode<= 7'b0001000; //A
                4'd11:Cnode<= 7'b1100000; //B
                4'd12:Cnode<= 7'b0110001; //C
                4'd13:Cnode<= 7'b1000010; //D
                4'd14:Cnode<= 7'b0110000; //E
                4'd15:Cnode<= 7'b0111000; //F
                default: Cnode = 7'b0000000; //DEFAULT CASE EVERYTHING ON
            endcase
        end
endmodule