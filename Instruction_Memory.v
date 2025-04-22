`timescale 1ns / 1ps

module instruction_memory(
input [63:0] Instr_Addr,
output reg [31:0] Instruction
);

reg [7:0] Inst_memory [200:0];
initial begin   //bubble sort
{Inst_memory[3], Inst_memory[2], Inst_memory[1], Inst_memory[0]} = 32'h00700213; // addi x4 x0 7
{Inst_memory[7], Inst_memory[6], Inst_memory[5], Inst_memory[4]} = 32'h00000393; // addi x7 x0 0
{Inst_memory[11], Inst_memory[10], Inst_memory[9], Inst_memory[8]} = 32'h00000313; // addi x6 x0 0
{Inst_memory[15], Inst_memory[14], Inst_memory[13], Inst_memory[12]} = 32'h00600593	; // addi x11 x0 6

{Inst_memory[19], Inst_memory[18], Inst_memory[17], Inst_memory[16]} = 32'h00300a13; // addi x20 x0 3
{Inst_memory[23], Inst_memory[22], Inst_memory[21], Inst_memory[20]} = 32'h00200a93;	//addi x21 x0 2

{Inst_memory[27], Inst_memory[26], Inst_memory[25], Inst_memory[24]} = 32'h00100b13;	//addi x22 x0 1
{Inst_memory[31], Inst_memory[30], Inst_memory[29], Inst_memory[28]} = 32'h00900b93;	//addi x23 x0 9
{Inst_memory[35], Inst_memory[34], Inst_memory[33], Inst_memory[32]} = 32'h00400c13;	//addi x24 x0 4
{Inst_memory[39], Inst_memory[38], Inst_memory[37], Inst_memory[36]} = 32'h00700c93;	//addi x25 x0 7
{Inst_memory[43], Inst_memory[42], Inst_memory[41], Inst_memory[40]} = 32'h00600d13;	//addi x26 x0 6
{Inst_memory[47], Inst_memory[46], Inst_memory[45], Inst_memory[44]} = 32'h10000293;	//addi x5 x0 256
{Inst_memory[51], Inst_memory[50], Inst_memory[49], Inst_memory[48]} = 32'h0142a023;	//sw x20 0(x5)
{Inst_memory[55], Inst_memory[54], Inst_memory[53], Inst_memory[52]} = 32'h0152a223;	//sw x21 4(x5)
{Inst_memory[59], Inst_memory[58], Inst_memory[57], Inst_memory[56]} = 32'h0162a423;	//sw x22 8(x5)
{Inst_memory[63], Inst_memory[62], Inst_memory[61], Inst_memory[60]} = 32'h0172a623;	//sw x23 12(x5)
{Inst_memory[67], Inst_memory[66], Inst_memory[65], Inst_memory[64]} = 32'h0182a823;	//sw x24 16(x5)
{Inst_memory[71], Inst_memory[70], Inst_memory[69], Inst_memory[68]} = 32'h0192aa23;	//sw x25 20(x5)
{Inst_memory[75], Inst_memory[74], Inst_memory[73], Inst_memory[72]} = 32'h01a2ac23;	//sw x26 24(x5)

{Inst_memory[79], Inst_memory[78], Inst_memory[77], Inst_memory[76]} = 32'h00000393;	//addi x7 x0 0
{Inst_memory[83], Inst_memory[82], Inst_memory[81], Inst_memory[80]} = 32'h04b35463;	//bge x6 x11 72


{Inst_memory[87], Inst_memory[86], Inst_memory[85], Inst_memory[84]} = 32'h00000263;	//beq x0 x0 4
{Inst_memory[91], Inst_memory[90], Inst_memory[89], Inst_memory[88]} = 32'h40658633;	//sub x12 x11 x6
{Inst_memory[95], Inst_memory[94], Inst_memory[93], Inst_memory[92]} = 32'h02c3da63;	//bge x7 x12 52
{Inst_memory[99], Inst_memory[98], Inst_memory[97], Inst_memory[96]} = 32'h00000263;	//beq x0 x0 4
{Inst_memory[103], Inst_memory[102], Inst_memory[101], Inst_memory[100]} = 32'h00239693;	//slli x13 x7 2
{Inst_memory[107], Inst_memory[106], Inst_memory[105], Inst_memory[104]} = 32'h005686b3;	//add x13 x13 x5
{Inst_memory[111], Inst_memory[110], Inst_memory[109], Inst_memory[108]} = 32'h0006a483;	//lw x9 0(x13)
{Inst_memory[115], Inst_memory[114], Inst_memory[113], Inst_memory[112]} = 32'h00468713;	//addi x14 x13 4
{Inst_memory[119], Inst_memory[118], Inst_memory[117], Inst_memory[116]} = 32'h00072403;	//lw x8 0(x14)
{Inst_memory[123], Inst_memory[122], Inst_memory[121], Inst_memory[120]} = 32'h0084c863;	//blt x9 x8 16
{Inst_memory[127], Inst_memory[126], Inst_memory[125], Inst_memory[124]} = 32'h00972023;	//sw x9 0(x14)
{Inst_memory[131], Inst_memory[130], Inst_memory[129], Inst_memory[128]} = 32'h0086a023;	//sw x8 0(x13)
{Inst_memory[135], Inst_memory[134], Inst_memory[133], Inst_memory[132]} = 32'h00000263;	//beq x0 x0 4
{Inst_memory[139], Inst_memory[138], Inst_memory[137], Inst_memory[136]} = 32'h00138393;	//addi x7 x7 1
{Inst_memory[143], Inst_memory[142], Inst_memory[141], Inst_memory[140]} = 32'hfc0006e3;	//beq x0 x0 -52
{Inst_memory[147], Inst_memory[146], Inst_memory[145], Inst_memory[144]} = 32'h00130313;	//addi x6 x6 1
{Inst_memory[151], Inst_memory[150], Inst_memory[149], Inst_memory[148]} = 32'hfa000ce3;	//beq x0 x0 -72

end

always @(Instr_Addr)

begin
Instruction[31:24] <= Inst_memory[Instr_Addr + 3];
Instruction[23:16] <= Inst_memory[Instr_Addr + 2];
Instruction[15:8] <= Inst_memory[Instr_Addr + 1];
Instruction[7:0] <= Inst_memory[Instr_Addr];

end
endmodule