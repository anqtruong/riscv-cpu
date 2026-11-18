module dmem(data, wren, address, clock, q);
parameter awidth = 13;
parameter dwidth = 32;
input clock, wren;
input [dwidth-1:0] data;
input [awidth-1:0] address;
output reg [dwidth-1:0] q;

reg [dwidth-1:0] mem [2**awidth-1:0];

always @(posedge clock)
begin

		if(wren)
		begin
			mem[address] <= data;
			q <= data;
		end
		else
		begin
			q <= mem[address];
		end

end

endmodule