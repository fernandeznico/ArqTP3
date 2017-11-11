module Alu
  #(
      parameter bits = 16
  )
  (
      input wire [bits-1 : 0] A , B , O ,
      output wire [bits-1 : 0] R
  );

assign R = (O)? A - B : A + B;

endmodule
