/* 
-----------------------------------------------------------------
File Name : env.sv
Project/assignment : 
Last Modified : Wed 20 Dec 2017 11:58:18 AM IST
Creation Date : 18-12-2017
Version : v1
Author : Vishwajeet
Organisation : EITRA
-----------------------------------------------------------------
*/

class my_environment extends uvm_env;

`uvm_component_utils(my_environment)
my_agent agent;
my_scoreboard scoreboard;
function new(string name,uvm_component parent);
super.new(name,parent);
endfunction : new 

virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  agent = my_agent::type_id::create("agent", this);
  scoreboard = my_scoreboard::type_id::create("scoreboard", this);
endfunction : build_phase 

virtual function void connect_phase(uvm_phase phase);
 super.connect_phase(phase);
 agent.mon.item_collected_port.connect(scoreboard.item_collected_export); 
endfunction  

endclass
