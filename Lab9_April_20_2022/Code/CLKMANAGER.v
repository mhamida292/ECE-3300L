module CLKMANAGER(
    input clk,
    input rst,
    input [3:0] SW, 
    output reg clkout =0
    );
    reg [31:0] sel;

   
    wire [4:0] temp = {1'b1,SW};
    always@(posedge clk or posedge rst)
    begin: DREG
        if(rst)
            sel<= 32'd0;
        else
            sel<=sel+1;       
    end
    
  always@(posedge clk)
  begin
    case(SW)
            5'd0: clkout <= sel[0];
            5'd1: clkout <= sel[1];
            5'd2: clkout <= sel[2];
            5'd3: clkout <= sel[3];
            5'd4: clkout <= sel[4];
            5'd5: clkout <= sel[5];
            5'd6: clkout <= sel[6];
            5'd7: clkout <= sel[7];
            5'd8: clkout <= sel[8];
            5'd9: clkout <= sel[9];
            5'd10:clkout <= sel[10];
            5'd11:clkout <= sel[11];
            5'd12:clkout <= sel[12];
            5'd13:clkout <= sel[13];
            5'd14:clkout <= sel[14];
            5'd15:clkout <= sel[15];
            5'd16:clkout <= sel[16];
            5'd17:clkout <= sel[17];
            5'd18:clkout <= sel[18];
            5'd19:clkout <= sel[19];
            5'd20:clkout <= sel[20];
            5'd21:clkout <= sel[21];
            5'd22:clkout <= sel[22];
            5'd23:clkout <= sel[23];
            5'd24:clkout <= sel[24];
            5'd25:clkout <= sel[25];
            5'd26:clkout <= sel[26];
            5'd27:clkout <= sel[27];
            5'd28:clkout <= sel[28];
            5'd29:clkout <= sel[29];
            5'd30:clkout <= sel[30];
            5'd31:clkout <= sel[31]; 
        endcase
    end
   
  
endmodule