`timescale 1ns / 1ps

module data_memory(
input [63:0] mem_add,
input [63:0] write_data,
input clk,
input mem_write,
input mem_read,
output reg [63:0] read_data,
output [31:0] arr0, //array is of length 5
output [31:0] arr1,
output [31:0] arr2,
output [31:0] arr3,
output [31:0] arr4,
output [31:0] arr5,
output [31:0] arr6
);
reg [7:0] Data_Memory [511:0]; 

integer i;
initial begin
for (i = 0 ; i < 512 ; i = i+ 1)  //initializing 64 locations in data memory, each location 8 bit wide
    Data_Memory[i] = 0; //initializing each element as 0
    

end 
//each array value is of 8 bytes ( 64-bit integers)
assign arr0 = {Data_Memory[259],Data_Memory[258],Data_Memory[257],Data_Memory[256]};
assign arr1 = {Data_Memory[263],Data_Memory[262],Data_Memory[261],Data_Memory[260]};
assign arr2 = {Data_Memory[267],Data_Memory[266],Data_Memory[265],Data_Memory[264]};
assign arr3 = {Data_Memory[271],Data_Memory[270],Data_Memory[269],Data_Memory[268]};
assign arr4 = {Data_Memory[275],Data_Memory[274],Data_Memory[273],Data_Memory[272]};
assign arr5 = {Data_Memory[279],Data_Memory[278],Data_Memory[277],Data_Memory[276]};
assign arr6 = {Data_Memory[283],Data_Memory[282],Data_Memory[281],Data_Memory[280]};
always@ (*) begin
 if (mem_read == 1'b1)
 //if mem_read is high, and mem_address changes:
 begin//reading data from data memory
 read_data[7:0] <= Data_Memory[mem_add];
 read_data[15:8] <= Data_Memory[mem_add+1];
 read_data[23:16] <= Data_Memory[mem_add+2];
 read_data[31:24] <= Data_Memory[mem_add+3];
 read_data[63:32] <= {32{Data_Memory[mem_add +3]}};
// read_data[39:32] <= Data_Memory[mem_add+4];
// read_data[47:40] <= Data_Memory[mem_add+5];
// read_data[55:48] <= Data_Memory[mem_add+6];
// read_data[63:56] <= Data_Memory[mem_add+7];
 end
else
read_data<=64'b0;

end
always@ (posedge clk) begin
 if (mem_write == 1'b1) //if mem_write is high and positive edge of clk is high:
 begin //writing data in data memory at mem_address
// Data_Memory[mem_add+7] <= write_data[63:56];
// Data_Memory[mem_add+6] <= write_data[55:48];
// Data_Memory[mem_add+5] <= write_data[47:40];
// Data_Memory[mem_add+4] <= write_data[39:32];
 Data_Memory[mem_add+3] <= write_data[31:24];
 Data_Memory[mem_add+2] <= write_data[23:16];
 Data_Memory[mem_add+1] <= write_data[15:8];
 Data_Memory[mem_add] <= write_data[7:0];
 end
 end
endmodule