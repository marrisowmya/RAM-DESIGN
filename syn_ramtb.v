module syn_ramtb();
parameter data_width=8;
parameter data_addr = 4;

reg clk,rst,we;
reg [data_width-1:0]data_in;
reg [data_addr-1:0]addr;
wire [data_width-1:0]data_out;

syn_ram #(data_width,data_addr) DUT(clk,rst,we,data_in,addr,data_out);


 // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        we = 0;
        addr = 0;
        data_in = 0;

        #10 rst = 0; // Deassert reset
        
        // Random Write Operations
        repeat (5) begin
            #10 we = 1; addr = $random % (1 << data_addr); data_in = $random;
        end
        
        // Random Read Operations
        repeat (5) begin
            #10 we = 0; addr = $random % (1 << data_addr);
        end
        
        #20 $finish;
    end
    
    initial begin
        $monitor("Time = %0t | WE = %b | ADDR = %h | DATA_IN = %h | DATA_OUT = %h", 
                 $time, we, addr, data_in, data_out);
    end

endmodule
