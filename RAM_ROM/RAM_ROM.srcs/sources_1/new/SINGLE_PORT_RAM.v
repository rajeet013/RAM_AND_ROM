`timescale 1ns / 1ps


module SINGLE_PORT_RAM(
    input [7:0] data, // Input data
    input [5:0] addr, // Input address
    input WE,   // Write Enable
    input CLK,  // Clock
    output [7:0] Q  // Output data
    );
    
    reg [7:0] ram [63:0]; // 8 * 64 bit RAM
    reg [5:0] addr_reg; // Address Register
    
    always @ (posedge CLK)
        begin
            if (WE)
                ram[addr] <= data;
            else
                addr_reg <= addr;
        end
     
     assign Q = ram[addr_reg];
     
endmodule
