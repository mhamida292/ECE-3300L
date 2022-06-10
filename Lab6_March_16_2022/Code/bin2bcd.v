module bin2bcd(
   input [31:0] bin,
   
   output reg [31:0] bcd
   );
   
integer i;
	
always @(bin) begin
    bcd=0;		 	
    for (i=0;i<32;i=i+1) begin	
 	
	
	
   // else
   // begin
       	//Iterate once for each bit in input number
    if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;		//If any BCD digit is >= 5, add three
	if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
	if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
	if (bcd[15:12] >= 5) bcd[15:12] = bcd[15:12] + 3;
	if (bcd[19:16] >= 5) bcd[19:16] = bcd[19:16] + 3;
	if (bcd[23:20] >= 5) bcd[23:20] = bcd[23:20] + 3;
	if (bcd[26:23] >= 5) bcd[26:23] = bcd[26:23] + 3;
	if (bcd[31:27] >= 5) bcd[31:27] = bcd[31:27] + 3;
	bcd = {bcd[31:0],bin[32-i]};
    //end
  	
	end			//Shift one bit, and shift in proper bit from input 
    end
endmodule