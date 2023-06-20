module MIPS16(input clk, rst, input [383:0] in_instr, in_data, input[31:0] in_val, output [15:0] current_instruction);
    wire jump, branch, mem_read, mem_write, alu_src, reg_write, JRout, andout, zero;   
    wire [1:0] reg_dst,mem_to_reg,alu_op;  
    wire [2:0] writeaddress,ALU_Control;  
    wire [12:0] PC_out,PC_out1, PC_out2,PC_out3,PC_out4,PC_in; 
    wire [15:0] reg_write_data,write_data,print_rdata1, print_rdata2,inst_extend,aludata2,ALUresult,mem_read_data,mux6out; 

    PC_Reg PC(PC_in,rst,clk,PC_out);    // initialize Program Counter
    inst_mem instructionMemory(PC_out,in_instr,current_instruction);   // instruction will be executed through the PC from the input instruction memeory 	
    data_Memory data_memory( clk, rst, in_data, mem_read, mem_write, ALUresult, print_rdata2,mem_read_data);    // data memory will be read or written by RF information
    add #(13) Add1(PC_out, 13'b1, PC_out1);     // PC increases by 1 each time	
    and_gate And (andout, branch, zero);    // branch & zero, it will be operated as sel in MUX3					
    rf register_file(clk, rst, reg_write, in_val, current_instruction[12:10], current_instruction[9:7], writeaddress, reg_write_data, print_rdata1, print_rdata2);		// Register File gets the instruction and updates internal memory
    control CONTROL(current_instruction[15:13],rst,reg_dst,mem_to_reg,alu_op,jump, branch, mem_read, mem_write, alu_src, reg_write);    // control module for 16bit MIPS processor
    sign_extend signExtend(current_instruction[6:0],inst_extend);	// extending bit is needed for the addition (7bit to 16bit)
    ALUControl aluControl(ALU_Control, alu_op, current_instruction[3:0]);	//ALU Control is needed for selecting the value in the alu module
    alu ALU(print_rdata1, aludata2, ALU_Control, ALUresult, zero);   // alu module controls the value from the registers
    JR_Control jrControl(alu_op, current_instruction[3:0], JRout);    // JR control module is needed for jump instruction
    add #(13) Add2(PC_out1, inst_extend[12:0],PC_out2); 		// addition between the PC_out1 and the sign-extended instructoin

    mux3X1 #(3) MUX1(current_instruction[9:7], current_instruction[6:4], 3'b111, reg_dst, writeaddress);    // 3 to 1 mux for write_register address
    mux2X1 #(16) MUX2(print_rdata2, inst_extend, alu_src, aludata2); // 2 to 1 mux for alu data

    mux2X1 #(13) MUX3(PC_out1, PC_out2, andout, PC_out3);   /* these muxes are for pc */ 
    mux2X1 #(13) MUX4(PC_out3, current_instruction[12:0], jump, PC_out4);
    mux2X1 #(13) MUX5(PC_out4, print_rdata1[12:0], JRout, PC_in);

    mux3X1 #(16) MUX6(ALUresult, mem_read_data, {3'b000,PC_out1}, mem_to_reg, mux6out);   /* these muxes are for write_data */
    mux2X1 #(16) MUX7(mux6out, 16'b101, JRout, reg_write_data);
endmodule
