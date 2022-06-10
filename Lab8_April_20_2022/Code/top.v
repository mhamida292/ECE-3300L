`timescale 1ns / 1ps


module top(
    //INPUTS FROM FPGA
    input clkt,
    input rstt,
    input [3:0] asw,
    input [3:0] bsw,
    input [3:0] cont,
    input aud,
    input aload,
    input bud,
    input bload,
    input [1:0] in,
    input button,
    //OUTPUT TO 7SEG DISPLAY
   // output [7:0] opc,
    //output signc1,
    //7SEG DISPLAY INPUTS
    output [6:0] Cnode1,
    output [7:0] AN1,
    output seg
    );

    wire [31:0] seg7Digit; 
    //Send input changes to 7seg display
    assign seg7Digit[3:0] = asw; 
    assign seg7Digit[7:4] = bsw; 
   // assign seg7Digit[11:8] = tmp_cnta; 
    //assign seg7Digit[19:16] = tmp_cntb;  
   
    
    wire [7:0] opc;
    
    wire slowclk_out;
    CLKMANAGER clockmanager_wrapper(
        .clk(clkt),
        .SW(cont),
        .clkout(slowclk_out)
    );
//wire [3:0] tmp_cnta; 
    UPDOWN udcounter_wrappera(
        .rst1(rstt),
        .load(aload),
        .clk1(slowclk_out), 
        .tmp(seg7Digit[11:8]),
        .a(asw),
        .ud(aud)
    );
//wire [3:0] tmp_cntb; 
    UPDOWN udcounter_wrapperb(
        .rst1(rstt),
        .load(bload),
        .clk1(slowclk_out), 
        .tmp(seg7Digit[19:16]),
        .a(bsw),
        .ud(bud)
    );
wire [1:0] sel1;
wire [1:0] sel2;
BSUPDOWN bsupdown_wrapper(
        .clk1(slowclk_out),
        .s0(sel1),
        .s1(sel2)
    );
wire [1:0] amscon;
 FSM fsm_wrapper(
    .in(in),
    .but(button),
    //.clk(slowclk_out),
    .outasm(amscon),
    .outsra(sra),
    .outsrb(srb)
    );
wire sra;
wire srb;
BARSHI barshi_wrappera(
        .B(seg7Digit[11:8]),
        .SW(sel1),
        .sel(sra),
        .P(seg7Digit[15:12])
    );

BARSHI barshi_wrapperb(
        .B(seg7Digit[19:16]),
        .SW(sel2),
        .sel(srb),
        .P(seg7Digit[23:20])
    );


    ALU alu_wrapper(
     .opa(seg7Digit[15:12]),
     .opb(seg7Digit[23:20]),
     .asm(in),
     .opc(seg7Digit[31:24])
    );
    
   SEGDRIVE seg7driver_wrapper(
        .nexysCLK(clkt), 
        .inDigit(seg7Digit),
         .Cnode(Cnode1),
        .dp(seg),
        .AN(AN1)
    );
    
    
    
    
endmodule
