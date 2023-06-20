`timescale 1ns/1ps
module MIPS_tb();
    reg clk, rst;
    reg [383:0] in_instr, in_data; // instruction memory and data memory for implementation
    reg [31:0] in_val; // initial value for $r
    wire [15:0] current_instr;
    MIPS16 cgcpu(clk, rst, in_instr, in_data, in_val, current_instr);
    initial begin
        clk=0; rst=0;
        in_val = 32'b0;
        in_instr = 384'b1001_1001_0000_00011001_1001_1000_00100000_1001_1100_00000000_1001_1001_01001100_0100_0000_00100000_1001_1100_00100100_0000_0000_10000000_1001_1100_00010000_1001_1100_00110110_0000_0000_11011111_0010_0000_00101011_1010_0000_00110100_0000_0000_1111000_010_011_100_01100001_1100_0000_10000000_0000_0000_00000000_0000_0000_00000000_0000_0000_00000000_0000_0000_00000000_0000_0000_00000000_0000_0000_00000000_0000_0000_00000000_0000_0000_00000000_0000_0000_0000;
        // given instruction memory
        in_data = 384'b0000_0000_0000_0000_0000_0000_0010_0011_0000_0000_0000_1001_0000_0000_0011_0001_0000_0000_1100_1001_0000_0000_0011_1100_0000_0000_1101_1011_0000_0000_0000_0111_1110_0001_0010_1000_0101_0011_1100_0101_1001_0111_1000_1001_1101_0011_1101_1111_1011_1001_1001_0001_0000_0100_0110_0101_0001_1100_0101_0110_0001_0010_1110_0100_0110_1000_0011_1001_1111_1000_0010_1011_0011_1101_0111_1001_1011_0000_0111_0001_0010_0001_1110_0110_1101_0000_1100_1010_0111_0111_0000_1110_1111_1101_1011_1001;
        // given data memory
        #2 rst = 1;
        
        #18 $display("The final result of $s3 in memory is: %d", cgcpu.data_memory.internal_mem[3]);	// the final value of $s3
        $finish;
    end					
    always begin
        #0.5 clk=~clk; 
    end					
    always begin
        #1 $display("ID:4260,  at time %t ps, PC = %d, RF[0,1,2,3,4,7] is : %d,%d,%d,%d,%d,%d", $time, cgcpu.PC.PC_out, cgcpu.register_file.internal_memory[0], cgcpu.register_file.internal_memory[1], cgcpu.register_file.internal_memory[2], cgcpu.register_file.internal_memory[3], cgcpu.register_file.internal_memory[4], cgcpu.register_file.internal_memory[7]);    end
    initial begin
        $dumpfile("output.vcd");
        $dumpvars(0);
    end
endmodule