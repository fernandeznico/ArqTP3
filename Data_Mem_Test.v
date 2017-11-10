module Data_Mem_Test
  #(
      parameter addr_bus  = 11 ,
                data_size = 16
  );

reg Reset , Rd , Wr;
reg [addr_bus-1 : 0] Addr;
reg [data_size-1 : 0] In_Data;
wire [data_size-1 : 0] Out_Data;

Data_Mem #( .addr_bus(addr_bus) ,
            .data_size(data_size) )
         DUT ( .Reset(Reset) , .Rd(Rd) , .Wr(Wr) ,
               .Addr(Addr) , .In_Data(In_Data) ,
               .Out_Data(Out_Data) );

initial
  begin
  Reset = 0;
  Rd = 0;
  Wr = 0;
  Addr = 0;
  In_Data = 0;
  
  #10
  
  Rd = 1;
  
  #10
  
  Rd = 0;
  Wr = 1;
  In_Data = 1;
  
  #10
  
  Rd = 1;
  Wr = 0;
  
  #10
  
  Rd = 0;
  Wr = 0;
  
  #10
  
  $finish;
  end

initial
  begin
  $display("\t time \t Reset \t Rd \t Wr \t Addr \t In_Data \t Out_Data");
  $monitor("\t %d \t %b \t %b \t %b \t %b \t %b \t %b" ,
            $time , Reset , Rd , Wr , Addr , In_Data , Out_Data );
  end

endmodule
