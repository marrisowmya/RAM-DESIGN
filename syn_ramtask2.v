module syn_ram #(parameter DATA_WIDTH = 8, parameter ADDR_WIDTH = 4) (
    input clk, rst, we,
    input [DATA_WIDTH-1:0] data_in,
    input [ADDR_WIDTH-1:0] addr,
    output reg [DATA_WIDTH-1:0] data_out
);

    // Define memory with 2^ADDR_WIDTH locations
    reg [DATA_WIDTH-1:0] mem [0:(1 << ADDR_WIDTH) - 1];
integer i;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
           
            for (i = 0; i < (1 << ADDR_WIDTH); i = i + 1)
                mem[i] <= 0; // Reset memory
            data_out <= 0;
        end else begin
            if (we) begin
                mem[addr] <= data_in; // Write operation
            end
            data_out <= mem[addr]; // Read operation
        end
    end

endmodule

