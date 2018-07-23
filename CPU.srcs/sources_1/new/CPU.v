`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/16 14:41:04
// Design Name: 
// Module Name: topModuleCpu
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


module CPUTOP(
    input clk,
    input reset,
    output RW,
    output[31:0] IAddr,
    output[31:0] DataOut,
    output[5:0] opcode,
    output[4:0] rs,
    output[4:0] rt,
    output[4:0] rd,
    output[4:0] sa,
    output[31:0] ext_sa,
    output[15:0] immidate,
    output[31:0] JAddr,
    output zero,
    output DBDataSrc,
    output mWR,
    output mRD,
    output ALUSrcB,
    output ALUSrcA,
    output[1:0] PCSrc,
    output[2:0] ALUOp,
    output RegWre,
    output RegDst,
    output InsMemRW,
    output PCWre,
    output ExtSel,
    output[4:0] WriteReg,
    output[31:0] ReadData1,
    output[31:0] ReadData2,
    output[31:0] ALUA,
    output[31:0] ALUB,
    output[31:0] ExtResult,
    output[31:0] result,
    output[31:0] IDataOut,
    output[31:0] DB,
    output[31:0] nextPC
    );
    //module instructionMemory(input RW,input[31:0] IAddr,output reg[31:0] DateOut);
    instructionMemory ins(InsMemRW,IAddr,IDataOut);
    //module ALU32(input[2:0] ALUopcode,input[31:0] rega,input[31:0] regb,output reg[31:0] result,output zero);
    ALU32 alu(ALUOp,ALUA,ALUB,result, zero);
    //module controlUnit(input[5:0] opcode,input zero,output DBDataSrc,output mWR,output mRD,output ALUSrcB,output ALUSrcA,output[1:0] PCSrc,output[2:0] ALUOp,output RegWre,output RegDst,output InsMemRW,output PCWre,output ExtSel);
    controlUnit control(opcode,zero,DBDataSrc,mWR,mRD,ALUSrcB,ALUSrcA,PCSrc,ALUOp,RegWre,RegDst,InsMemRW,PCWre,ExtSel);
    
    //module RAM(input clk,input [31:0] address,input [31:0] writeData, input nRD,input nWR, output [31:0] Dataout);
    RAM ram(clk,result,ReadData2, mRD,mWR,DataOut);
    //module PC(input clk,input reset,input PCWre,input[31:0] nextPC,output[31:0] currentPC);
    PC pc(clk,reset,PCWre,nextPC,IAddr);
    //module RegFile(input CLK,input RST,input RegWre,input [4:0] ReadReg1,input [4:0] ReadReg2,input [4:0] WriteReg,input [31:0] WriteData,output [31:0] ReadData1,output [31:0] ReadData2);
    RegFile regf(clk,reset,RegWre,rs,rt,WriteReg,DB,ReadData1,ReadData2);
    //module aignZeroExtend(input[15:0] extendee,input ExtSel,output reg[31:0] result);
    aignZeroExtend ext(immidate,ExtSel,ExtResult);
    
    //module selecterFor5bits(input src,input[4:0] input1,input[4:0] input2,output reg[4:0] outputResult);
    selecterFor5bits selecter1(RegDst,rt,rd,WriteReg);
    selecterFor32bits selecter2(ALUSrcA,ReadData1, ext_sa, ALUA);
    selecterFor32bits selecter3(ALUSrcB,ReadData2,ExtResult,ALUB);
    selecterFor32bits selecter4(DBDataSrc,result,DataOut,DB);
    
    //module decodeInstruction(input[31:0] DataOut,input[31:0] PC4,output[5:0] opcode,output[4:0] rs,output[4:0] rt,output[4:0] rd,
    //    output[4:0] sa,output[31:0] ext_sa,output[15:0] immidate,output[31:0] jAddr);
    decodeInstruction decode(IDataOut, (IAddr+4), opcode, rs, rt, rd, sa, ext_sa, immidate, JAddr);
    
    //module PCSelecter(input[1:0] PCSrc,input[31:0] normalPC,input[31:0] immidatePC,input[31:0] jumpPC,output reg[31:0] nextPC);
    PCSelecter pcselecter(PCSrc,(IAddr+4),(IAddr+4+(ExtResult << 2)),JAddr,nextPC);
    
endmodule
