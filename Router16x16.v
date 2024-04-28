//////////////////////////////////////////////////////////////////////////////////



module Router16x16(reset_n, clock, din, valid_n, frame_n, dout, valido_n, frameo_n, busy_n);
// control pins:
input reset_n;
input clock;

// input port pins:
input [15:0] din, valid_n, frame_n;

// output port pins:
output reg [15:0] valido_n, dout; 
output [15:0] frameo_n, busy_n;
wire [15:0] temp_dout [15:0];
wire [15:0] temp_valido_n [15:0];
wire [15:0] temp_frameo_n [15:0];
wire [15:0] temp_busy_n [15:0];
wire [15:0] temp_valido_n_1, temp_valido_n_0;
wire [15:0] temp_dout_1, temp_dout_0;

wire [4:0] addr_outport [15:0];
wire addr_valid [15:0]; // outport valid? of 16 router

Router In0(reset_n, clock, din[0], valid_n[0], frame_n[0], addr_valid[0], temp_dout[0], temp_valido_n[0], temp_frameo_n[0], temp_busy_n[0], addr_outport[0]);
Router In1(reset_n, clock, din[1], valid_n[1], frame_n[1], addr_valid[1], temp_dout[1], temp_valido_n[1], temp_frameo_n[1], temp_busy_n[1], addr_outport[1]);
Router In2(reset_n, clock, din[2], valid_n[2], frame_n[2], addr_valid[2], temp_dout[2], temp_valido_n[2], temp_frameo_n[2], temp_busy_n[2], addr_outport[3]);
Router In3(reset_n, clock, din[3], valid_n[3], frame_n[3], addr_valid[3], temp_dout[3], temp_valido_n[3], temp_frameo_n[3], temp_busy_n[3], addr_outport[3]);
Router In4(reset_n, clock, din[4], valid_n[4], frame_n[4], addr_valid[4], temp_dout[4], temp_valido_n[4], temp_frameo_n[4], temp_busy_n[4], addr_outport[4]);
Router In5(reset_n, clock, din[5], valid_n[5], frame_n[5], addr_valid[5], temp_dout[5], temp_valido_n[5], temp_frameo_n[5], temp_busy_n[5], addr_outport[5]);
Router In6(reset_n, clock, din[6], valid_n[6], frame_n[6], addr_valid[6], temp_dout[6], temp_valido_n[6], temp_frameo_n[6], temp_busy_n[6], addr_outport[6]);
Router In7(reset_n, clock, din[7], valid_n[7], frame_n[7], addr_valid[7], temp_dout[7], temp_valido_n[7], temp_frameo_n[7], temp_busy_n[7], addr_outport[7]);
Router In8(reset_n, clock, din[8], valid_n[8], frame_n[8], addr_valid[8], temp_dout[8], temp_valido_n[8], temp_frameo_n[8], temp_busy_n[8], addr_outport[8]);
Router In9(reset_n, clock, din[9], valid_n[9], frame_n[9], addr_valid[9], temp_dout[9], temp_valido_n[9], temp_frameo_n[9], temp_busy_n[9], addr_outport[9]);
Router In10(reset_n, clock, din[10], valid_n[10], frame_n[10], addr_valid[10], temp_dout[10], temp_valido_n[10], temp_frameo_n[10], temp_busy_n[10], addr_outport[10]);
Router In11(reset_n, clock, din[11], valid_n[11], frame_n[11], addr_valid[11], temp_dout[11], temp_valido_n[11], temp_frameo_n[11], temp_busy_n[11], addr_outport[11]);
Router In12(reset_n, clock, din[12], valid_n[12], frame_n[12], addr_valid[12], temp_dout[12], temp_valido_n[12], temp_frameo_n[12], temp_busy_n[12], addr_outport[12]);
Router In13(reset_n, clock, din[13], valid_n[13], frame_n[13], addr_valid[13], temp_dout[13], temp_valido_n[13], temp_frameo_n[13], temp_busy_n[13], addr_outport[13]);
Router In14(reset_n, clock, din[14], valid_n[14], frame_n[14], addr_valid[14], temp_dout[14], temp_valido_n[14], temp_frameo_n[14], temp_busy_n[14], addr_outport[14]);
Router In15(reset_n, clock, din[15], valid_n[15], frame_n[15], addr_valid[15], temp_dout[15], temp_valido_n[15], temp_frameo_n[15], temp_busy_n[15], addr_outport[15]);


//Handling signal Output
assign temp_dout_0 = temp_dout[0] & temp_dout[1] & temp_dout[2] & temp_dout[3] & temp_dout[4] & temp_dout[5] 
                    & temp_dout[6] & temp_dout[7] & temp_dout[8] & temp_dout[9] & temp_dout[10] 
                    & temp_dout[11] & temp_dout[12] & temp_dout[13] & temp_dout[14] & temp_dout[15];
                        //Get bit 0 in Data Out => only include bit 0 và X
                    //0x0xxxxx  010x1xxx
                    //x1xx1xxx
assign temp_dout_1 =  temp_dout[0] | temp_dout[1] | temp_dout[2] | temp_dout[3] | temp_dout[4] | temp_dout[5] 
                    | temp_dout[6] | temp_dout[7] | temp_dout[8] | temp_dout[9] | temp_dout[10] 
                    | temp_dout[11] | temp_dout[12] | temp_dout[13] | temp_dout[14] | temp_dout[15];
                    //Get bit 1 in Data Out => only include bit 1 và X
                    
assign temp_valido_n_0 = temp_valido_n[0] & temp_valido_n[1] & temp_valido_n[2] & temp_valido_n[3] & temp_valido_n[4] & temp_valido_n[5] 
                    & temp_valido_n[6] & temp_valido_n[7] & temp_valido_n[8] & temp_valido_n[9] & temp_valido_n[10] 
                    & temp_valido_n[11] & temp_valido_n[12] & temp_valido_n[13] & temp_valido_n[14] & temp_valido_n[15];
assign temp_valido_n_1 = temp_valido_n[0] | temp_valido_n[1] | temp_valido_n[2] | temp_valido_n[3] | temp_valido_n[4] | temp_valido_n[5] 
                    | temp_valido_n[6] | temp_valido_n[7] | temp_valido_n[8] | temp_valido_n[9] | temp_valido_n[10] 
                    | temp_valido_n[11] | temp_valido_n[12] | temp_valido_n[13] | temp_valido_n[14] | temp_valido_n[15];                    
integer i;
always @* begin
    for(i = 0; i < 16; i = i + 1) begin
        if (temp_dout_0[i] == 0) dout[i] = 0;
        else if(temp_dout_1[i] == 1) dout[i] = 1;
        else dout[i] = 1'bx;
        
        if (temp_valido_n_0[i] == 0) valido_n[i] = 0;
        else if(temp_valido_n_1[i] == 1) valido_n[i] = 1;
        else valido_n[i] = 1'bx;
    end
end


        
assign frameo_n = temp_frameo_n[0] & temp_frameo_n[1] & temp_frameo_n[2] & temp_frameo_n[3] & temp_frameo_n[4] & temp_frameo_n[5]
                    & temp_frameo_n[6] & temp_frameo_n[7] & temp_frameo_n[8] & temp_frameo_n[9] & temp_frameo_n[10] 
                    & temp_frameo_n[11] & temp_frameo_n[12] & temp_frameo_n[13] & temp_frameo_n[14] & temp_frameo_n[15];
                    //And each bit of  frameo_n[15:0] for each Input port receive
                    // When reset, all frameo_n will set to 1 and to 0 when active, so use AND to get the 0 value of frameo_n
                    
assign busy_n = temp_busy_n[0] | temp_busy_n[1] | temp_busy_n[2] | temp_busy_n[3] | temp_busy_n[4] | temp_busy_n[5] 
                    | temp_busy_n[6] | temp_busy_n[7] | temp_busy_n[8] | temp_busy_n[9] | temp_busy_n[10] 
                    | temp_busy_n[11] | temp_busy_n[12] | temp_busy_n[13] | temp_busy_n[14] | temp_busy_n[15];
                    //Or each bit of busy_n[15:0] that each Input port receive 
                    //When reset, all busy_n will set to 0 and to 1 when active, so use OR to get the 1 value of busy_n
                    

// output arbitrate                  
output_arbitrate R0(addr_outport[0],busy_n,addr_valid[0]);
output_arbitrate R1(addr_outport[1],busy_n,addr_valid[1]);
output_arbitrate R2(addr_outport[2],busy_n,addr_valid[2]);
output_arbitrate R3(addr_outport[3],busy_n,addr_valid[3]);
output_arbitrate R4(addr_outport[4],busy_n,addr_valid[4]);
output_arbitrate R5(addr_outport[5],busy_n,addr_valid[5]);
output_arbitrate R6(addr_outport[6],busy_n,addr_valid[6]);
output_arbitrate R7(addr_outport[7],busy_n,addr_valid[7]);
output_arbitrate R8(addr_outport[8],busy_n,addr_valid[8]);
output_arbitrate R9(addr_outport[9],busy_n,addr_valid[9]);
output_arbitrate R10(addr_outport[10],busy_n,addr_valid[10]);
output_arbitrate R11(addr_outport[11],busy_n,addr_valid[11]);
output_arbitrate R12(addr_outport[12],busy_n,addr_valid[12]);
output_arbitrate R13(addr_outport[13],busy_n,addr_valid[13]);
output_arbitrate R14(addr_outport[14],busy_n,addr_valid[14]);
output_arbitrate R15(addr_outport[15],busy_n,addr_valid[15]);
// check priority for output
endmodule



