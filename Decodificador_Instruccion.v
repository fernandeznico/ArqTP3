module Decodificador_Instruccion
(
	input wire [4:0] Opcode,
	output reg WrPC, SelB, WrACC, Op, WrRAM, RdRAM,
	output reg [1:0] SelA
);

//declaracion de estado simbólico
localparam [4:0]
	hlt  = 5'b00000,	//HLT	 (Halt)
	sto  = 5'b00001,	//STO	 (Store Variable)
	ld   = 5'b00010,	//LD   (Load Variable)
	ldi  = 5'b00011,	//LDI  (Load Immediate)
	add  = 5'b00100,	//ADD	 (Add variable)
	addi = 5'b00101,	//ADDI (Add Immediate)
	sub  = 5'b00110,	//SUB  (Subtract Variable)
	subi = 5'b00111;	//SUBI (Subtract Immediate)

//cuerpo
//logica de decodificacion de intruccion
always @(*)
	begin
		case (Opcode)
			hlt:
				begin
					WrPC	= 0;
					SelA	= 2'b00;
					SelB	= 0;
					WrACC	= 0;
					Op		= 0;
					WrRAM	= 0;
					RdRAM	= 0;
				end
			sto:
				begin
					WrPC	= 1;
					SelA	= 2'b00;
					SelB	= 1;
					WrACC	= 0;
					Op		= 0;
					WrRAM	= 1;
					RdRAM	= 0;
				end
			ld:
				begin
					WrPC	= 1;
					SelA	= 2'b00;
					SelB	= 0;
					WrACC	= 1;
					Op		= 0;
					WrRAM	= 0;
					RdRAM	= 1;
				end
			ldi:
				begin
					WrPC	= 1;
					SelA	= 2'b01;
					SelB	= 0;
					WrACC	= 1;
					Op		= 0;
					WrRAM	= 0;
					RdRAM	= 0;
				end
			add:
				begin
					WrPC	= 1;
					SelA	= 2'b10;
					SelB	= 0;
					WrACC	= 1;
					Op		= 1;
					WrRAM	= 0;
					RdRAM	= 1;
				end
			addi:
				begin
					WrPC	= 1;
					SelA	= 2'b10;
					SelB	= 1;
					WrACC	= 1;
					Op		= 1;
					WrRAM	= 0;
					RdRAM	= 0;
				end
			sub:
				begin
					WrPC	= 1;
					SelA	= 2'b10;
					SelB	= 0;
					WrACC	= 1;
					Op		= 0;
					WrRAM	= 0;
					RdRAM	= 1;
				end
			subi:
				begin
					WrPC	= 1;
					SelA	= 2'b10;
					SelB	= 1;
					WrACC	= 1;
					Op		= 0;
					WrRAM	= 0;
					RdRAM	= 0;
				end	
			default:
				begin
					WrPC	= 0;
					SelA	= 2'b11;
					SelB	= 0;
					WrACC	= 0;
					Op		= 0;
					WrRAM	= 0;
					RdRAM	= 0;
				end
		endcase
	end	

endmodule
