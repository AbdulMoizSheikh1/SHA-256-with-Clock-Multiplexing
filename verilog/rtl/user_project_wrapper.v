// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

module user_project_wrapper #(
    parameter BITS = 32
)(
`ifdef USE_POWER_PINS
    inout vdd,		// User area 5.0V supply
    inout vss,		// User area ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [63:0] la_data_in,
    output [63:0] la_data_out,
    input  [63:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Independent clock (on independent integer divider)
    input   user_clock2,

    // User maskable interrupt signals
    output [2:0] user_irq
);

/*--------------------------------------*/
/* User project is instantiated  here   */
/*--------------------------------------*/

top_tukka_proj mprj (
`ifdef USE_POWER_PINS
	.vdd(vdd),	// User area 1 1.8V power
	.vss(vss),	// User area 1 digital ground
`endif

    .clk1(wb_clk_i),
    .clk2(user_clock2),
    .reset_n(wb_rst_i),
    .sel_clk2(io_in[4]),
    .cs(wbs_stb_i),
    .we(wbs_we_i),
    .address(wbs_adr_i[23:16]),
    .write_data(wbs_dat_i),
    .read_data(wbs_dat_o),
    .error(wbs_ack_o)
);

endmodule	// user_project_wrapper

/*module top_tukka_proj (
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
endmodule*/

`default_nettype wire
