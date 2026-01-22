`timescale 1ns / 1ps


module DUAL_PORT_RAM(
    input [7:0] data_a, data_b,  // input data
    input [5:0] addr_a, addr_b, // address
    input WE_a, WE_b,   // write enable for port A nad port B
    input CLK,  // Clock
    output reg [7:0] Q_a, Q_b   // output data
    );
    
    reg [7:0] ram [63:0]; // 8*64 bit ram
    
    always @ (posedge CLK)
        begin
            if(WE_a)
                ram[addr_a] <= data_a;
            else
                Q_a <= ram[addr_a];
        end
        
    always @ (posedge CLK)
        begin
            if(WE_b)
                ram[addr_b] <= data_b;
            else
                Q_b <= ram[addr_b];
        end
endmodule
