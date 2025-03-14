`timescale 1ns / 1ps

module sar_algorithm_tb();

    reg Op, En, Om, clk, rst;
    wire [7:0] B, BN, D;
    
    // Instantiate the SAR algorithm module
    sar_algorithm uut (
        .Op(Op),
        .En(En),
        .Om(Om),
        .clk(clk),
        .rst(rst),
        .B(B),
        .BN(BN),
        .D(D)
    );
    
    // Clock generation
    always #10 clk = ~clk; // 10ns period (100 MHz)
    
    initial begin
    	$dumpfile("sar_algo_tb.vcd");
    	$dumpvars(0, sar_algorithm_tb);
        // Initialize signals
        clk = 0;
        rst = 0;
        En = 0;
        Op = 0;
        Om = 0;
        
        // Apply reset
        #10 rst = 1;
        #10 rst = 0; En = 1;
       
        
        // Provide input pattern
        #10 Op = 1; Om = 0;
        #10 Op = 1; Om = 0;
        #10 Op = 1; Om = 0;
        #10 Op = 1; Om = 0;
        #10 Op = 1; Om = 0;
        #10 Op = 1; Om = 0;
        #10 Op = 1; Om = 0;
        #10 Op = 1; Om = 0;
        
        #10 rst = 1;
        
        // End simulation
        #50 $finish;
    end
    
endmodule
