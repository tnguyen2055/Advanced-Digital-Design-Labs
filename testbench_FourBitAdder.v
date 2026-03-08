`timescale 1 ns/100 ps

module testbench_FourBitAdder();
  
  reg [3:0] P1Num_s, P2Num_s;
  wire [3:0] Sum_s;

  FourBitAdder DUT_FourBitAdder(P1Num_s, P2Num_s, Sum_s);
  
  initial
    begin
      P1Num_s = 4'b1010; P2Num_s = 4'b0101;  // matching case: 10+5=15   
      #10 P1Num_s = 4'hC; P2Num_s = 4'h1; // non-matching case: 12+1=13
      #10 P1Num_s = 4'd11; P2Num_s = 4'd6; // overflow: 11+6=17 -> (1) 0001


    end
endmodule

