`timescale 1ns / 1ps


module top  
(
    input[3:0] clkManagerSW,
    input[11:0] in,
    input clk, 
    input rst,
    input writebut,
    input readbut,
    input pullbut,
    input switchProfileBtn,
    output full,
    output empty,
    output [6:0] Cnode1,
    output [7:0] AN1,
    output seg,
    output[5:0] ledOutput
    );
    wire clkMgrOut;
    CLKMANAGER clkManager(
    .clk(clk),
    .rst(rst),
    .SW(clkManagerSW),
    .clkout(clkMgrOut)
    );
    
    
    
    fifo fifo_wrapper(
   .data_in(in),
   .clk(clkMgrOut),
   .write(writebut),
   .read(readbut),
   .data_out(seg7Digit[23:12]),
   .fifo_full(full),
   .fifo_empty(empty)
    
    );
    
    wire [31:0] seg7Digit; 
    SERIALIZER serial_wrapper (
    .pull_in(seg7Digit[23:12]),
    .pull_but(pullbut),
    .out_red(seg7Digit[3:0]),
    .out_green(seg7Digit[7:4]),
    .out_blue(seg7Digit[11:8])
    );
    
    wire tmpEn = 1'b1; 
    wire [2:0] tmpLEDOUT; 
    PWM redLED(
    .inputSW(seg7Digit[3:0]),
    .clk(clkMgrOut), 
    .rst(rst), 
    .en(tmpEn),
    .result(tmpLEDOUT[0])
    );
    
    PWM greenLED(
    .inputSW(seg7Digit[7:4]),
    .clk(clkMgrOut), 
    .rst(rst), 
    .en(tmpEn),
    .result(tmpLEDOUT[1])
    );
    
    PWM blueLED(
    .inputSW(seg7Digit[11:8]),
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
    
    SEGDRIVE seg7driver_wrapper(
        .nexysCLK(clk), 
        .inDigit(seg7Digit),
        .Cnode(Cnode1),
        .dp(seg),
        .AN(AN1)
    );
    
endmodule