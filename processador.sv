module processador(input logic clock);
logic [31:0] pc_address;
logic [31:0] result;

logic RegDst;
logic RegWrite;
logic AluSourceA;
logic IRWrite;
logic MemRead;
logic MemWrite;
logic MemToReg;
logic PCWrite;
logic PCWriteCond;
logic IorD;

logic [1:0] AluOP;
logic [1:0] AluSourceB;
logic [1:0] PCSource;

enum logic[5:0]
{ADD = 6'b000000,
 SUB = 6'b000010,
 AND = 6'b000011,
 XOR = 6'b000100,
 NOP = 6'b000101,
 BREAK = 6'b000111
 } operate;
 
 PC pece(.clock(),
		 .r_l(),
		 .pc_address(pc_address));
			
endmodule:processador