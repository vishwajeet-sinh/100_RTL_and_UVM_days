/* 
-----------------------------------------------------------------
File Name : seqr.sv
Project/assignment : 
Last Modified : Mon 18 Dec 2017 05:31:18 PM IST
Creation Date : 18-12-2017
Version : v1
Author : Vishwajeet
Organisation : EITRA
-----------------------------------------------------------------
*/
class my_sequencer extends uvm_sequencer#(transaction);
`uvm_component_utils(my_sequencer)

function new(string name,uvm_component parent);
super.new(name,parent);
endfunction : new 

endclass 

//typedef uvm_sequencer#(transaction) my_sequencer;
