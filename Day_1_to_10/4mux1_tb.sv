`include "day1_4mux1.sv"


module mux4_1_tb;
    logic I0,I1,I2,I3;
    logic [1:0] sel;
    logic out;

    mux4_1 dut(.I0(I0),.I1(I1),.I2(I2),.I3(I3),.sel(sel),.out(out));

    initial begin
        #5 {I0,I1,I2,I3}=4'b0000;
            sel = 2'b00;
        
        #5 {I0,I1,I2,I3}=4'b0100;
            sel = 2'b01;
    
        #5 {I0,I1,I2,I3}=4'b0010;
            sel = 2'b10;
    
        #5 {I0,I1,I2,I3}=4'b0001;
            sel = 2'b11;
    
    end

    initial begin
        $dumpvars();
        $dumpfile("mux4_1.vcd");
    end


endmodule : mux4_1_tb
