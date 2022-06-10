`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2022 07:48:47 PM
// Design Name: 
// Module Name: GenericDECO
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////




module GenvarDECO #(parameter n=3) 
(
    input[2:0]i,
    input e,
    output[7:0]p    
);  
  wire[1:0] temp;     
genvar j; 
generate 
for(j=1; j<n; j=j+1)
    begin 
          DECO UNIT ( 
            .in(i[1:0]),                     
            .out(p[(3+((j-1)*4)):((j-1)*4)]),                
            .en(temp[j-1])
                    ); 
    end
 endgenerate  
  assign temp[0] = ~ i[2];
  assign temp[1]=i[2];
endmodule

