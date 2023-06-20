module b2a(in, clk, cnt, out4260);
    input in, clk;
    output reg [6:0] out4260;
    output reg [3:0] cnt;

    always @(posedge clk) begin
        if(cnt < 6) begin
            cnt = cnt + 1;
            out4260[6-cnt] = in;
        end
        else begin
            cnt = 0;
            out4260 = 0;
            out4260[6-cnt] = in;
        end

    end 
endmodule



