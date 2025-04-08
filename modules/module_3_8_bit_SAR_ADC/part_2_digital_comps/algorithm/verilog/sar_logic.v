module sar_logic (
    input wire clk, 
    input wire Op,
    input wire En,
    input wire Om,
    input wire rst,
    output reg [6:0] B,   // 7-bit
    output reg [6:0] BN,  // 7-bit
    output reg [7:0] D    // 8-bit
);

reg [3:0] counter = 4'b0000; // 4-bit counter

always @(posedge clk) begin
    if (rst) begin
        B <= 7'b0000000;
        BN <= 7'b0000000;
        D <= 8'b00000000;
        counter <= 4'b0000;
    end else if (En && (Op ^ Om)) begin
        if (counter < 7) begin 
            D <= D | ({7'b0, Op} << counter);
              
            B[counter % 7] <= (Op) ? 1'b1 : 1'b0;
            BN[counter % 7] <= (Om) ? 1'b1 : 1'b0;

            counter <= counter + 1'b1;
        end
    end
end

endmodule

