module Store_a_Word_Test
  #(
      parameter bits = 16
  );

reg Reset , Clk , Enable;
reg [bits-1 : 0] Input;
wire [bits-1 : 0] Word;

Store_a_Word
  #( .bits(bits) )
  DUT ( .Reset(Reset)   , .Clk(Clk) ,
        .Enable(Enable) , .Input(Input) ,
        .Word(Word) );

initial
  begin
  Reset = 0;
  Clk = 0;
  Enable = 0;
  Input = 0;
  
  @( posedge Clk );
  Input = 1;
  
  @( posedge Clk );
  Enable = 1;
  
  @( posedge Clk );
  Input = 2;
  
  @( posedge Clk );
  Enable = 0;
  Input = 3;
  
  @( posedge Clk );
  Enable = 1;
  Input = 4;
  
  @( posedge Clk );
  Input = 5;
  
  @( posedge Clk );
  Input = 6;
  
  @( posedge Clk );
  Input = 7;
  
  #10
  $finish;
  end

always
  #10 Clk = ~Clk;

initial
  begin
  $display( "\t    time \t    Reset    \t    Clk \t    Enable \t    Input \t    Word" );
  $monitor( "\t %d \t %d \t %d \t %d \t %d \t %d" ,
                  $time ,     Reset ,        Clk ,     Enable ,     Input ,     Word  );
  end

endmodule
