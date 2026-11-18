module control(opcode, branch, memRead, memToReg, ALUop, memWrite, ALUsrc, regWrite);
input [6:0] opcode;
output reg branch, memRead, memToReg, memWrite, ALUsrc, regWrite;
output reg [1:0] ALUop;

always @(opcode)
begin
	case(opcode)
	7'b1100011: //BEQ
	begin
		branch <= 1;
		memRead <= 0;
		memToReg <= 0;
		memWrite <= 0;
		ALUsrc <= 0;
		regWrite <= 0;
		ALUop <= 2'b01; //set ALU in subtraction mode - for comparing rs1 and rs2
	end
	7'b0000011: //LW
	begin
		branch <= 0;
		memRead <= 1;
		memToReg <= 1;
		memWrite <= 0;
		ALUsrc <= 1; //set immediate value as the 2nd operand of ALU: offset for effective address
		regWrite <= 1;
		ALUop <= 2'b00; //set ALU in addition mode - for effective address calculation
	end	
	7'b0100011: //SW
	begin
		branch <= 0;
		memRead <= 0;
		memToReg <= 0;
		memWrite <= 1;
		ALUsrc <= 1; //set immediate value as the 2nd operand of ALU: offset for effective address
		regWrite <= 0;
		ALUop <= 2'b00; //set ALU in addition mode - for effective address calculation
	end
	7'b0110011: //R-type
	begin
		branch <= 0;
		memRead <= 0;
		memToReg <= 0;
		memWrite <= 0;
		ALUsrc <= 0; //set immediate value as the 2nd operand of ALU: offset for effective address
		regWrite <= 1;
		ALUop <= 2'b10; //R-type instructions share the same 2-bit ALUop
	end
	default: //unsupported instructions
	begin
		branch <= 0;
		memRead <= 0;
		memToReg <= 0;
		memWrite <= 0;
		ALUsrc <= 0;
		regWrite <= 0;
		ALUop <= 2'b11; //currently 2'b11 for ALUop is unused
	end
	endcase
end

endmodule
