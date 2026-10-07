module tt_um_proto_engine (
    rst_n,
    clk,
    ena,
    ui_in,
    uio_in,
    uo_out,
    uio_out,
    uio_oe
);

    input rst_n;
    input clk;
    input ena;
    input [7:0] ui_in;
    input [7:0] uio_in;
    output [7:0] uo_out;
    output [7:0] uio_out;
    output [7:0] uio_oe;

    wire [7:0] _9;
    wire vdd;
    wire _4;
    wire _12;
    wire _6;
    wire [7:0] _16;
    wire [7:0] _17;
    wire [7:0] _7;
    reg [7:0] _15;
    assign _9 = 8'b00000000;
    assign vdd = 1'b1;
    assign _4 = rst_n;
    assign _12 = ~ _4;
    assign _6 = clk;
    assign _16 = 8'b00000001;
    assign _17 = _15 + _16;
    assign _7 = _17;
    always @(posedge _6) begin
        if (_12)
            _15 <= _9;
        else
            _15 <= _7;
    end
    assign uo_out = _15;
    assign uio_out = _9;
    assign uio_oe = _9;

endmodule
