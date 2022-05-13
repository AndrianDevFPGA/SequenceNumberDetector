/*
  Author : Rakotojaona Nambinina
  email : Andrianoelisoa.Rakotojaona@gmail.com
  Description : Sequence number detector (Detect "110")
*/

module sequenceDetector(
                        clk,
                        rst,
                        seq_in,
                        det_out 
                        );
  input clk; 
  input rst; 
  input seq_in; 
  output reg det_out; 
  
  // state machine
  
  integer state ;
  
  always @ (posedge clk)
    begin
      if (rst)
        begin
          det_out <=0;
          state <= 0;
        end
      else
        begin
          case (state)
            0:
              begin
                if (seq_in)
                  begin
                    state <=1;
                  end 
              end
            1:
              begin
                if (seq_in)
                  begin
                    state <=2;
                  end 
              end
            2:
              begin
                if (!seq_in)
                  begin
                    state <= 3;
                  end 
              end 
            3:
              begin
                if (!seq_in)
                  begin
                    state <= 0;
                  end 
              end  
               
          endcase
        end
    end
  always @ (negedge clk)
    begin
      case (state)
        0:
          begin 
            det_out <= 0;
          end
        1:
          begin
            det_out <= 0;
          end 
        2:
          begin
            det_out <=0;
          end
        3:
          begin
            det_out <=1;
          end 
      endcase
    end  
endmodule

/*

module tb_test1(

    );
    
  reg clk; 
  reg rst; 
  reg seq_in; 
  wire  det_out; 
    
   sequenceDetector uut(
                        clk,
                        rst,
                        seq_in,
                        det_out 
                        );
  initial 
    begin
      clk = 0;
      rst =1;
      seq_in =0;
      #10 
      rst =0;
      #30 
      seq_in  =1;
      #30
      seq_in  =0;

    end 
    
  always 
    begin
      #5 clk = ! clk;
    end 
endmodule

*/
