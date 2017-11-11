module Alu_Test
  #(
      parameter bits = 16
  );

reg [bits-1 : 0] A , B , O;
wire [bits-1 : 0] R;

Alu #( .bits(bits) ) DUT ( .A(A) , .B(B) , .O(O) , .R(R) );

integer i;
integer s = 0;
initial
  begin
  A = 0;
  B = 0;
  O = 0;
  
  #10
  
  for( i = 0 ; i < 51 ; i = i + 1 )
    begin
    A = $random;
    B = $random;
	 O = s;
	 s = ( s )? 0 : 1;
    #10;
    end
  
  $finish;
  end

initial
  begin
  $display( "\t    time \t    A    \t    B \t    O \t    R" );
  $monitor( "\t %d \t %d \t %d \t %d \t %d" ,
                  $time ,     A ,        B ,     O ,     R  );
  end

endmodule
