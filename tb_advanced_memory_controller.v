`timescale 1ns/1ps

module tb_advanced_memory_controller;

    parameter ADDR_WIDTH = 6;
    parameter DATA_WIDTH = 32;
    parameter DEPTH      = 64;

    reg                   clk;
    reg                   rst;
    reg                   write_en;
    reg                   read_en;
    reg  [ADDR_WIDTH-1:0] addr;
    reg  [DATA_WIDTH-1:0] write_data;

    wire [DATA_WIDTH-1:0] read_data;
    wire                  read_valid;
    wire                  busy;

    advanced_memory_controller #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH),
        .DEPTH(DEPTH)
    ) dut (
        .clk(clk),
        .rst(rst),
        .write_en(write_en),
        .read_en(read_en),
        .addr(addr),
        .write_data(write_data),
        .read_data(read_data),
        .read_valid(read_valid),
        .busy(busy)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("sim/advanced_memory_controller.vcd");
        $dumpvars(0, tb_advanced_memory_controller);
    end

    initial begin

        clk        = 1'b0;
        rst        = 1'b1;
        write_en   = 1'b0;
        read_en    = 1'b0;
        addr       = 6'd0;
        write_data = 32'd0;

        #20;
        rst = 1'b0;

        // WRITE 1
        @(negedge clk);
        addr       = 6'd10;
        write_data = 32'hDEADBEEF;
        write_en   = 1'b1;

        @(negedge clk);
        write_en = 1'b0;

        // READ 1
        @(negedge clk);
        addr    = 6'd10;
        read_en = 1'b1;

        @(negedge clk);
        read_en = 1'b0;

        @(posedge clk);

        $display("READ 1");
        $display("Address = %d", addr);
        $display("Data    = %h", read_data);

        if (read_data == 32'hDEADBEEF)
            $display("READ 1 TEST: PASS");
        else
            $display("READ 1 TEST: FAIL");

        // WRITE 2
        @(negedge clk);
        addr       = 6'd25;
        write_data = 32'h12345678;
        write_en   = 1'b1;

        @(negedge clk);
        write_en = 1'b0;

        // READ 2
        @(negedge clk);
        addr    = 6'd25;
        read_en = 1'b1;

        @(negedge clk);
        read_en = 1'b0;

        @(posedge clk);

        $display("READ 2");
        $display("Address = %d", addr);
        $display("Data    = %h", read_data);

        if (read_data == 32'h12345678)
            $display("READ 2 TEST: PASS");
        else
            $display("READ 2 TEST: FAIL");

        #20;

        $display("==========================================");
        $display("Advanced Memory Controller Test Complete");
        $display("==========================================");

        $finish;

    end

endmodule