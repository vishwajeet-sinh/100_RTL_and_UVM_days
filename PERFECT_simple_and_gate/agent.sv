/* 
-----------------------------------------------------------------
File Name : agent.sv
Project/assignment : 
Last Modified : Sat 23 Dec 2017 03:26:40 PM IST
Creation Date : 18-12-2017
Version : v1
Author : Vishwajeet
Organisation : EITRA
-----------------------------------------------------------------
*/

class my_agent extends uvm_agent;
  my_sequencer seqr;
  my_driver drv;
  my_monitor mon;

  `uvm_component_utils(my_agent)

  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction : new 

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seqr = my_sequencer::type_id::create("seq", this);
    drv = my_driver::type_id::create("drv", this);
    mon = my_monitor::type_id::create("mon", this);
  endfunction : build_phase 

  virtual function void connect_phase(uvm_phase phase);
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction : connect_phase 
endclass 
