module advanced_memory_controller #(
    parameter ADDR_WIDTH = 6,
    parameter DATA_WIDTH = 32,
    parameter DEPTH      = 64
)(
    input  wire                  clk,
    input  wire                  rst,

    input  wire                  write_en,
    input  wire                  read_en,
    input  wire [ADDR_WIDTH-1:0] addr,
    input  wire [DATA_WIDTH-1:0] write_data,

    output reg  [DATA_WIDTH-1:0] read_data,
    output reg                   read_valid,
    output reg                   busy
);

    reg [DATA_WIDTH-1:0] memory [0:DEPTH-1];

    always @(posedge clk) begin
        if (rst) begin
            read_data  <= {DATA_WIDTH{1'b0}};
            read_valid <= 1'b0;
            busy       <= 1'b0;
        end
        else begin
            read_valid <= 1'b0;
            busy       <= 1'b0;

            if (write_en) begin
                memory[addr] <= write_data;
                busy <= 1'b1;
            end

            if (read_en) begin
                read_data  <= memory[addr];
                read_valid <= 1'b1;
                busy       <= 1'b1;
            end
        end
    end

endmodule