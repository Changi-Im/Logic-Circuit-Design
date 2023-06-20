module rf(input clk, rst, regwrite, input[31:0] in_val, input [2:0] readaddress1, readaddress2, writeaddress, input [15:0] write_data, output [15:0] print_rdata1, print_rdata2);
    reg [15:0] internal_memory [7:0];		// internal memory to be loaded
    integer i;					 
    always @(posedge clk) begin
        {internal_memory[0], internal_memory[6]} = in_val; // initialize internal memory, $0, $6 are constant 0
        if(~rst) begin 
            for (i=0; i<8; i=i+1) 
                internal_memory[i] = 16'b0; 
        end	
        else if(regwrite) 
            internal_memory[writeaddress] = write_data;
    end						
    assign print_rdata1 = internal_memory[readaddress1];	// save internal memory in print_rdata1	
    assign print_rdata2 = internal_memory[readaddress2];	// save internal memory in print_rdata2	
endmodule

module PC_Reg(input [12:0] PC_in,input rst,clk,output reg [12:0] PC_out);
    always @(posedge clk)begin
        if (~rst)					// if the reset value is 0, PC value will be 0
            PC_out = 0;
        else if (PC_out>22)				// if the current PC value is greater than 22, the value will be 0 
            PC_out = 0;					
        else
            PC_out = PC_in;				// on the other cases, PC value will have next PC value
    end
endmodule

module control(input[2:0] opcode, input reset, output reg[1:0] regDst,memToReg,aluOp, output reg jump,branch,memRead,memWrite,aluSrc,regWrite);  
    always @(*) begin  			
        if(reset == 0) begin  
            regDst = 2'b00; aluSrc = 1'b0; memToReg = 2'b00; regWrite = 1'b0; memRead = 1'b0; memWrite = 1'b0;  branch = 1'b0;   
            aluOp = 2'b00; jump = 1'b0;
        end  
        else begin  
            case(opcode)   				
                3'b000: begin 				// add
                    regDst = 2'b01; aluSrc = 1'b0; memToReg = 2'b00; regWrite = 1'b1; memRead = 1'b0; memWrite = 1'b0;  branch = 1'b0;   
                    aluOp = 2'b00; jump = 1'b0;
                end  
                3'b001: begin  				// sli
                    regDst = 2'b00; aluSrc = 1'b1; memToReg = 2'b00; regWrite = 1'b1; memRead = 1'b0; memWrite = 1'b0;  branch = 1'b0;   
                    aluOp = 2'b10; jump = 1'b0;
                end
                3'b010: begin  				// j
                    regDst = 2'b00; aluSrc = 1'b0; memToReg = 2'b00; regWrite = 1'b0; memRead = 1'b0; memWrite = 1'b0;  branch = 1'b0;   
                    aluOp = 2'b00; jump = 1'b1;
                end  
                3'b011: begin   			// jal
                    regDst = 2'b10; aluSrc = 1'b0; memToReg = 2'b10; regWrite = 1'b1; memRead = 1'b0; memWrite = 1'b0;  branch = 1'b0;   
                    aluOp = 2'b00; jump = 1'b1;
                end  
                3'b100: begin 				// lw
                    regDst = 2'b00; aluSrc = 1'b1; memToReg = 2'b01; regWrite = 1'b1; memRead = 1'b1; memWrite = 1'b0;  branch = 1'b0;   
                    aluOp = 2'b11; jump = 1'b0;
                end
                3'b101: begin 				// sw
                    regDst = 2'b00; aluSrc = 1'b1; memToReg = 2'b00; regWrite = 1'b0; memRead = 1'b0; memWrite = 1'b1;  branch = 1'b0;   
                    aluOp = 2'b11; jump = 1'b0;
                end
                3'b110: begin   			// beq
                    regDst = 2'b00; aluSrc = 1'b0; memToReg = 2'b00; regWrite = 1'b0; memRead = 1'b0; memWrite = 1'b0;  branch = 1'b1;   
                    aluOp = 2'b01; jump = 1'b0;
                end
                3'b111: begin 				// addi
                    regDst = 2'b00; aluSrc = 1'b1; memToReg = 2'b00; regWrite = 1'b1; memRead = 1'b0; memWrite = 1'b0;  branch = 1'b0;   
                    aluOp = 2'b11; jump = 1'b0;
                end
            endcase  
        end  
    end  
endmodule

module ALUControl(output reg[2:0] ALU_Control,input [1:0] ALUop,input [3:0] Function);
    wire [5:0] ALUControlIn;
    assign ALUControlIn = {ALUop, Function};  	// ALU op (2bit) + Function (4bit)
    always @(ALUControlIn) begin
        casex (ALUControlIn)  			// ALU ctrl output bit according to each ALUControlIn bit
            6'b11xxxx: ALU_Control=3'b000;   6'b01xxxx: ALU_Control=3'b001;  
            6'b00_0000: ALU_Control=3'b000;  6'b00_0001: ALU_Control=3'b001;  
            6'b00_0010: ALU_Control=3'b010;  6'b00_0011: ALU_Control=3'b011;  
            6'b00_0100: ALU_Control=3'b100;  6'b00_0101: ALU_Control=3'b101;
            6'b00_0110: ALU_Control=3'b110;  6'b10xxxx: ALU_Control=3'b100;
        endcase  
    end
 endmodule

module alu(input [15:0] a, input [15:0] b, input [2:0] alu_control,output reg [15:0] result,output zero);  
    always @(*) begin   
        case(alu_control)  
            3'b000 : result = a + b; 3'b001 : result = a - b;	// add, sub
            3'b010 : result = a & b; 3'b011 : result = a | b;   // and, or
            3'b101 : result = a * b; 3'b110 : result = a / b;   // mul, div
            3'b100 : begin if (a<b) result = 16'd1;             // slt
                        else result = 16'd0; 
                    end
        endcase  
    end  
    assign zero = (result==16'd0) ? 1'b1: 1'b0;  // if the result value is 0, zero becomes 1
endmodule

module JR_Control( input[1:0] aluOp,input [3:0] function0,output JRControl);
    assign JRControl = ({aluOp,function0}==6'b001000) ? 1'b1 : 1'b0;	// JR control will be 1 when '{aluOp,function0}==6'b001000'
endmodule					

module and_gate(a, b, c);
    output a;
    input b,c;
    
    assign a = b & c;
endmodule

module sign_extend(input [6:0] in1,output [15:0] out1);
    assign out1= {9'b0,in1[6:0]};				// extend 7bit to 16 bit for the addition
endmodule

module add#(parameter data=13)
(input [12:0] a,input [data-1:0] b,output [data-1:0] result);  
    assign result = a + b; 				// add the value
endmodule

module mux2X1#(parameter data=16)
(input[data-1:0] in0,in1,input sel,output [data-1:0]out0);
    assign out0= (sel) ? in1 : in0;				// 2x1 mux 
endmodule					

module mux3X1#(parameter data=16)
(input [data-1:0] in0, in1, in2,input [1:0] sel, output reg [data-1:0] out0);                
    always @(*) begin 
        case(sel)						// 3x1 mux
            2'b00 : out0 = in0;					
            2'b01 : out0 = in1;					
            2'b10 : out0 = in2;					
        endcase
    end
endmodule


