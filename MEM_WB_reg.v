module MEM_WB_reg(rst, clk, pc_in, instruction_in, memToReg_in, regWrite_in, ALU_result_in, memRead_in,
pc_out, instruction_out, memToReg_out, regWrite_out, ALU_result_out, memRead_out);

input rst, clk;
input [31:0] pc_in, instruction_in, ALU_result_in;
input memToReg_in, regWrite_in, memRead_in;

output reg [31:0] pc_out, instruction_out, ALU_result_out;
output reg memToReg_out, regWrite_out, memRead_out;

always @(posedge rst, posedge clk)
begin
	if(rst)
	begin
		pc_out <= 32'b0;
		instruction_out <= 32'b0;
		ALU_result_out <= 32'b0;
		memToReg_out <= 0;
		regWrite_out <= 0;
		memRead_out <= 0;
	end
	else
	begin
		pc_out <= pc_in;
		instruction_out <= instruction_in;
		ALU_result_out <= ALU_result_in;
		memToReg_out <= memToReg_in;
		regWrite_out <= regWrite_in;
		memRead_out <= memRead_in;
	end
end

endmodule 