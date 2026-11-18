module dram_address_checker(memWrite_in, address_in, memWrite_out, address_out);
input memWrite_in;
input [31:0] address_in;
output reg memWrite_out;
output reg [31:0] address_out;

always @(memWrite_in, address_in)
begin
	if(memWrite_in==1)
	begin
		if(address_in[31:15]==17'd1)
		begin
			memWrite_out <= 1;
			address_out <= address_in;
		end
		else
		begin
			memWrite_out <= 0;
			address_out <= address_out;
		end
	end
	else
	begin
		memWrite_out <= 0;
		address_out <= address_out;
	end
end

endmodule 