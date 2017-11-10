module Prog_Mem_Test#(
      parameter addr_bus  = 11 ,
                data_size = 16
  );

reg Reset;
reg [addr_bus-1 : 0] Addr;
wire [data_size-1 : 0] Data;

Prog_Mem #( .addr_bus(addr_bus) ,
            .data_size(data_size) )
         DUT ( .Reset(Reset) , .Addr(Addr) ,
               .Data(Data) );

integer addr;
initial
  begin
  Reset = 0;
  Addr = 0;
  #20
  
  for( addr = 0 ; addr < /*2**addr_bus*/ 21 ; addr = addr + 1 )
    begin
    Addr = addr;
    #20;
    end
  
  $finish;
  end

initial
  begin
  $display("\t time \t Reset \t Addr int \t Addr \t Data");
  $monitor("\t %d \t %b \t %d \t %b \t %b" ,
            $time , Reset , Addr , Addr , Data );
  end

endmodule
