module data_Memory  
(input clk, rst, input[383:0] in_data, input mem_read, mem_write_en,input [15:0] mem_access_addr,input [15:0] mem_write_data,output [15:0] mem_read_data);  
    integer i;  
    reg [15:0] internal_mem [23:0];  
    wire [4:0] mem_addr = mem_access_addr[4:0]; // store data memory address (0~23)  
    
    always @(posedge clk) begin  
        if (~rst)
            {internal_mem[0], internal_mem[1], internal_mem[2], internal_mem[3], internal_mem[4], internal_mem[5], internal_mem[6], internal_mem[7], internal_mem[8], internal_mem[9], internal_mem[10], internal_mem[11], internal_mem[12], internal_mem[13], internal_mem[14], internal_mem[15], internal_mem[16], internal_mem[17], internal_mem[18], internal_mem[19], internal_mem[20], internal_mem[21], internal_mem[22], internal_mem[23]} = in_data;
            // initialize internal_mem
        else if (mem_write_en)  			
            internal_mem[mem_addr] = mem_write_data;  // initialize new value for sw case
    end  

    assign mem_read_data = (mem_read==1'b1) ? internal_mem[mem_addr]: 16'd0;    // load value for lw case
endmodule   							
 


