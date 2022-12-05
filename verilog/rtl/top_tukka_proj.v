module top_tukka_proj (
`ifdef USE_POWER_PINS
    inout vdd,		// User area 5.0V supply
    inout vss,		// User area ground
`endif
input    clk1,      // Clock 1 supposed to be faster
input    clk2,      // Clock 2  supposed to be slower
input    reset_n,   // System reset
input    sel_clk2,  // Select clock2 when high
//for SHA
// Control.
input wire cs,
input wire we,
// Data ports.
input wire  [7 : 0]  address,
input wire  [31 : 0] write_data,
output wire [31 : 0] read_data,
output wire error,
);
//output clock
wire clk1or2;    // Selected clock

//clock mux instintiated
clock_mux clock_mux0(
.clk1(clk1),     
.clk2(clk2),     
.reset_n(reset_n),  
.sel_clk2(sel_clk2), 
.clk1or2(clk1or2)   
);
//sha instintiated
sha256 dut(
.clk(clk1or2),
.reset_n(reset_n),
.cs(cs),
.we(we),
.address(address),
.write_data(write_data),
.read_data(read_data),
.error(error)
);

endmodule
