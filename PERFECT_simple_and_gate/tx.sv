/* 
-----------------------------------------------------------------
File Name : seq.sv
Project/assignment : 
Last Modified : Fri 22 Dec 2017 06:09:03 PM IST
Creation Date : 18-12-2017
Version : v1
Author : Vishwajeet
Organisation : EITRA
-----------------------------------------------------------------
*/
import uvm_pkg::*;
class transaction extends uvm_sequence_item;
  rand bit [7:0]in1;
  rand bit [7:0]in2;
       bit [7:0]out;
   rand    bit enable;
`uvm_object_utils_begin(transaction)
  `uvm_field_int(in1,UVM_ALL_ON)
  `uvm_field_int(in2,UVM_ALL_ON)
  `uvm_field_int(out,UVM_ALL_ON)
  `uvm_field_int(enable,UVM_ALL_ON)
`uvm_object_utils_end

//constraint en {enable==1;}

function new(string name="transaction");
super.new(name);
endfunction : new 
endclass 
