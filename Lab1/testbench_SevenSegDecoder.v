`timescale 1 ns/100 ps
module testbench_SevenSegDecoder();

    reg [3:0] decoder_in_s;
    wire [6:0] decoder_out_s;
    
    SevenSegDecoder DUT_SevenSegDecoder(decoder_in_s, decoder_out_s);

    initial
      begin
	decoder_in_s = 4'b0000;
	#10 decoder_in_s = 4'b0001;
	#10 decoder_in_s = 4'b0010;
	#10 decoder_in_s = 4'b0011;
	#10 decoder_in_s = 4'b0100;
	#10 decoder_in_s = 4'b0101;
	#10 decoder_in_s = 4'b0110;
	#10 decoder_in_s = 4'b0111;
	#10 decoder_in_s = 4'b1000;
	#10 decoder_in_s = 4'b1001;
	#10 decoder_in_s = 4'b1010;
	#10 decoder_in_s = 4'b1011;
	#10 decoder_in_s = 4'b1100;	
	#10 decoder_in_s = 4'b1101;
	#10 decoder_in_s = 4'b1110;
	#10 decoder_in_s = 4'b1111;
      end

endmodule

