`timescale 1ns / 1ps

module user_module_341271902949474898_tb;
    wire [7:0] io_in;
    wire [7:0] io_out;

    reg clk, rst, write_en;
    reg [1:0] mux_sel;
    reg [2:0] dummy;

    assign io_in = {dummy, mux_sel, write_en, rst, clk};

    wire valid;
    wire [5:0] result;
    wire dummy2;

    assign {result, dummy2, valid} = io_out;

    user_module_341271902949474898 UUT (.io_in(io_in), .io_out(io_out));

    initial begin
        $dumpfile("user_module_341271902949474898_tb.vcd");
        $dumpvars(0, user_module_341271902949474898_tb);
    end

    initial begin
	#(TCLK*1200); // Wait a long time in simulation units (adjust as needed).
        $display("Caught by trap");
        $finish;
    end

    parameter CLK_HALF_PERIOD = 5;
    parameter TCLK = 2*CLK_HALF_PERIOD;
    always begin
        clk = 1'b1;
        #(CLK_HALF_PERIOD);
        clk = 1'b0;
        #(CLK_HALF_PERIOD);
    end

    integer i, j, r;
    initial begin
        mux_sel = 2'd0;

        #(CLK_HALF_PERIOD);

        rst = 1;
        #(TCLK);
        rst = 0;

        for (i = 0; i < 2; i += 1) begin
            for (j = 0; j < 600; j += 1) begin
                if (valid == 1)
                begin
                    $display("valid at cycle #%0d", i);
                    j = 600; /* break */
                end
                #(TCLK);
            end

            if (i == 0)
            begin
                $display("reset again!");
                rst = 1;
                #(TCLK);
                rst = 0;
            end

        end

        r = result;
        mux_sel = 2'd1;
        #(TCLK);
        r |= (result<<6);
        mux_sel = 2'd2;
        #(TCLK);
        r |= (result<<12);
        $display("result: %0d", r);

        $finish;
    end

endmodule
