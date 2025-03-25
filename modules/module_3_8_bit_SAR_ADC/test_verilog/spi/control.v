
module control(
    input clk,
    input rst,
    input sck,
    input mosi,
    input ss,
    output miso,
    output [7:0] dout_p,
    output [7:0] dout_n
  );

    reg [7:0] in_reg;
    wire [7:0] dout;
    wire done;

    assign dout_p = dout;
    assign dout_n = ~dout;


    // Instantiate the SPI slave module
    spi uut (
        .clk(clk),
        .rst(rst),
        .ss(ss),
        .mosi(mosi),
        .miso(miso),
        .sck(sck),
        .done(done),
        .din(in_reg),
        .dout(dout)
    );

endmodule

