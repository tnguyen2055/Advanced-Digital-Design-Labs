// ECE 6370
// Author: Tru Nguyen - 1032
// Module name: testbench_AccessController
// Function: To observe signal waveforms and test the validity of the design of the Access Controller

`timescale 1 ns/100 ps

module testbench_AccessController();
  reg PwdButton, Load_P1_in, Load_P2_in, clk, reset;
  reg [3:0] PwdDigit;
  wire LoggedIn, LoggedOut, Load_P1_out, Load_P2_out, GoodUntilNow;
  
  always  // clock
    begin
      clk = 1'b0;
      #10;
      clk = 1'b1;
      #10;
    end

  AccessController DUT_AccessController(PwdButton, PwdDigit, Load_P1_in, Load_P2_in, clk, reset, LoggedIn, LoggedOut, Load_P1_out, Load_P2_out, GoodUntilNow);

  initial
    begin
      reset = 1'b1; // not pressed
      PwdButton = 1'b0; // signal from the shaper is active high when pressed
      Load_P1_in = 1'b0; // signal from the shaper is active high when pressed
      Load_P2_in = 1'b0; // signal from the shaper is active high when pressed
      
      @(posedge clk);
      @(posedge clk);
      #5 reset = 1'b0; // reset button is pressed
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      #5 reset = 1'b1; // release the reset button
      @(posedge clk);
      @(posedge clk);
      PwdDigit = 4'b0001;  // first digit is 1
      #5 
      PwdButton = 1'b1; // press pwd load button
      Load_P1_in = 1'b1; // press P1 number load button
      @(posedge clk);
      #5 
      PwdButton = 1'b0;  // release pwd load button
      Load_P1_in = 1'b0; // release P1 number load button
      @(posedge clk);
      @(posedge clk);
      PwdDigit = 4'b0000;  // second digit is 0
      #5 PwdButton = 1'b1;
      @(posedge clk);
      #5 PwdButton = 1'b0;
      @(posedge clk);
      #5 Load_P1_in = 1'b1; // press P1 number load button
      @(posedge clk);
      PwdDigit = 4'b0011; // third digit is 3
      #5 
      PwdButton = 1'b1;
      Load_P1_in = 1'b0; // release P1 number load button
      @(posedge clk);
      #5 
      PwdButton = 1'b0;
      Load_P2_in = 1'b1; // press P2 number load button
      @(posedge clk);
      #5 Load_P2_in = 1'b0; // release P2 number load button
      @(posedge clk);
      PwdDigit = 4'b0010; // last digit is 2
      #5 PwdButton = 1'b1;
      @(posedge clk);
      #5 PwdButton = 1'b0;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      #5 Load_P1_in = 1'b1;
      @(posedge clk);
      #5 Load_P1_in = 1'b0;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      #5 Load_P2_in = 1'b1;
      @(posedge clk);
      #5 Load_P2_in = 1'b0;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);

      #5 PwdButton = 1'b1;
      @(posedge clk);
      #5 PwdButton = 1'b0;

      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      PwdDigit = 4'b0001;  // first digit is 1
      #5 
      PwdButton = 1'b1; // press pwd load button
      Load_P1_in = 1'b1; // press P1 number load button
      @(posedge clk);
      #5 
      PwdButton = 1'b0;  // release pwd load button
      Load_P1_in = 1'b0; // release P1 number load button
      @(posedge clk);
      @(posedge clk);
      PwdDigit = 4'b0000;  // second digit is 0
      #5 PwdButton = 1'b1;
      @(posedge clk);
      #5 PwdButton = 1'b0;
      @(posedge clk);
      #5 Load_P1_in = 1'b1; // press P1 number load button
      @(posedge clk);
      PwdDigit = 4'b0011; // third digit is 3
      #5 
      PwdButton = 1'b1;
      Load_P1_in = 1'b0; // release P1 number load button
      @(posedge clk);
      #5 
      PwdButton = 1'b0;
      Load_P2_in = 1'b1; // press P2 number load button
      @(posedge clk);
      #5 Load_P2_in = 1'b0; // release P2 number load button
      @(posedge clk);
      PwdDigit = 4'b0010; // last digit is 2
      #5 PwdButton = 1'b1;
      @(posedge clk);
      #5 PwdButton = 1'b0;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      #5 Load_P1_in = 1'b1;
      @(posedge clk);
      #5 Load_P1_in = 1'b0;
      @(posedge clk);
      #5 Load_P2_in = 1'b1;
      @(posedge clk);
      #5 Load_P2_in = 1'b0;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);

      #5 reset = 1'b0; // press reset button again to test wrong password case
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      #5 reset = 1'b1; // release reset button
      @(posedge clk);
      @(posedge clk); 
      PwdDigit = 4'b0001;  // first digit is 1
      #5 
      PwdButton = 1'b1; // press pwd load button
      Load_P1_in = 1'b1; // press P1 number load button
      @(posedge clk);
      #5 
      PwdButton = 1'b0;  // release pwd load button
      Load_P1_in = 1'b0; // release P1 number load button
      @(posedge clk);
      @(posedge clk);
      PwdDigit = 4'b1000;  // second digit is 8
      #5 PwdButton = 1'b1;
      @(posedge clk);
      #5 PwdButton = 1'b0;
      @(posedge clk);
      @(posedge clk);
      PwdDigit = 4'b0111; // third digit is 7
      #5 
      PwdButton = 1'b1;
      Load_P2_in = 1'b1; // press P2 number load button
      @(posedge clk);
      #5 
      PwdButton = 1'b0;
      Load_P2_in = 1'b0; // release P2 number load button
      @(posedge clk);
      @(posedge clk);
      PwdDigit = 4'b0010; // last digit is 2
      #5 PwdButton = 1'b1;
      @(posedge clk);
      #5 PwdButton = 1'b0;
      @(posedge clk);
      @(posedge clk);
      @(posedge clk);
      #5 Load_P1_in = 1'b1;
      @(posedge clk);
      #5 Load_P1_in = 1'b0;
      @(posedge clk);
      #5 Load_P2_in = 1'b1;
      @(posedge clk);
      #5 Load_P2_in = 1'b0;
      @(posedge clk);
     
    end


endmodule