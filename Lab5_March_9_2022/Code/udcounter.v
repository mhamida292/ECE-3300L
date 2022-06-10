`timescale 1ns / 1ps


module udcounter(
    input clk1,
    input rst1,
    input en,
    input ud,
    output reg [26:0] tmp
    );

    always@(posedge clk1 or posedge rst1)
    begin
    if(en)

      begin
        if(rst1)
            begin
                if(ud)// 0 is up,  1 is down
                tmp<= 27'd99999999;
                else
                tmp<= 27'd0;
             end
        else
            begin
                if(ud)
                    if(tmp==27'd0)
                        tmp <= 27'd99999999;
                    else
                        tmp <= tmp-1;
                else
                    if(tmp==27'd99999999)
                        tmp <= 27'd0;
                    else
                        tmp <= tmp+1;
             end 
           //tmp = tmp;
       end
       else
       tmp=tmp;
    end

endmodule