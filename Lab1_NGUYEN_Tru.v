// ECE 6370
// Author: Tru Nguyen, 1032
// Module: A design of a 7-segment decoder
// This module takes one 4-bit binary input signal decoder_in and produces a 7-bit output signal decoder_out that
// displays the corresponding input value in hexadecimal on the FPGA

module Lab1_NGUYEN_Tru(P1Num, P2Num, decoder_out_1, decoder_out_2, decoder_out_sum, M_LED_top, NM_LED_top);
    input [3:0] P1Num, P2Num;
    output [6:0] decoder_out_1, decoder_out_2, decoder_out_sum;
    output M_LED_top, NM_LED_top;
    wire [3:0] Sum; 
    wire M_LED, NM_LED;
	 
    SevenSegDecoder P1_Decoder (P1Num, decoder_out_1);
    SevenSegDecoder P2_Decoder (P2Num, decoder_out_2);
    SevenSegDecoder Sum_Decoder (Sum, decoder_out_sum);

    FourBitAdder FourBit_Adder (P1Num, P2Num, Sum);
    
	 LED_OnOff LED_Check (Sum, M_LED, NM_LED);
	 
	 assign M_LED_top = M_LED;
	 assign NM_LED_top = NM_LED;
    
endmodule