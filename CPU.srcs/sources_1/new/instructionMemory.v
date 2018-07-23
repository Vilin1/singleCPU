`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/16 14:38:52
// Design Name: 
// Module Name: instructionMemory
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


module instructionMemory(
    input RW,
    input[31:0] IAddr,
    output reg[31:0] IDataOut
    );
    reg[7:0] storage[256:0];
    initial
    begin
        $readmemb("D:/vivadodata/ins.txt",storage);
    end
    always@(RW or IAddr)
    begin
        if(RW == 1)
        begin
            IDataOut[7:0] <= storage[IAddr+3];
            IDataOut[15:8] <= storage[IAddr+2];
            IDataOut[23:16] <= storage[IAddr+1];
            IDataOut[31:24] <= storage[IAddr+0];
        end
        else
        begin
            storage[IAddr+0] <= IDataOut[7:0];
            storage[IAddr+1] <= IDataOut[15:8];
            storage[IAddr+2] <= IDataOut[23:16];
            storage[IAddr+3] <= IDataOut[31:24];
        end
    end
endmodule
