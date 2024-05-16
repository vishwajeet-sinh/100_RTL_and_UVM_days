/* 
-----------------------------------------------------------------
File Name : dut.sv
Project/assignment : 
Last Modified : Fri 22 Dec 2017 06:18:16 PM IST
Creation Date : 13-10-2017
Version : v1
Author : Vishwajeet
Organisation : EITRA
-----------------------------------------------------------------
*/
module and_dut(input bit enable,input bit[7:0]a,b,output bit[7:0]out);

always @(enable)
begin
out = a & b;
end
endmodule
