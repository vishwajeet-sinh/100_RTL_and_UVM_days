/* 
-----------------------------------------------------------------
File Name : scoreboard.sv
Project/assignment : 
Last Modified : Wed 20 Dec 2017 12:01:22 PM IST
Creation Date : 20-12-2017
Version : v1
Author : Vishwajeet
Organisation : EITRA
-----------------------------------------------------------------
*/

class my_scoreboard extends uvm_scoreboard;
   transaction tx1[$];
  `uvm_component_utils(my_scoreboard)
  uvm_analysis_imp#(transaction, my_scoreboard) item_collected_export;
 
  // new - constructor
  function new (string name = "my_scoreboard", uvm_component parent);
    super.new(name, parent);
  endfunction : new
 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_export = new("item_collected_export", this);
  endfunction: build_phase
   
  // write
  virtual function void write(transaction tx);
    $display("SCB:: Pkt recived");
    tx1.push_back(tx);
  endfunction : write
 
  // run phase
  virtual task run_phase(uvm_phase phase);
      transaction tx_comp;
      forever begin
        wait(tx1.size()>0)
	 tx_comp=tx1.pop_front();
	 if( (tx_comp.in1 & tx_comp.in2 ) == tx_comp.out)
		 `uvm_info("SCOREBOARD","\n######### :) ############ TRANSACTION MATCHED ######## :) ############# \n",UVM_LOW)
         else
	       `uvm_error("SCOREBOARD","\n######### :( ############ TRANSACTION MATCHED ######## :( ############# \n") 
      end
  endtask : run_phase
endclass : my_scoreboard
