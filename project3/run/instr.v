module inst_mem (input [12:0] pc, input[383:0] in_instr, output reg [15:0] current_instruction); 	
    reg [15:0] rom[23:0];  	
    		    
    always @(*) begin
        {rom[0], rom[1], rom[2], rom[3], rom[4], rom[5], rom[6], rom[7], rom[8], rom[9], rom[10], rom[11], rom[12], rom[13], rom[14], rom[15], rom[16], rom[17], rom[18], rom[19], rom[20], rom[21], rom[22], rom[23]} = in_instr;
        // initialize rom
        if(pc<23)
            current_instruction = rom[pc[4:0]];  
        else
            current_instruction = rom[23];  
    end
 endmodule


 


