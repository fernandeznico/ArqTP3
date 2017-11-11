module Selector2
  #(
      parameter bits = 16
  )
  (
      input wire Sel ,
      input wire [bits-1 : 0] Input0 ,
      input wire [bits-1 : 0] Input1 ,
      output wire [bits-1 : 0] Output
  );

assign Output = (Sel == 1'b0)? Input0 : Input1;

endmodule
