`timescale 1ns / 1ps

module BoardMap(
    input CLK,
    input BTN,
    output [15:0] LED
    );
    //instanciation 
    wire div_clk;
    ClockDivider clkdiv(.CLK(CLK), .clkscale(500000000), .clk(div_clk));
    LFSR shiftreg(.CLK(div_clk), .RST(BTN), .max_tick_reg(LED[15]), .out(LED[9:0]));
    
endmodule
