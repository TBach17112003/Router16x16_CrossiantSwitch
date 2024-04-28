`timescale 1ns / 1ps


module Router(reset_n, clock, din, valid_n, frame_n, addr_valid, dout, valido_n, frameo_n, busy_n,addr_o);
input reset_n;
input clock;
// input port pins:
input  din, valid_n, frame_n;
input addr_valid;   // output port valid?
// output port pins:
output reg [15:0] dout, valido_n, frameo_n,busy_n;
output [3:0] addr_o ; // address of output port

assign addr_o = Address_out;
reg [3:0] State_bit = 4'b1111;
reg [3:0] Address_out = 4'bx;
reg first = 1'b1;
reg [3:0]i = 0;
// parameter
//make simple:
assign reset = ~reset_n;

//SOURCE CODE
always @(posedge clock or posedge reset_n) begin
    if (reset_n == 0) begin
        repeat(16) begin
            dout[i] = 1'bx;
            valido_n[i] = 1'bx;
            frameo_n[i] = 1'b1;
            busy_n[i] = 1'b0; 
            State_bit = 4'b1111; 
            first = 1'b1;
            i = i + 1;
        end
    end
    else begin
        //Start sending packed
        if (State_bit == 4'b1111) begin
            dout[Address_out] = 1'bx;
            valido_n[Address_out] = 1'bx;
            frameo_n[Address_out] = 1'b1;
            busy_n[Address_out] = 0;
            Address_out = 4'bx;
        end
        if (frame_n == 0) 
            begin
                State_bit = State_bit + 1;
                first = 0;
                // Address and Padding
                if (State_bit >= 0 && State_bit <= 7) 
                    begin
                    //Get Address of Port Out
                    if (State_bit >= 0 && State_bit <= 3) 
                    begin
                        Address_out[3-State_bit] =  din;
                    end
                    //Starting get input port
                    else
                    begin
                    // Padding Stage
                        //check if outport is valid at state 3
                        if(addr_valid == 1 && State_bit == 4) //outport not valid 
                        begin
                            State_bit = 3;
                        end
                        if(State_bit == 4) //busy = 1 at state 4
                            busy_n[Address_out] = 1;
                    end
                    end
                // Port Out Active
                else if (State_bit >= 8 && State_bit <= 15) 
                    begin
                        frameo_n[Address_out] = 0;
                        valido_n[Address_out] = valid_n;
                        // Data In Invalid
                        if (valid_n == 1) begin
                        //Wait 1 clock to handle invalid bit
                        State_bit = State_bit - 1;
                        dout[Address_out] = 1'bx;
                    end
                    // Data In valid
                    else if (valid_n == 0) 
                    begin
                        dout[Address_out] = din;
                    end
              end
        end
        //End sending packed
        else if (frame_n == 1) begin
            State_bit = State_bit + 1;
            frameo_n[Address_out] = 1;
            valido_n[Address_out] = valid_n;
            //Checking last bit data
            if (valid_n == 1) begin
                //Wait 1 clock to handle invalid bit
                State_bit = State_bit - 1;
                dout[Address_out] = 1'bx;
            end
            // Data In valid
            else if (valid_n == 0) begin
                dout[Address_out] = din;
            end
        end
    end
end

endmodule
