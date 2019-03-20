`timescale 1ns / 1ps


module ClockTestBench(

    );
    
    reg CLK;
    reg RST;
    reg testvec;
    wire out;
    
    d_ff_reset UUT(.clk(CLK), .reset(RST), .d(testvec), .q(out));
    
    initial
    begin
        RST = 1'b1;
        testvec = 1'b0;
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
        #30
        testvec = 1'b1;
        #25
        testvec = 1'b0;
        #30
        testvec = 1'b1;
        #100
        testvec = 1'b0;
    end
    
    initial
    begin
        #45
        RST = 1'b0;
        #80
        RST = 1'b1;
        #30
        RST = 1'b0;
    end
    
    initial
    begin 
        #200;
        $stop;
    end  
endmodule
