/* 
-----------------------------------------------------------------
File Name : driver.sv
Project/assignment : 
Last Modified : Fri 22 Dec 2017 06:44:17 PM IST
Creation Date : 18-12-2017
Version : v1
Author : Vishwajeet
Organisation : EITRA
-----------------------------------------------------------------
*/

class my_driver extends uvm_driver#(transaction);
virtual and_intf and_if;
`uvm_component_utils(my_driver)
 transaction tx;

function new(string name,uvm_component parent);
super.new(name,parent);
endfunction : new 

virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  if(!uvm_config_db#(virtual and_intf)::get(this, "", "and_if", and_if))
       `uvm_fatal("NO_VIF",{"virtual interface must be set for: ",get_full_name(),".and_if"});      
endfunction : build_phase 

virtual task run_phase(uvm_phase phase);
//`uvm_info(get_full_name(),"print from driver r",UVM_MEDIUM) 
  super.run_phase(phase);
   forever begin
   tx=new();
 // phase.raise_objection(this);
//`uvm_info(get_full_name(),"print from driver for",UVM_MEDIUM) 
  seq_item_port.get_next_item(tx); #1;
  drive();
  seq_item_port.item_done();

 // phase.drop_objection(this);
  end
endtask : run_phase

virtual task drive();
`uvm_info(get_full_name(),"print from driver",UVM_MEDIUM) 
  tx.print();
  if(tx.enable)
  begin  
//`uvm_info(get_full_name(),"print from driver in if",UVM_MEDIUM) 
    and_if.enable <= tx.enable;
    and_if.in1 <= tx.in1;
    and_if.in2 <= tx.in2;
#1;
  //  tx.out = and_if.out;
    and_if.enable<=0;
`uvm_info(get_full_name(),$sformatf("enable = %0d",and_if.enable),UVM_MEDIUM) 
  end 
endtask 
endclass
