/* 
-----------------------------------------------------------------
File Name : top.sv
Project/assignment : 
Last Modified : Fri 22 Dec 2017 05:51:32 PM IST
Creation Date : 18-12-2017
Version : v1
Author : Vishwajeet
Organisation : EITRA
-----------------------------------------------------------------
*/

module top;

and_intf and_if();
and_dut  dut(.a(and_if.in1),.b(and_if.in2),.enable(and_if.enable),.out(and_if.out));

initial begin
 uvm_config_db#(virtual and_intf)::set(uvm_root::get(),"*","and_if",and_if);
 $dumpfile("test.vcd");
 $dumpvars(0,top);
end

initial 
  run_test("my_test");

endmodule 
