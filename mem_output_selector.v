module mem_output_selector(address, readEnable, dmem_data, imem_data, data_out);

input [31:0] address, dmem_data, imem_data;
input readEnable;

output reg [31:0] data_out;

always @(readEnable, address)
begin
	if(readEnable)
	begin
		if(address[31:15] == 17'd0) //select instruction memory (imem) to read
			data_out <= imem_data;
		else if(address[31:15] == 17'd1) //select data memory (dmem) to read
			data_out <= dmem_data;
		else //reading with any other address will be blocked 
			data_out <= 32'bz;
	end
	else
	begin
		data_out <= 32'bz;
	end
end

endmodule 
 