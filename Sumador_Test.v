module Sumador_Test
  #(
      parameter bits = 16
  );

reg [bits-1 : 0] A , B;
wire [bits-1 : 0] R;

Sumador #( .bits(bits) ) DUT ( .A(A) , .B(B) , .R(R) );

integer i;
initial
  begin
  A = 0;
  B = 0;
  
  #10
  
  for( i = 0 ; i < 51 ; i = i + 1 )
    begin
    A = $random;
    B = $random;
    #10;
    end
  
  $finish;
  end

initial
  begin
  $display( "\t time    \t A    \t    B \t    R" );
  $monitor( "\t %d \t %d \t %d " ,
               $time ,     A ,        B ,     R  );
  end

endmodule
