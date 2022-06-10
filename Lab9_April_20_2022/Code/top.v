`timescale 1ns / 1ps


module top(
    input[3:0] clkManagerSW,
    input[3:0] redSW,
    input[3:0] greenSW,
    input[3:0] blueSW, 
    input clk, 
    input rst,
    input switchProfileBtn,
    output[5:0] ledOutput
    );
    wire clkMgrOut;
    CLKMANAGER clkManager(
    .clk(clk),
    .rst(rst),
    .SW(clkManagerSW),
    .clkout(clkMgrOut)
    );
    wire tmpEn = 1'b1; 
    wire [2:0] tmpLEDOUT; 
    PWM redLED(
    .inputSW(redSW),
    .clk(clkMgrOut), 
    .rst(rst), 
    .en(tmpEn),
    .result(tmpLEDOUT[0])
    );
    
    PWM greenLED(
    .inputSW(greenSW),
    .clk(clkMgrOut), 
    .rst(rst), 
    .en(tmpEn),
    .result(tmpLEDOUT[1])
    );
    
    PWM blueLED(
    .inputSW(blueSW),
    .clk(clkMgrOut), 
    .rst(rst), 
    .en(tmpEn),
    .result(tmpLEDOUT[2])
    );
    
    FSM fsm(
    .sel(tmpLEDOUT),
    .fsmBTN(switchProfileBtn),
    .rst(rst),
    .clk(clkMgrOut),
    .led1(ledOutput[2:0]),
    .led2(ledOutput[5:3])
    );
    
endmodule
