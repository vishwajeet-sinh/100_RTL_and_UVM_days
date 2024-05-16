/* 
-----------------------------------------------------------------
File Name : test.sv
Project/assignment : 
Last Modified : Fri 22 Dec 2017 05:48:03 PM IST
Creation Date : 18-12-2017
Version : v1
Author : Vishwajeet
Organisation : EITRA
-----------------------------------------------------------------
*/

class my_test extends uvm_test;
`uvm_component_utils(my_test)
my_environment env;
my_sequence seq;
//my_sequence_next seq_next;
function new(string name,uvm_component parent);
super.new(name,parent);
endfunction : new 

virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  env = my_environment::type_id::create("env", this);
seq = my_sequence::type_id::create("seq");
//seq_next = my_sequence_next::type_id::create("seq_next");
//my_sequence::type_id::set_type_override(my_sequence_next::get_type());
endfunction : build_phase 
 
 virtual 

 virtual task run_phase(uvm_phase phase);
  super.run_phase(phase);
  phase.raise_objection(this);
  //fork
  seq.start(env.agent.seqr);
 // seq_next.start(env.agent.seqr);
//join
   phase.drop_objection(this);
phase.phase_done.set_drain_time(this, 50);
   endtask : run_phase
 

endclass
