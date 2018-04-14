module processador(input logic clock, 
							   reset, 
				   output logic [31:0] MemData, 
									   Address,
									   WriteDataMem, 
									   WriteRegister, 
									   WriteDataReg, 
									   MDR, 
									   Alu, 
									   AluOut, 
									   PC, 
									   RegDesloc, 
									   wr, 
									   RegWrite, 
									   IRWrite, 
									   EPC,
									   mulModule,
									   Estado,
					output logic [5:0] Opcode, 
					output logic [4:0] registrador1, 
									   registrador2,
					output logic [15:0] exit);
																			 
logic [31:0] PC_Adress_MuxPCToMem;
logic [31:0] PC_Adress_MuxRegAToALU;
logic [31:0] PC_Adress_Empty;

logic Overflow1;
logic Negativo1;
logic z1;
logic Igual1;
logic Maior1;
logic Menor1;

logic [4:0] Pt1;
logic [3:0] Pt2;
logic [3:0] Pt3;
logic [14:0] Pt4;

logic [2:0] AluOP;
logic [3:0] AluSourceB;
logic [3:0] PCSource;

 Registrador PCRegister(.Clk(clock),
						.Entrada(AluOut),
						.Saida(PC),
						.Reset(reset),
						.Load(1'b1));
						
muxPC(.Out(PC_Adress_MuxPCToMem),
	  .A(PC), 
	  .B(PC_Adress_Empty), 
	  .IorD(1'b0));
						
Memoria Mem(.Address(PC_Adress_MuxPCToMem),
			.Clock(clock),
			.Wr(0),
			.Datain(),
			.Dataout(MemData));
			
Instr_Reg RegInstructions(.Clk(clock),
				             .Reset(reset),
				             .Load_ir(1'b1),
				             .Entrada(MemData),
				             .Instr31_26(Opcode),
				             .Instr25_21(registrador1),
				             .Instr20_16(registrador2),
				             .Instr15_0(exit));
		
muxRegA(.Out(PC_Adress_MuxRegAToALU),
	  .A(PC), 
	  .B(PC_Adress_Empty), 
	  .IorD(1'b0));
	  
Ula32 Ula(.A(PC_Adress_MuxRegAToALU),
			.B(3'b100),
			.Seletor(3'b001),
			.S(AluOut),
			.Overflow(Overflow1),
			.Negativo(Negativo1),
			.z(z1),
			.Igual(Igual1),
			.Maior(Maior1),
			.Menor(Menor1));

endmodule:processador