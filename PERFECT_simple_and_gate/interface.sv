/* 
-----------------------------------------------------------------
File Name : interface.sv
Project/assignment : 
Last Modified : Monday 18 December 2017 02:54:30 PM IST
Creation Date : 13-10-2017
Version : v1
Author : Vishwajeet
Organisation : EITRA
-----------------------------------------------------------------
*/
interface and_intf;
logic [7:0]in1;
logic [7:0]in2;
logic [7:0]out;
logic enable;
//clocking cb@(posedge clk)
//output in1,in2;
//input out;
//endclocking

//modport DUT(input in1,in2, output out);
//modport DRIVER(input out,output in1,in2);
//modport TEST(clocking cb);

endinterface
