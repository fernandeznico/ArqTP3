module Selector_Test
  #(
      parameter bits   = 16 ,
                inputs = 2
  );

reg [bits-1 : 0] Input[inputs - 1 : 0];
reg [(2**inputs) - 1 : 0] Sel;
wire [bits-1 : 0] Output;

/*
inputs = 3
Selector3 #(
             .bits(bits)
          )
          DUT (
                .Input0(Input[0]) ,
                .Input1(Input[1]) ,
                .Input2(Input[2]) ,
                .Sel(Sel) ,
                .Output(Output)
              );
*/

Selector2 #(
             .bits(bits)
          )
          DUT (
                .Input0(Input[0]) ,
                .Input1(Input[1]) ,
                .Sel(Sel) ,
                .Output(Output)
              );

integer i;
initial
  begin
  for( i = 0 ; i < inputs ; i = i + 1 )
    begin
    Input[i] = i + 1;
    end
  Sel = 0;
  
  #10
  
  for( i = 0 ; i < inputs ; i = i + 1 )
    begin
    Sel = i;
    #10;
    end
  
  $finish;
  end

initial
  begin
  $display( "\t time \t Sel \t Output" );
  $monitor( "\t %d \t %d \t %d" ,
             $time , Sel , Output );
  end

endmodule
