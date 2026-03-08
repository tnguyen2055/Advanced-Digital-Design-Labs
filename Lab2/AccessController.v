// ECE 6370
// Author: Tru Nguyen - 1032
// Module name: AccessController
// Function: Implement a 4-digit password-based login system utilizing the 1-procedure FSM method

module AccessController(PwdButton, PwdDigit, Load_P1_in, Load_P2_in, clk, reset, LoggedIn, LoggedOut, Load_P1_out, Load_P2_out, GoodUntilNow);
  input PwdButton, Load_P1_in, Load_P2_in, clk, reset;
  input [3:0] PwdDigit;
  output LoggedIn, LoggedOut, Load_P1_out, Load_P2_out, GoodUntilNow;
  reg LoggedIn, LoggedOut, Load_P1_out, Load_P2_out, GoodUntilNow;
  parameter DIGIT1 = 0, DIGIT2 = 1, DIGIT3 = 2, DIGIT4 = 3, VERIFY = 4, PASSED = 5;
  reg [2:0] State;
 
  always @(posedge clk) begin
    if (reset == 1'b0) begin
      LoggedIn <= 1'b0;  
      LoggedOut <= 1'b1;
      Load_P1_out <= 1'b0;
      Load_P2_out <= 1'b0;
      GoodUntilNow <= 1'b1;
      State <= DIGIT1;
    end
    
    else begin
      case(State)
	DIGIT1: begin
          LoggedIn <= 1'b0;  
          LoggedOut <= 1'b1;
          Load_P1_out <= 1'b0;
          Load_P2_out <= 1'b0;
          GoodUntilNow <= 1'b1;
         
          if (PwdButton == 1'b1) begin
            if (PwdDigit == 4'b0001) begin       // check if first digit is 1 (last 4 digits of ID = 1032)
               // correct digit
	       // DO NOT TOUCH GoodUntilNow
	    end
	    else begin
	      GoodUntilNow <= 1'b0; // wrong digit
   	    end
            State <= DIGIT2;
	  end
	  else begin
	    State <= DIGIT1;
	  end
         
        end
      
        DIGIT2: begin
	  LoggedIn <= 1'b0;  
          LoggedOut <= 1'b1;
          Load_P1_out <= 1'b0;
          Load_P2_out <= 1'b0;
          
	  if (PwdButton == 1'b1) begin
            if (PwdDigit == 4'b0000) begin       // check if second digit is 0 (last 4 digits of ID = 1032)
              // correct digit
	        // DO NOT TOUCH GoodUntilNow
	    end   
	    else begin
	      GoodUntilNow <= 1'b0; // wrong digit
            end
            State <= DIGIT3;
	  end
	  else begin
	    State <= DIGIT2;
	  end
	  
        end    

        DIGIT3: begin
	  LoggedIn <= 1'b0;  
          LoggedOut <= 1'b1;
          Load_P1_out <= 1'b0;
          Load_P2_out <= 1'b0;
          
	  if (PwdButton == 1'b1) begin
            if (PwdDigit == 4'b0011) begin       // check if third digit is 3 (last 4 digits of ID = 1032)
               // correct digit
	        // DO NOT TOUCH GoodUntilNow
	    end   
	    else begin
	      GoodUntilNow <= 1'b0; // wrong digit
            end
            State <= DIGIT4;
	  end
	  else begin
	    State <= DIGIT3;
	  end
	  
        end    

        DIGIT4: begin
	  LoggedIn <= 1'b0;  
          LoggedOut <= 1'b1;
          Load_P1_out <= 1'b0;
          Load_P2_out <= 1'b0;
          
	  if (PwdButton == 1'b1) begin
            if (PwdDigit == 4'b0010) begin       // check if last digit is 2 (last 4 digits of ID = 1032)
               // correct digit
	        // DO NOT TOUCH GoodUntilNow
	    end   
	    else begin
	      GoodUntilNow <= 1'b0; // wrong digit
            end
            State <= VERIFY;
	  end
	  else begin
	    State <= DIGIT4;
	  end
	  
        end    

        VERIFY: begin
	  LoggedIn <= 1'b0;  
          LoggedOut <= 1'b1;
          Load_P1_out <= 1'b0;
          Load_P2_out <= 1'b0;
          
	  if (GoodUntilNow == 1'b1) begin
            State <= PASSED; // all four digits are correct
	  end
	  else begin
	    State <= DIGIT1; // at least one digit is wrong, reset the password entry
	  end
	  
        end    

        PASSED: begin // light up LoggedIn LED and turn on load signals' permission
	  if (PwdButton == 1'b1) begin
	    State <= DIGIT1;  // log out function
	  end
	  else begin	  	
	    LoggedIn <= 1'b1;  
            LoggedOut <= 1'b0;
            Load_P1_out <= Load_P1_in;
            Load_P2_out <= Load_P2_in;  
	  end
        
	end    

	default: begin // DIGIT1 state
	  LoggedIn <= 1'b0;  
          LoggedOut <= 1'b1;
          Load_P1_out <= 1'b0;
          Load_P2_out <= 1'b0;
          GoodUntilNow <= 1'b1;
         
          if (PwdButton == 1'b1) begin
            if (PwdDigit == 4'b0001) begin      // check if first digit is 1 (last 4 digits of ID = 1032)
               // correct digit
	        // DO NOT TOUCH GoodUntilNow
	    end   
	    else begin
	      GoodUntilNow <= 1'b0; // wrong digit
            end
            State <= DIGIT2;
	  end
	  else begin
	    State <= DIGIT1;
	  end
         
        end

      endcase   
    end


  end 

endmodule