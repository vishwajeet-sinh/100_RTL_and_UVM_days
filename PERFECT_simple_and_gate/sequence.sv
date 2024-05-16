/* 
-----------------------------------------------------------------
File Name : sequence.sv
Project/assignment : 
Last Modified : Fri 22 Dec 2017 06:13:53 PM IST
Creation Date : 18-12-2017
Version : v1
Author : Anil Lunagariya
Organisation : EITRA
-----------------------------------------------------------------
*/
class my_sequence extends uvm_sequence#(transaction);
 `uvm_object_utils(my_sequence)
 transaction tx1;
 //uvm_objection obj;
 function new(string name="my_sequence");
 super.new(name);//obj=new();
 endfunction : new

/*virtual task pre_body();
 obj.raise_objection(); 
endtask */

virtual task body();
 // `uvm_do(tx1)
  //tx1.print();
  /*tx1 = new();
  start_item(tx1);
  assert(tx1.randomize);
  tx1.print();
  finish_item(tx1);*///repeat(3) begin
  `uvm_info(get_full_name(),"print from sequence",UVM_MEDIUM)
`uvm_do_with(tx1,{tx1.enable==1;})
//`uvm_do_with(tx1,{tx1.enable==0;})
`uvm_do_with(tx1,{tx1.enable==1;})
//`uvm_do_with(tx1,{tx1.enable==0;})
`uvm_do_with(tx1,{tx1.enable==1;})
// end
/* req = transaction::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.print();
    send_request(req);
    wait_for_item_done();*/
     endtask

/*    virtual task post_body();
 obj.drop_objection(); 
endtask */

endclass 

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/*class my_sequence_next extends uvm_sequence#(transaction);
 `uvm_object_utils(my_sequence_next)
 transaction tx1;
 //uvm_objection obj;
 function new(string name="my_sequence");
 super.new(name);//obj=new();
 endfunction : new

/*virtual task pre_body();
 obj.raise_objection(); 
endtask */

/*virtual task body();
 // `uvm_do(tx1)
  //tx1.print();
  /*tx1 = new();
  start_item(tx1);
  assert(tx1.randomize);
  tx1.print();
  finish_item(tx1);*//*repeat(2) begin
  `uvm_info(get_full_name(),"print from sequence",UVM_MEDIUM)
`uvm_do_with(tx1,{tx1.in1==8'b1111_1111;tx1.in2==8'b1010_1010;}) end
/* req = transaction::type_id::create("req");
    wait_for_grant();
    req.randomize();
    req.print();
    send_request(req);
    wait_for_item_done();*/
    // endtask

/*    virtual task post_body();
 obj.drop_objection(); 
endtask */

//endclass 
