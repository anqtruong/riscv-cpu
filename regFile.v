module regFile(rst, clk, readReg1, readReg2, writeReg1, we1, writeData1, readData1, readData2);
input rst;
input clk;
input [4:0] readReg1;
input [4:0] readReg2;
input [4:0] writeReg1;
input we1; //write enable for WB stage
input [31:0] writeData1;
output [31:0] readData1, readData2;

//general-purppose registers, reset by rst
reg [31:0] genRegs [31:0]; 

localparam X0 = 0;
localparam X1 = 1;
localparam X2 = 2;
localparam X3 = 3;
localparam X4 = 4;
localparam X5 = 5;
localparam X6 = 6;
localparam X7 = 7;
localparam X8 = 8;
localparam X9 = 9;
localparam X10 = 10;
localparam X11 = 11;
localparam X12 = 12;
localparam X13 = 13;
localparam X14 = 14;
localparam X15 = 15;
localparam X16 = 16;
localparam X17 = 17;
localparam X18 = 18;
localparam X19 = 19;
localparam X20 = 20;
localparam X21 = 21;
localparam X22 = 22;
localparam X23 = 23;
localparam X24 = 24;
localparam X25 = 25;
localparam X26 = 26;
localparam X27 = 27;
localparam X28 = 28;
localparam X29 = 29;
localparam X30 = 30;
localparam X31 = 31;

//The two read ports are not controlled by the clock
//Buffer them in the ID/EX pipeline register
assign readData1 = genRegs[readReg1];
assign readData2 = genRegs[readReg2];

always @(posedge rst, posedge clk)
begin
	if(rst==1)
	begin
		genRegs[X0]<=0; //always be zero
		genRegs[X1]<=0; //ra
		genRegs[X2]<=32'd49152; //sp
		genRegs[X3]<=32'd40960; //gp
		genRegs[X4]<=0; //tp
		genRegs[X5]<=0; //t0
		genRegs[X6]<=0; //t1
		genRegs[X7]<=0; //t2
		genRegs[X8]<=0; //s0
		genRegs[X9]<=0; //s1
		genRegs[X10]<=0; //a0
		genRegs[X11]<=0; //a1
		genRegs[X12]<=0; //a2
		genRegs[X13]<=0; //a3
		genRegs[X14]<=0; //a4
		genRegs[X15]<=0; //a5
		genRegs[X16]<=0; //a6
		genRegs[X17]<=0; //a7
		genRegs[X18]<=0; //s2
		genRegs[X19]<=0; //s3
		genRegs[X20]<=0; //s4
		genRegs[X21]<=0; //s5
		genRegs[X22]<=0; //s6
		genRegs[X23]<=0; //s7
		genRegs[X24]<=0; //s8
		genRegs[X25]<=0; //s9
		genRegs[X26]<=0; //s10
		genRegs[X27]<=0; //s11
		genRegs[X28]<=0; //t3
		genRegs[X29]<=0; //t4
		genRegs[X30]<=0; //t5
		genRegs[X31]<=0; //t6
	end
	else
	begin
		if(we1==1) //WB stage write
		begin
			if(writeReg1!=5'b00000) //no effect if writing to X0
			genRegs[writeReg1] <= writeData1;
		end
	end
end
endmodule