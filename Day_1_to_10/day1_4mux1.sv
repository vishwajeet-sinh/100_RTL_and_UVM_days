module mux4_1(I0,I1,I2,I3,sel, out);
    input logic I0,I1,I2,I3;
    input logic [1:0] sel;
    output logic out;
    
    assign out = ((sel==2'b00)? I0 : ((sel==2'b01)?I1:((sel==2'b10)?I2:I3)));

endmodule :mux4_1
