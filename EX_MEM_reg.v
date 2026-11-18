module EX_MEM_reg(rst, clk, pc_in, instruction_in, ALU_result_in, operand2_in, memRead_in, memToReg_in, memWrite_in, regWrite_in,
pc_out, instruction_out, ALU_result_out, operand2_out, memRead_out, memToReg_out, memWrite_out, regWrite_out);

input rst, clk;
input [31:0] pc_in, instruction_in, ALU_result_in, operand2_in;
input memRead_in, memToReg_in, memWrite_in, regWrite_in;

output reg [31:0] pc_out, instruction_out, ALU_result_out, operand2_out;
output reg memRead_out, memToReg_out, memWrite_out, regWrite_out;

always @(posedge rst, posedge clk)
begin
	if(rst)
	begin
		pc_out <= 32'b0;
		instruction_out <= 32'b0;
		ALU_result_out <= 32'b0;
		operand2_out <= 32'b0;
		memRead_out <= 0;
		memToReg_out <= 0;
		memWrite_out <= 0;
		regWrite_out <= 0;
	end
	else
	begin
		pc_out <= pc_in;
		instruction_out <= instruction_in;
		ALU_result_out <= ALU_result_in;
		operand2_out <= operand2_in;
		memRead_out <= memRead_in;
		memToReg_out <= memToReg_in;
		memWrite_out <= memWrite_in;
		regWrite_out <= regWrite_in;	
	end
end

endmodule