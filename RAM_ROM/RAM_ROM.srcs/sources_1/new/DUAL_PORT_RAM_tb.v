`timescale 1ns / 1ps


module DUAL_PORT_RAM_tb;
    reg [7:0] data_a, data_b; // input data
    reg [5:0] addr_a, addr_b;   // input address
    reg WE_a, WE_b; // Enabler for port A and B
    reg CLK; // Clock
    wire [7:0] Q_a, Q_b; // Output data at port A and B
    
    DUAL_PORT_RAM DPR1 (data_a, data_b, addr_a, addr_b, WE_a, WE_b, CLK, Q_a, Q_b);
    
    initial
        begin
            $dumpfile("dump.vcd");
            $dumpvar(1, DUAL_PORT_RAM_tb);
            
            CLK=1'b1;
            forever #5 CLK = ~CLK;
        end
        
    initial 
        begin
            data_a = 8'h33;
            addr_a = 6'h01;
            
            data_b = 8'h44;
            addr_b = 6'h02;
            
            WE_a = 1'b1;
            WE_b = 1'b1;
            
            #10;
            
            data_a = 8'h55;
            addr_a = 6'h03;
            
            addr_b = 6'h01;
            
            WE_b = 1'b0;
            
            #10;
            
            addr_a = 6'h02;
            
            addr_b = 6'h03;
            
            WE_a = 1'b0;
            
            #10;
            
            addr_a = 6'h01;
            
            data_b = 8'h77;
            addr_b = 6'h02;
            
            WE_b = 1'b1;
            
            #10;
        end
        
      initial
            #40 $stop;
            
endmodule
