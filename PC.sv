module PC(output logic IRWrite, AluSourceA, AluSourceB, 
		  output [1:0] AluOP,
		  output [31:0] pc_output,
	      input logic clock, r_l,
		  input logic [31:0] pc_address);

logic x = 1'b1;

always_comb begin
	IRWrite = 1'b1;
	AluSourceA = 1'b0;
	AluSourceB = 1'b1;
	AluOP = 2'b0;
end


						
enum {StateA,StateB} state, nextState;

muxPC(.A(pc_adress),
	  .B(),
	  .IorD(x),
	  .Out(pc_output));
			 			
endmodule:PC