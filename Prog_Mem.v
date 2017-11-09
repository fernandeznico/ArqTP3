module Prog_Mem
  #(
      parameter addr_bus = 11 ,
                data_size = 16
  )
  (
     input wire Reset ,
     input wire [addr_bus-1 : 0] Addr ,
     output wire [data_size-1 : 0] Data
  );

localparam [4:0]
  HLT  = 5'b00000 ,
  STO  = 5'b00001 ,
  LD_  = 5'b00010 ,
  LDI  = 5'b00011 ,
  ADD  = 5'b00100 ,
  ADDI = 5'b00101 ,
  SUB  = 5'b00110 ,
  SUBI = 5'b00111;

reg [data_size-1 : 0] mem_reg[2**addr_bus-1 : 0];
initial mem_reg[0] = (( LDI  << (data_size - 5) ) + 16 );
initial mem_reg[1] = (( STO  << (data_size - 5) ) + 1  );
initial mem_reg[2] = (( LD_  << (data_size - 5) ) + 1  );
initial mem_reg[3] = (( ADDI << (data_size - 5) ) + 255);
initial mem_reg[4] = (( STO  << (data_size - 5) ) + 2  );
initial mem_reg[5] = (( LD_  << (data_size - 5) ) + 16 );
initial mem_reg[6] = (( HLT  << (data_size - 5) ) + 0  );
integer pos;
initial
begin
  for( pos = 7 ; pos < 2**addr_bus-1 ; pos++ )
  begin
    mem_reg[pos] = 0;
  end
end

assign Data = mem_reg[Addr];

endmodule
