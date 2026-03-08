// ECE 6370
// Author: Tru Nguyen
// Module name: Lab2_NGUYEN_Tru
// Function: it is the top-level  module of the design. It connects all submodules to implement a 4-bit adder system with authentication feature.

module Lab2_NGUYEN_Tru(P1Num, P2Num, B_in_1, B_in_2, B_in_Pwd, clk, reset, decoder_out_1, decoder_out_2, decoder_out_sum, M_LED_top, NM_LED_top, LoggedIn, LoggedOut);
  
  input [3:0] P1Num, P2Num;
  input B_in_1, B_in_2, B_in_Pwd, reset, clk;
  output [6:0] decoder_out_1, decoder_out_2, decoder_out_sum;
  output M_LED_top, NM_LED_top, LoggedIn, LoggedOut;
  wire [3:0] Sum, P1_LR_out, P2_LR_out;
  wire PwdButton, Load_P1_in, Load_P2_in, Load_P1_out, Load_P2_out;  

  SevenSegDecoder P1_Decoder (P1_LR_out, decoder_out_1);
  SevenSegDecoder P2_Decoder (P2_LR_out, decoder_out_2);
  SevenSegDecoder Sum_Decoder (Sum, decoder_out_sum);

  FourBitAdder FourBit_Adder (P1_LR_out, P2_LR_out, Sum);
    
  LED_OnOff LED_Check (Sum, M_LED_top, NM_LED_top);

  ButtonShaper P1_ButtonShaper (B_in_1, Load_P1_in, clk, reset);
  ButtonShaper P2_ButtonShaper (B_in_2, Load_P2_in, clk, reset);
  ButtonShaper PwdButton_BS (B_in_Pwd, PwdButton, clk, reset);

  LoadRegister P1_LoadReg (P1Num, P1_LR_out, clk, reset, Load_P1_out);
  LoadRegister P2_LoadReg (P2Num, P2_LR_out, clk, reset, Load_P2_out);
  
  AccessController Access_Controller (PwdButton, P2Num, Load_P1_in, Load_P2_in, clk, reset, LoggedIn, LoggedOut, Load_P1_out, Load_P2_out);
    

endmodule
