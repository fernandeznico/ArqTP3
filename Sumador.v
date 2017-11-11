module Sumador
  #(
      parameter bits = 16
  )
  (
      input wire [bits-1 : 0] A , B ,
      output wire [bits-1 : 0] R
  );

assign R = A + B;

endmodule
