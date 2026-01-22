`timescale 1ns / 1ps


module SINGLE_PORT_RAM_tb;
    reg [7:0] data;     // input data
    reg [5:0] addr;     // address
    reg WE;     // Write Enable
    reg CLK; // CLK
    wire [7:0] Q; // output data
    
    SINGLE_PORT_RAM SPR1(data, addr, WE, CLK, Q);
    
    initial
        begin
            $dumpfile("dump.vcd");
            $dumpvars(1, SINGLE_PORT_RAM_tb);
            
            CLK=1'b1;
            forever #5 CLK = ~CLK;
        end
        
     initial
        begin
            data = 8'h01;
            addr = 5'd0;
            WE = 1'b1;
            #10;
            
            data = 8'h02;
            addr = 5'd1;
            #10;
            
            data = 8'h03;
            addr = 5'd2;
            #10;
            
            addr = 5'd0;
            WE = 1'b0;
            #10;
        end

endmodule
