`timescale 1ns / 1ps

module ClockDivider(
    input wire CLK,
    input wire [31:0] clkscale,
    output reg clk
    );
    
    reg[31:0] clkq = 0;
    
    always@(posedge CLK)
    begin
        clkq = clkq + 1;
        if(clkq >= clkscale)
        begin
            clk=~clk;
            clkq=0;
        end
    end
endmodule
