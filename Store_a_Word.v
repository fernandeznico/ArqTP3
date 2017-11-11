module Store_a_Word
  #(
      parameter bits = 16
   )
   (
      input wire Reset , Clk , Enable ,
      input wire [bits-1 : 0] Input ,
      output reg [bits-1 : 0] Word
   );

initial
  begin
  Word = 0;
  end

always @( posedge Clk )
  begin
    if( Reset == 1 )
      begin
      Word <= 0;
      end
    else if( Enable == 1 )
      begin
      Word <= Input;
      end
  end

endmodule
