`include "demux1_4.sv"
module demux1_4_tb();
    logic in, out1,out2,out3,out0;
    logic [1:0] sel;

    demux1_4 dut(.in(in),.sel(sel),.out1(out1),.out2(out2),.out3(out3),.out0(out0));
    
    initial begin
        #5 in=1'b1;
        #5 sel=2'b00;
        #5 sel=2'b01;
        #5 sel=2'b10;
        #5 sel=2'b11;
    end

    initial begin
        $dumpvars();
        $dumpfile("demux.vcd");
    end

    initial begin
        $monitor ($time," when sel is %b and i is %b output is %b%b%b%b",sel,in,out3,out2,out1,out0);
    end
endmodule : demux1_4_tb
