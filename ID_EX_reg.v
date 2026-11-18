module ID_EX_reg(rst, clk, pc_in, instruction_in, memRead_in, memToReg_in, ALUop_in, memWrite_in, ALUsrc_in, regWrite_in, 
readData1_in, readData2_in, imm_in, pc_out, instruction_out, memRead_out, memToReg_out, ALUop_out, memWrite_out, ALUsrc_out, 
regWrite_out, readData1_out, readData2_out, imm_out);
input rst, clk;
input [31:0] pc_in, instruction_in, readData1_in, readData2_in, imm_in;
input memRead_in, memToReg_in, memWrite_in, ALUsrc_in, regWrite_in;
input [1:0] ALUop_in;
output reg [31:0] pc_out, instruction_out, readData1_out, readData2_out, imm_out;
output reg memRead_out, memToReg_out, memWrite_out, ALUsrc_out, regWrite_out;
output reg [1:0] ALUop_out;

always @(posedge rst, posedge clk)
begin
	if(rst)
	begin
		pc_out<=32'b0;
		instruction_out<=32'b0;
		memRead_out<=0;
		memToReg_out<=0;
		memWrite_out<=0;
		ALUsrc_out<=0;
		regWrite_out<=0;
		ALUop_out<=2'b11;
		readData1_out<=32'b0;
		readData2_out<=32'b0;
		imm_out<=32'b0;
	end
	else
	begin
		pc_out<=pc_in;
		instruction_out<=instruction_in;
		memRead_out<=memRead_in;
		memToReg_out<=memToReg_in;
		memWrite_out<=memWrite_in;
		ALUsrc_out<=ALUsrc_in;
		regWrite_out<=regWrite_in;
		ALUop_out<=ALUop_in;
		readData1_out<=readData1_in;
		readData2_out<=readData2_in;
		imm_out<=imm_in;		
	end
end

endmodule