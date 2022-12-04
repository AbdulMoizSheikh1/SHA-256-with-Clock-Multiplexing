//
// Switch between two clock sources testbench.
//

// 
// Design by G.J. van Loo, FenLogic Ltd, 15-January-2017.
// 
// This program is free software. It comes without any guarantees or
// warranty to the extent permitted by applicable law. Although the
// author has attempted to find and correct any bugs in this free software
// program, the author is not responsible for any damage or losses of any
// kind caused by the use or misuse of the program. You can redistribute
// the program and or modify it in any form without obligations, but the
// author would appreciated if the credits stays in.
// 
module clock_mux_test;

// For specify to work CLK1PERIOD must be <= CLK2PERIOD !!
localparam CLK1PERIOD = 8,
           CLK2PERIOD = 10;

reg    clk1;      // Clock 1
reg    clk2;      // Clock 2
reg    reset_n;   // System reset
reg    sel_clk2;  // Select clock2 when high
wire   clk1or2;   // Selected clock

integer l,r1,r2;

initial
begin
   sel_clk2 = 1'b0;
   reset_n  = 1'b0;
   #50;
   reset_n  = 1'b1;
   #250;
   sel_clk2 = 1'b1;
   #250;
   sel_clk2 = 1'b0;
   #1000;

   // Test reset release with sel2 high
   reset_n  = 1'b0;
   #50;
   sel_clk2 = 1'b1;
   #50;
   reset_n  = 1'b1;
   #250;
   // Test reset release and sel2 high at the same time
   reset_n  = 1'b0;
   #50;
   sel_clk2 = 1'b1;
   reset_n  = 1'b1;
   #250;
   
   #1000;
   
      
   //
   // Test clock not present
   //
   force clk2 = 1'b0;
   #250;
   // switch to not running clk2
   sel_clk2 = 1'b1;
   #250;
   // switch back to clk1 
   sel_clk2 = 1'b0;
   #250;
   // switch to not running clk2
   sel_clk2 = 1'b1;
   #250;
   // now clock2 comes on again
   // whilst it is selected 
   release clk2;
   #250;
   // switch back to clk1 
   sel_clk2 = 1'b0;
   #250;
      
   // Switch often but never faster then 2xslowest input clock period
   for (l=0; l<10000; l=l+1)
   begin
      r1 = (($random>>3)&32'h1F)+2*CLK2PERIOD;
      r2 = (($random>>4)&32'h1F)+2*CLK2PERIOD;
      sel_clk2 = 1'b1;
      #r1;
      sel_clk2 = 1'b0;
      #r2;
   end
   #1000;
   
   // Really nasty and illegal clock switching.
   // Causes low period violations.
	// This gives more confidence that the testbench seems to work.
   $display("@%0t Illegal 'sel_clk2' pattern hereafter",$time);
   $display("      gives rise to low period violations.");
   $display("      Ignore all warnings from here.");   
   for (l=0; l<500; l=l+1)
   begin
      r1 = ($random>>3)&32'h1F+CLK2PERIOD;
      r2 = ($random>>4)&32'h1F+CLK2PERIOD;
      sel_clk2 = 1'b1;
      #r1;
      sel_clk2 = 1'b0;
      #r2;
   end
   $stop;
end

initial
begin
   clk1 = 1'b0;
   forever
      #(CLK1PERIOD/2) clk1 <= ~clk1;
end

initial
begin
   clk2 = 1'b0;
   forever
      #(CLK2PERIOD/2) clk2 <= ~clk2;
end

clock_mux clock_mux0 
   (
   .clk1    (clk1),     // Clock 1
   .clk2    (clk2),     // Clock 2
   .reset_n (reset_n),  // System reset
   .sel_clk2(sel_clk2), // Select clock2 when high
   .clk1or2 (clk1or2)   // Selected clock
   );

// Now check if time high or low is ever smaller than CLK1PERIOD/2
// (This is why CLK1PERIOD <= CLK2PERIOD)
specify
$width(posedge clk1or2, CLK1PERIOD/2);
$width(negedge clk1or2, CLK1PERIOD/2);
endspecify

endmodule // clock_mux_test

