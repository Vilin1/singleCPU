`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/16 15:05:40
// Design Name: 
// Module Name: RAM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module RAM(
    input clk,
    input [31:0] address,
    input [31:0] writeData, // [31:24], [23:16], [15:8], [7:0]
    input nRD, // Ϊ 1����������Ϊ 1,�������̬
    input nWR, // Ϊ 0��д��Ϊ 1���޲���
    output [31:0] Dataout
);
    reg [7:0] ram [0:60]; //�洢��
    // ��
    assign Dataout[7:0] = (nRD==0)?ram[address + 3]:8'bz; // z Ϊ����̬
    assign Dataout[15:8] = (nRD==0)?ram[address + 2]:8'bz;
    assign Dataout[23:16] = (nRD==0)?ram[address + 1]:8'bz;
    assign Dataout[31:24] = (nRD==0)?ram[address ]:8'bz;
    // д sw
    always@(negedge clk) 
    begin
        if( nWR==0 ) 
        begin
            ram[address] <= writeData[31:24];
            ram[address+1] <= writeData[23:16];
            ram[address+2] <= writeData[15:8];
            ram[address+3] <= writeData[7:0];
        end
    end
endmodule