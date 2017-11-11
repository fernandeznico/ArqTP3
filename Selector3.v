module Selector3
  #(
      parameter bits = 16
  )
  (
      input wire [1:0] Sel ,
      input wire [bits-1 : 0] Input0 ,
      input wire [bits-1 : 0] Input1 ,
      input wire [bits-1 : 0] Input2 ,
      output wire [bits-1 : 0] Output
  );

assign Output = (Sel == 2'b00)? Input0 : 
                (Sel == 2'b01)? Input1 : 
                (Sel == 2'b10)? Input2 : 
                /*default*/     0;

endmodule
