// ECE 6370
// Author: Tru Nguyen
// Module name: testbench_LoadRegister
// Function: a testbench to observe signal waveforms and verify the design of LoadRegister module

`timescale 1 ns/100 ps

module testbench_LoadRegister();
  reg clk, reset, Load;
  reg [3:0] D_in;
  wire [3:0] D_out;

  always                // artificial clk
    begin
      clk = 1'b0;
      #10;
      clk = 1'b1;
      #10; // every cycle is 20ns long: 10ns high & 10ns low
    end

  LoadRegister DUT_LoadRegister(D_in, D_out, clk, reset, Load);

  initial
    begin
      reset = 1'b1;  // button is not pressed at begin (reset = 0 means pressed; reset = 1 means not pressed)
      Load = 1'b0;
      D_in = 4'b0000;

      @(posedge clk);  // skip the first clk rising edge
      @(posedge clk);  // skip the second clk rising edge
      #5 reset = 1'b0; // pull reset low 5 ns after the second clk rising edge/button pressed
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      #5 reset = 1'b1; // pull reset high after 4 and a half clk rising edge/button released
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      D_in = 4'b1010;      
      @(posedge clk);
      Load = 1'b1;  // pull Load high meaning D_out is rdy for data in D_in to be loaded in
      @(posedge clk);
      Load = 1'b0;  // pull Load low after 1 clk rising edge
      @(posedge clk);
      D_in = 4'b0110;
      @(posedge clk);
      @(posedge clk);
      D_in = 4'b1110;
      Load = 1'b1;
      @(posedge clk);
      Load = 1'b0;
      @(posedge clk);
    end  
    
endmodule

