`timescale 1ns / 1ps

module LFSR(
    input wire CLK,
    input wire RST,
    output reg max_tick_reg,
    output wire[9:0] out
    );

    reg[9:0] lfsr_reg; //d flip-flop for output
    wire[9:0] lfsr_next;
    wire tap; //for x-noring bits
    assign out = lfsr_reg; //assigning an output wire to the d-flipflop
    
    assign tap = lfsr_reg[9] ~^ lfsr_reg[6]; //x-noring bits 9 and 6
    assign lfsr_next = {lfsr_reg[8:0], tap};  //shifting 
    localparam SEED = 10'b1001010100; //the seed
    
    always @(posedge(CLK), posedge(RST)) //asynchronous reset
    begin
        if(RST)
        begin
            lfsr_reg <= SEED; //reseting to seed
        end
        else
        begin
            lfsr_reg <= lfsr_next;//moving data
        end
        
        max_tick_reg <= lfsr_reg == SEED;//check if the seed is back for the max tick
        
    end
    
    
    
    
endmodule    