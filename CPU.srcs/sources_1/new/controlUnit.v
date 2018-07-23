`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/16 14:35:37
// Design Name: 
// Module Name: controlUnit
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


module controlUnit(
    input[5:0] opcode,
    input zero,
    
    output DBDataSrc,
    output mWR,
    output mRD,
    output ALUSrcB,
    output ALUSrcA,
    output[1:0] PCSrc,
    output reg[2:0] ALUOp,
    output RegWre,
    output RegDst,
    output InsMemRW,
    output PCWre,
    output ExtSel
    );
    
    
   /*
    //ALUSrcA
    if(opcode == 6'b000000 || opcode == 6'b000010 || opcode == 6'b000001 || opcode == 6'b010010 || opcode == 6'b010001 || opcode == 6'b010000 || opcode == 6'b110000 || opcode == 6'b110001 || opcode == 6'b011011 || opcode == 6'b100110 || opcode == 6'b100111)
    begin
        assign ALUSrcA = 0;
    end
    else if(opcode == 6'b011000)
    begin
        assign ALUSrcA = 1;
    end
    
    //ALUSrcB
    if(opcode == 6'b000000 || opcode == 6'b000010 || opcode == 6'b010010 || opcode == 6'b010001 || opcode == 6'b011000 || opcode == 6'b110000 || opcode == 6'b1100011)
    begin
        assign ALUSrcB = 0;
    end
    else if(opcode == 6'b000001 || opcode == 6'b010000 || opcode == 6'b011011 || opcode == 6'b100110 || opcode == 6'b100111)
    begin
        assign ALUSrcB = 1;
    end
    
    //DBDataSrc
    if(opcode == 6'b000000 || opcode == 6'b000001 || opcode == 6'b000010 || opcode == 6'b010000 || opcode == 6'b010010 || opcode == 6'b010001 || opcode == 6'b011011 || opcode == 6'b011000)
    begin
        assign DBDataSrc = 0;
    end
    else if(opcode == 6'b100111)
    begin
        assign DBDataSrc = 1;
    end
    
    //RegWre
    if(opcode == 6'b100110 || opcode == 6'b110000 || opcode == 6'b110001 || opcode == 6'b111000 || opcode == 6'b111111)
    begin
        assign RegWre = 0;
    end
    else if(opcode == 6'b000000 || opcode == 6'b000001 || opcode == 6'b000010 || opcode == 6'b010000 || opcode == 6'b010010 || opcode == 6'b011011 || opcode == 6'b011000 || opcode == 6'b100111)
    begin
        assign RegWre = 1;
    end
    
    //RegDst
    if(opcode == 6'b000001 || opcode == 6'b010000 || opcode == 6'b011011 || opcode == 6'b100111)
    begin
        assign RegDst = 0;
    end
    else if(opcode == 6'b000000 || opcode == 6'b000010 || opcode == 6'b010001 || opcode == 6'b010010 || opcode == 6'b011000)
    begin
        assign RegDst = 1;
    end
    
    //ExtSel
    if(opcode == 6'b010000)
    begin
        assign ExtSel = 0;
    end
    else if(opcode == 6'b000001 || opcode == 6'b011011 || opcode == 6'b100110 || opcode == 6'b100111 || opcode == 6'b110000 || opcode == 6'b110001)
    begin
        assign ExtSel = 1;
    end
*/    
    assign PCWre = (opcode == 6'b111111)?0:1;
    assign DBDataSrc = (opcode == 6'b100111)?1:0;
    assign mWR = (opcode == 6'b100110)?0:1;
    assign mRD = (opcode == 6'b100111)?0:1;
    assign ALUSrcB = (opcode == 6'b000001 || opcode == 6'b010000 || opcode == 6'b011011 || opcode == 6'b100110 || opcode == 6'b100111)?1:0;
    assign ALUSrcA = (opcode == 6'b011000)?1:0;
    assign RegWre = (opcode == 6'b100110 || opcode == 6'b110000 || opcode == 6'b110001 || opcode == 6'b111000 || opcode == 6'b111111)?0:1;
    assign RegDst = (opcode == 6'b000001 || opcode == 6'b010000 || opcode == 6'b011011 || opcode == 6'b100111)?0:1;
    assign InsMemRW = 1;
    assign ExtSel = (opcode == 6'b000001 || opcode == 6'b011011 || opcode == 6'b100110 || opcode == 6'b100111 || opcode == 6'b110000 || opcode == 6'b110001)?1:0;
    assign PCSrc = ((opcode == 6'b110000 && zero == 1)||(opcode == 6'b110001 && zero == 0))?01:(opcode == 6'b000000 || opcode == 6'b000001 || opcode == 6'b000010 || opcode == 6'b010010 || opcode == 6'b010000 || opcode == 6'b010001 || opcode == 6'b011011 || opcode == 6'b011000 || opcode == 6'b100110 || opcode == 6'b100111 || (opcode == 6'b110000&&zero == 0) || (opcode == 6'b110001&&zero == 1))?00:(opcode == 6'b111000)?10:11;
    /*
    if(opcode == 6'b000000 || opcode == 6'b000001 || opcode == 6'b000010 || opcode == 6'b010010 || opcode == 6'b010000 || opcode == 6'b010001 || opcode == 6'b011011 || opcode == 6'b011000 || opcode == 6'b100110 || opcode == 6'b100111 || (opcode == 6'b110000&&zero == 0) || (opcode == 6'b110001&&zero == 1))
    begin
        assign PCSrc = 2'b00;
    end
    else if((opcode == 6'b11000 && zero == 1)||(opcode == 6'b110001 && zero == 0))
    begin
        assign PCSrc = 2'b01;
    end
    else if(opcode == 6'b111000)
    begin
        assign PCSrc = 2'b10;
    end
   */ 
    always@(opcode)
    begin
        case(opcode)
            //add
            6'b000000:ALUOp = 3'b000;
            
            //addi
            6'b000001:ALUOp = 3'b000;
            
            //sub
            6'b000010:ALUOp = 3'b001;
            
            //ori
            6'b010000:ALUOp = 3'b011;
            
            //and
            6'b010001:ALUOp = 3'b100;
            
            //or
            6'b010010:ALUOp = 3'b011;
            
            //sll
            6'b011000:ALUOp = 3'b010;
            
            //slti
            6'b011011:ALUOp = 3'b110;
            
            //sw
            6'b100110:ALUOp = 3'b000;
            
            //lw
            6'b100111:ALUOp = 3'b000;
            
            //beq
            6'b110000:ALUOp = 3'b001;
            
            //bne
            6'b110001:ALUOp = 3'b001;
            
            //j
            6'b111000:
            begin 
            end
            
            //halt
            6'b111111:begin end
            default : begin end
        endcase
    end
endmodule
