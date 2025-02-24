//Verilog HDL for "8_bit_SAR_ADC", "sar_algorithm" "functional"

module sar_algorithm (
    input wire Op,
    input wire En,
    input wire Om,
    input wire clk,
    input wire rst,
    output reg [7:0] B,   // 8-bit
    output reg [7:0] BN,  // 8-bit
    output reg [7:0] D    // 8-bit
);

reg [2:0] counter = 3'b000; // 3-bit counter

always @(posedge clk) begin
    if (En && !rst && (Op ^ Om)) begin
        if (counter != 3'b111) begin  // Limit to 8
            D[counter] <= Op;

            if (Op) begin
                B[counter] <= 1'b1;
                BN[counter] <= 1'b0;
            end else if (Om) begin
                B[counter] <= 1'b0;
                BN[counter] <= 1'b1;
            end

            counter <= counter + 1'b1;
        end
    end else if (rst) begin
        B <= 8'b00000000;
        BN <= 8'b00000000;
        D <= 8'b00000000;
        counter <= 3'b000;
    end
end

endmodule
