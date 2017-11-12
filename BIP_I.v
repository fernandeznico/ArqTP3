module BIP_I
  (
     input wire Reset , Clk
  );

// Conections (Nodes)
wire ID_WrPC , ID_SelB , ID_WrACC , ID_Op , ID_WrRAM , ID_RdRAM;
wire [1:0] ID_SelA;
wire [10:0] PC , Const_One , Sum;
wire [15:0] PM_Data , DM_Data , Sig_Ext , SelA , SelB , ACC , Alu_R;

Sumador #( .bits(16) )
  PC_increment ( .A(Const_One) , .B(PC) , .R(Sum) );

Store_a_Word #( .bits(16) )
  Program_counter ( .Reset(Reset)    , .Clk(Clk) ,
                    .Enable(ID_WrPC) , .Input(Sum) ,
                    .Word(PC) );

Prog_Mem #( .addr_bus(11) , .data_size(16) )
  Program_memory ( .Reset(Reset) , .Addr(PC) ,
                   .Data(PM_Data) );

Decodificador_Instruccion
  Instruction_decoder ( .Opcode(PM_Data[15:11]) ,
                        .WrPC(ID_WrPC) , .SelB(ID_SelB) ,
                        .WrACC(ID_WrACC) , .Op(ID_Op) ,
                        .WrRAM(ID_Wr_RAM), .RdRAM(ID_RdRAM) ,
                        .SelA(ID_SelA) );

Data_Mem #( .addr_bus(11) ,
            .data_size(16) )
  Data_memory ( .Reset(Reset) , .Rd(ID_RdRAM) , .Wr(ID_WrRAM) ,
                .Addr(PM_Data[10:0]) , .In_Data(ACC) ,
                .Out_Data(DM_Data) );

Signal_Extension 
  Signal_extension ( .Input(PM_Data[10:0]) , .Output(Sig_Ext) );

Selector3 #( .bits(16) )
  Sel_A( .Input0(DM_Data) , .Input1(Sig_Ext) , .Input2(Alu_R) ,
         .Sel(ID_SelA) , .Output(SelA) );

Selector2 #( .bits(16) )
  Sel_B ( .Input0(DM_Data) , .Input1(Sig_Ext) ,
          .Sel(ID_SelB) , .Output(SelB) );

Store_a_Word #( .bits(16) )
  Accumulator ( .Reset(Reset) , .Clk(Clk) , .Enable(ID_WrACC) ,
                .Input(Sig_Ext) , .Word(ACC) );

Alu #( .bits(16) )
  ALU ( .A(ACC) , .B(SelB) , .O(ID_Op) , .R(Alu_R) );

assign Const_One = 11'b00000000001;

endmodule
