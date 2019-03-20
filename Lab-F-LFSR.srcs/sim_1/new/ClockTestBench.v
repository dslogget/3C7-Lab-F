`timescale 1ns / 1ps


module ClockTestBench(

    );
    
    reg CLK;
    reg RST;
    wire out;
    wire tickover;
    
    LFSR UUT(.CLK(CLK), .RST(RST), .max_tick_reg(tickover), .out(out));
    
    initial
    begin
        RST = 1'b1;
        #10
        RST = 1'b0;
    end
    
    
    always
    begin
        CLK = 1'b0;
        #10;
        CLK = 1'b1;
        #10;
    end
    
    initial
    begin
        #(20*(2**10));
        $stop;
    end
endmodule
