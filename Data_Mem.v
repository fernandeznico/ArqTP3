module Data_Mem
  #(
      parameter addr_bus  = 11 ,
                data_size = 16
  )
  (
      input wire Reset , Rd , Wr ,
      input wire [addr_bus-1 : 0] Addr ,
      input wire [data_size-1 : 0] In_Data ,
      output wire [data_size-1 : 0] Out_Data
  );

reg [data_size-1 : 0] mem_reg[2**addr_bus-1 : 0];

integer pos;
initial
begin
  for( pos = 0 ; pos < ( (2**addr_bus) - 1 ) ; pos = pos + 1 )
  begin
    mem_reg[pos] = 0;
  end
end

always @(*)
begin
  if( Reset )
    begin
    for( pos = 0 ; pos < ( (2**addr_bus) - 1 ) ; pos = pos + 1 )
      begin
      mem_reg[pos] = 0;
      end
    end
  if( Wr )
    begin
    mem_reg[Addr] = In_Data;
    end
end

assign Out_Data = (Rd)? mem_reg[Addr] : 0;

endmodule
