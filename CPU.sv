module CPU (Clock, Reset, Estado, SaidaPC, SaidaA, SaidaB, SaidaALU, Reg1, Reg2, entrada, funct, EntradaMem, SaidaMem);
input Clock;
input Reset;

output wire [5:0] Estado;
output wire [31:0] SaidaPC;
output wire [31:0] SaidaA;  
output wire [31:0] SaidaB;
output wire [31:0] SaidaALU;
output wire [31:0] Reg1;
output wire [31:0] Reg2;
output wire [31:0] entrada;
output wire [5:0] funct;
output wire [31:0] EntradaMem;
output wire [31:0] SaidaMem;

wire PCWrite;
wire IorD;
wire MemRead;
wire [1:0] AluSrcA;
wire [2:0] AluSrcB;

endmodule
