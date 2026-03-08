// ECE 6370
// Author: Tru Nguyen
// Module name: testbench_ButtonShaper
// Function: a testbench to observe waveforms and verify the design of ButtonShaper module

`timescale 1 ns/100 ps

module testbench_ButtonShaper();
  reg B_in, clk, reset;
  wire B_out;

  always                // artificial clk
    begin
      clk = 1'b0;
      #10;
      clk = 1'b1;
      #10; // every cycle is 20ns long: 10ns high & 10ns low
    end

  ButtonShaper DUT_ButtonShaper(B_in, B_out, clk, reset);
  
  initial
    begin
    B_in = 1'b1; // button is not pressed initially 
    reset = 1'b1; // reset button is not pressed
    
    @(posedge clk);
    @(posedge clk);
    #5 reset = 1'b0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    #5 reset = 1'b1;
    @(posedge clk);
    @(posedge clk);
    #5 B_in = 1'b0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    #5 B_in = 1'b1;
    
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    #5 reset = 1'b0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    #5 reset = 1'b1;
    @(posedge clk);
    @(posedge clk);
    #5 B_in = 1'b0;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    #5 B_in = 1'b1;
    
    

end

endmodule
