`timescale 1ns/1ps

module control_tb();

    // Inputs
    reg clk;
    reg rst;
    reg ss;
    reg mosi;
    reg sck;
    reg [7:0] din;

    // Outputs
    wire miso;
    wire done;
    wire [7:0] dout_p;
    wire [7:0] dout_n;

    // Instantiate the SPI slave module
    control uut (
        .clk(clk),
        .rst(rst),
        .sck(sck),
        .mosi(mosi),
        .ss(ss),
        .miso(miso),
        .dout_p(dout_p),
        .dout_n(dout_n)
    );

    // Clock generation
    always #5 clk = ~clk;  // 100 MHz clock (10ns period)

    // Test sequence
    initial begin
        $dumpfile("control_tb.vcd");  // Name of the VCD file
        $dumpvars(0, control_tb);     // Dump all variables in the testbench
        // Initialize inputs
        clk = 0;
        rst = 1;
        ss = 1;
        mosi = 0;
        sck = 0;
        din = 8'h40;  // Example input data to be sent to the master

        // Apply reset
        #10 rst = 0;
        
        // Begin SPI transaction
        #10 ss = 0;  // Select slave by asserting ss low

        // Send data to SPI slave bit by bit on MOSI and generate SCK
        repeat(8) begin
            #10 mosi = din[7];  // Send MSB first
            din = din << 1;  // Shift left
            sck = 1;
            #10 sck = 0;
        end
        // Wait for done signal
        //wait(done == 1);
        
        #10 ss = 1;  // Deselect slave
        
        // Observe received data
      //  $display("Received data: %h", dout);

        // End of simulation
        #20 $finish;
    end

endmodule
