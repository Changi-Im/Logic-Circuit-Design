`timescale 1ns/100ps

module testbench;
    reg [83:0] binary; // bit stream
    reg clk, in; // clock && 1-bit binary input
    wire [3:0] cnt; // count for 7-bit clusters
    wire [6:0] out4260; // 7-bit output from 7-bit clusters
    reg [6:0] ascii; // store ascii character from 7-bit clusters
    integer i, len; 

    b2a u1(in, clk, cnt, out4260);

    initial begin
        clk = 1;
        binary = 84'b100100011001011101100110110011011111011111101011111011111110010110110011001000101011;
        len = $bits(binary); // len = len(binary)
        i = len-1; 
        in = binary[i];
        while(i>=0) begin
            #1 in = binary[i-1];
            if(cnt == 6) begin
                ascii = out4260;
                $display("%s", ascii);
            end
            i = i - 1;
        end
        #7 $finish;
    end

    always begin
        #0.5 clk = ~clk;
    end

    initial begin
        $dumpfile("output.vcd");
        $dumpvars(0);    
    end
endmodule
