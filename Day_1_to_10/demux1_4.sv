module demux1_4(in, sel, out1,out3,out2,out0);
    input in;
    input [1:0] sel;
    output logic out0,out2,out3,out1;

    assign out0 = in & (~sel[1]) & (~sel[0]);
    assign out1 = in & (~sel[1]) & ( sel[0]);
    assign out2 = in & ( sel[1]) & (~sel[0]);
    assign out3 = in & ( sel[1]) & ( sel[0]);
endmodule
