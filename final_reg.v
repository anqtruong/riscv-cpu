module final_reg(rst, clk, instruction_in, regWrite_in, writeData_in, instruction_out, regWrite_out, writeData_out);
input rst, clk;
input [31:0] instruction_in, writeData_in;
input regWrite_in;
output reg [31:0] instruction_out, writeData_out;
output reg regWrite_out;

always @(posedge rst, posedge clk)
begin
	if(rst)
	begin
		instruction_out <= 32'b0;
		regWrite_out <= 0;
		writeData_out <= 32'b0;
	end
	else
	begin
		instruction_out <= instruction_in;
		regWrite_out <= regWrite_in;
		writeData_out <= writeData_in;	
	end
end

endmodule