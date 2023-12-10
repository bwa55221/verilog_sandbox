module tb_dff;
    reg clk;
    reg d;
    reg rstn;
    reg [2:0] delay;

// instantiate dff
    dff dff0 (  .d(d),
                .rstn(rstn),
                .clk (clk),
                .q (q));

// generate clock
    always #10ns clk = ~clk;

// test case
    initial begin
        clk <= 0;
        d <= 0;
        rstn <= 0;

        #15 d <= 1;
        #10 rstn <= 1;

        for (int i = 0; i < 5; i=i+1) begin
            delay = $random;
            #(delay) d <= i;
        end
    // $finish(2); // fuck this kills the simulator
    $stop(2);
    end

endmodule