module imm_gen(inst, imm);
input [31:0] inst;
output reg [31:0] imm;

always @(inst)
begin
	case(inst[6:0])
	7'b1100011: //BEQ. Sign extending the immediate field and shifting left 1 bit.
	begin
		imm <= (inst[31]==1)?{19'b1, inst[31], inst[7], inst[30:25], inst[11:8], 1'b0}:{19'b0, inst[31], inst[7], inst[30:25], inst[11:8], 1'b0};
	end
	7'b0000011: //LW
	begin
		imm <= (inst[31]==1)?{20'b1, inst[31:20]}:{20'b0, inst[31:20]};
	end
	7'b0100011: //SW
	begin
		imm <= (inst[31]==1)?{20'b1, inst[31:25], inst[11:7]}:{20'b0, inst[31:25], inst[11:7]};
	end
	default:
	begin
		imm <= 32'b0;
	end
	endcase
end

endmodule