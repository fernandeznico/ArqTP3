module Signal_Extension_Test;

reg [10:0] Input;
wire [15:0] Output;

Signal_Extension DUT ( .Input(Input) , .Output(Output) );

initial
  begin
  Input = 0;
  
  #10
  
  Input = 11'b10000000000;
  
  #10
  
  Input = 11'b01111111111;
  
  #10
  
  $finish;
  end

initial
  begin
  $display( "\t    time \t    Input    \t    Output " );
  $monitor( "\t %d \t %b \t %b " ,
                  $time ,     Input ,        Output   );
  end

endmodule
