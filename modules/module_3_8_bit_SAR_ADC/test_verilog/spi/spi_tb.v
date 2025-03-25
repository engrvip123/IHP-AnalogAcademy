`timescale 1ns/1ps

module spi_tb();

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
    wire [7:0] dout;

    // Instantiate the SPI slave module
    spi uut (
        .clk(clk),
        .rst(rst),
        .ss(ss),
        .mosi(mosi),
        .miso(miso),
        .sck(sck),
        .done(done),
        .din(din),
        .dout(dout)
    );

    // Clock generation
    always #5 clk = ~clk;  // 100 MHz clock (10ns period)

    // Test sequence
    initial begin
        $dumpfile("spi_tb.vcd");  // Name of the VCD file
        $dumpvars(0, spi_tb);     // Dump all variables in the testbench
        // Initialize inputs
        clk = 0;
        rst = 1;
        ss = 1;
        mosi = 0;
        sck = 0;
        din = 8'hA5;  // Example input data to be sent to the master

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
        wait(done == 1);
        
        #10 ss = 1;  // Deselect slave
        
        // Observe received data
        $display("Received data: %h", dout);

        // End of simulation
        #20 $finish;
    end

endmodule
