/* 
-----------------------------------------------------------------
File Name : monitor.sv
Project/assignment : 
Last Modified : Fri 22 Dec 2017 06:46:13 PM IST
Creation Date : 18-12-2017
Version : v1
Author : Vishwajeet
Organisation : EITRA
-----------------------------------------------------------------
*/


class my_monitor extends uvm_monitor;
virtual and_intf and_if;
`uvm_component_utils(my_monitor)
transaction tx1;

uvm_analysis_port #(transaction) item_collected_port;

function new(string name,uvm_component parent);
super.new(name,parent);
tx1= new();
endfunction : new 

virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  tx1=new();
 item_collected_port = new("item_collected_port", this);
  if(!uvm_config_db#(virtual and_intf)::get(this, "", "and_if", and_if))
       `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".and_if"});      
endfunction : build_phase 

virtual task run_phase(uvm_phase phase);
 super.run_phase(phase);
  //repeat(2) begin
  forever begin
//  phase.raise_objection(this); 
// #1;
 @(posedge and_if.enable)// begin
   tx1.enable = and_if.enable;
   tx1.in1 = and_if.in1;
   tx1.in2 = and_if.in2;
   tx1.out = and_if.out; 
`uvm_info(get_full_name(),"print from monitor",UVM_MEDIUM) 
   tx1.print();
 item_collected_port.write(tx1);// end
  // phase.all_dropped(this);
  end
endtask : run_phase

endclass
