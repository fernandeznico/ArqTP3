module Signal_Extension
  (
     input wire [10:0] Input ,
     output wire [15:0] Output
  );

assign Output[10:0] = Input;
assign Output[11] = Input[10];
assign Output[12] = Input[10];
assign Output[13] = Input[10];
assign Output[14] = Input[10];
assign Output[15] = Input[10];

endmodule
