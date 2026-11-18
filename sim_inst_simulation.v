module sim_inst_translation(in, out);
input [31:0] in;
output reg [39:0] out;

always @(in)
begin
	case(in[6:0])
	7'b0110111:
	begin
		out <= {8'd76, 8'd85, 8'd73, 8'd32, 8'd32}; //LUI
	end
	7'b0010111:
	begin
		out <= {8'd65, 8'd85, 8'd73, 8'd80, 8'd67}; //AUIPC
	end
	7'b1101111:
	begin
		out <= {8'd74, 8'd65, 8'd76, 8'd32, 8'd32}; //JAL
	end
	7'b1100111:
	begin
		out <= {8'd74, 8'd65, 8'd76, 8'd82, 8'd32}; //JALR
	end
	7'b1100011: //Branches
	begin
		case(in[14:12])
		3'b000:
		begin
			out <= {8'd66, 8'd69, 8'd81, 8'd32, 8'd32}; //BEQ
		end
		3'b001:
		begin
			out <= {8'd66, 8'd78, 8'd69, 8'd32, 8'd32}; //BNE
		end
		3'b100:
		begin
			out <= {8'd66, 8'd76, 8'd84, 8'd32, 8'd32}; //BLT
		end
		3'b101:
		begin
			out <= {8'd66, 8'd71, 8'd69, 8'd32, 8'd32}; //BGE
		end
		3'b110:
		begin
			out <= {8'd66, 8'd76, 8'd84, 8'd85, 8'd32}; //BLTU
		end
		3'b111:
		begin
			out <= {8'd66, 8'd71, 8'd69, 8'd85, 8'd32}; //BGEU
		end
		default:
		begin
			out <= {8'd32, 8'd32, 8'd32, 8'd32, 8'd32}; //unrecoginized instruction shown as empty string
		end		
		endcase
	end
	7'b0000011: //Loads
	begin
		case(in[14:12])
		3'b000:
		begin
			out <= {8'd76, 8'd66, 8'd32, 8'd32, 8'd32}; //LB
		end
		3'b001:
		begin
			out <= {8'd76, 8'd72, 8'd32, 8'd32, 8'd32}; //LH
		end
		3'b010:
		begin
			out <= {8'd76, 8'd87, 8'd32, 8'd32, 8'd32}; //LW
		end
		3'b100:
		begin
			out <= {8'd76, 8'd66, 8'd85, 8'd32, 8'd32}; //LBU
		end
		3'b101:
		begin
			out <= {8'd76, 8'd72, 8'd85, 8'd32, 8'd32}; //LHU
		end
		default:
		begin
			out <= {8'd32, 8'd32, 8'd32, 8'd32, 8'd32}; //unrecoginized instruction shown as empty string
		end
		endcase
	end
	7'b0100011: //Stores
	begin
		case(in[14:12])
		3'b000:
		begin
			out <= {8'd83, 8'd66, 8'd32, 8'd32, 8'd32}; //SB
		end
		3'b001:
		begin
			out <= {8'd83, 8'd72, 8'd32, 8'd32, 8'd32}; //SH
		end
		3'b010:
		begin
			out <= {8'd83, 8'd87, 8'd32, 8'd32, 8'd32}; //SW
		end
		default:
		begin
			out <= {8'd32, 8'd32, 8'd32, 8'd32, 8'd32}; //unrecoginized instruction shown as empty string
		end
		endcase
	end
	7'b0010011: //I-type
	begin
		case(in[14:12])
		3'b000:
		begin
			out <= {8'd65, 8'd68, 8'd68, 8'd73, 8'd32}; //ADDI
		end
		3'b001:
		begin
			out <= {8'd83, 8'd76, 8'd76, 8'd73, 8'd32}; //SLLI
		end
		3'b010:
		begin
			out <= {8'd83, 8'd76, 8'd84, 8'd73, 8'd32}; //SLTI
		end
		3'b011:
		begin
			out <= {8'd83, 8'd76, 8'd84, 8'd73, 8'd85}; //SLTIU
		end
		3'b100:
		begin
			out <= {8'd88, 8'd79, 8'd82, 8'd73, 8'd32}; //XORI
		end
		3'b101:
		begin
			if(in[30]==0) out <= {8'd83, 8'd82, 8'd76, 8'd73, 8'd32}; //SRLI
			else out <= {8'd83, 8'd82, 8'd65, 8'd73, 8'd32}; //SRAI
		end
		3'b110:
		begin
			out <= {8'd79, 8'd82, 8'd73, 8'd32, 8'd32}; //ORI
		end
		3'b111:
		begin
			out <= {8'd65, 8'd78, 8'd68, 8'd73, 8'd32}; //ANDI
		end
		endcase
	end
	7'b0110011:
	begin
		case(in[14:12])
		3'b000:
		begin
			if(in[30]==0) out <= {8'd65, 8'd68, 8'd68, 8'd32, 8'd32}; //ADD
			else out <= {8'd83, 8'd85, 8'd66, 8'd32, 8'd32}; //SUB
		end
		3'b001:
		begin
			out <= {8'd83, 8'd76, 8'd76, 8'd32, 8'd32}; //SLL
		end
		3'b010:
		begin
			out <= {8'd83, 8'd76, 8'd84, 8'd32, 8'd32}; //SLT
		end
		3'b011:
		begin
			out <= {8'd83, 8'd76, 8'd84, 8'd85, 8'd32}; //SLTU
		end
		3'b100:
		begin
			out <= {8'd88, 8'd79, 8'd82, 8'd32, 8'd32}; //XOR
		end
		3'b101:
		begin
			if(in[30]==0) out <= {8'd83, 8'd82, 8'd76, 8'd32, 8'd32}; //SRL
			else out <= {8'd83, 8'd82, 8'd65, 8'd32, 8'd32}; //SRA
		end
		3'b110:
		begin
			out <= {8'd79, 8'd82, 8'd32, 8'd32, 8'd32}; //OR
		end
		3'b111:
		begin
			out <= {8'd65, 8'd78, 8'd68, 8'd32, 8'd32}; //AND
		end		
		endcase
	end
	default:
	begin
		out <= {8'd32, 8'd32, 8'd32, 8'd32, 8'd32}; //unrecoginized instruction shown as empty string
	end
	endcase
end

endmodule

