`timescale 1ns/100ps

module testbench;
    reg [97:0] binary; // bit stream
    //reg[27:0] binary; // example 1
    reg clk, in; // clock && 1-bit binary
    reg [3:0] cnt; // count for 6-bit clusters
    reg [6:0] ascii; // store ascii character from 7-bit clusters
    reg [5:0] base64, inr; // store base64 character from 6-bit clusters && input remainder 
    wire [3:0] cnt1; // count for 7-bit clusters
    wire [6:0] out7, base; // 7-bit output from 7-bit clusters
    wire [5:0] out, outr, out4260; // out && output remainder && 6-bit output from 6-bit clusters
  
    integer i, len; 
    
    a2base u0 (in, clk, base64, ascii, cnt, inr, outr, cnt1, out7, out, base, out4260);

    initial begin
        clk = 1;
        binary = 98'b10000111001111100110110100000110011011000101100011011111110100111100111011111110011011101011101110;
        //binary = 28'b1000001_1000010_1000011_1000100;
        len = $bits(binary); // len = len(binary)
        i = len-1; 
        in = binary[i];
        cnt = 0;

        repeat(len+7*(len/49)+(6-(len%6))) begin 
            if(i != 0) begin
                #1 in = binary[i-1];         
                base64 = out4260;
            end
            else begin
                #1 in = 0;
                base64 = out4260;
            end
            if(cnt1 == 6) begin
                cnt = cnt + 1;
                ascii = out7;
                inr = outr;
                if(cnt != 8 ) begin
                    $display("%s",ascii); // print ascii
                end
                if(cnt == 7) begin
                    i = i + 7;
                    in = binary[i-1];
                    base64 = out4260;
                end
                if(cnt == 8)begin
                    cnt = 1;
                end
            end
            i = i - 1;
        end
        if((len % 6) != 0) begin
            base64 = outr;
            #6;
        end
        $finish;
    end

    always begin
        #0.5 clk = ~clk;
    end

    initial begin
        $dumpfile("output.vcd");
        $dumpvars(0);    
    end
endmodule
