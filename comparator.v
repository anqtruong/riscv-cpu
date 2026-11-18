module comparator(in1, in2, zero);
input[31:0] in1, in2;
output zero;

assign zero = (in1==in2)?1:0;

endmodule
