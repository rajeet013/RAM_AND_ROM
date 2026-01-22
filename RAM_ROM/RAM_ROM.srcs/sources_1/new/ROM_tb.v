`timescale 1ns / 1ps


module ROM_tb;
    reg CLK; // Clock
    reg EN; // Enabler
    reg [3:0] addr; // Address
    reg [3:0] data; // Output Data
    
    ROM R1 (CLK, EN, addr, data);
    
    initial
        begin
            $dumpfile("dump.vcd");
            $dumpvar(1, rom_tb);
            
            CLK=1'b1;
            forever #5 CLK = ~CLK;
        end
        
     initial
        begin
            EN = 1'b0;
            #10;
            
            EN = 1'b1;
            addr = 4'b0110;
            #10;
            
            addr = 4'b0110;
            #10;
            
            addr = 4'b0011;
            #10;
            
            EN = 1'b0;
            addr = 4'b1111;
            #10;
            
            EN = 1'b1;
            addr = 4'b1000;
            #10;
            
            addr = 4'bxxxx;
            #10; 
        end
        
    initial
        begin
            #80 $stop;
        end
endmodule
