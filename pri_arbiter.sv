/// Priority Arbiter
/// 3 input 3 output
/// Priorities 0>1>2
/// req0 gets priority
///  ??1 -> 001
///  ?10 -> 010
///  100 -> 000
///  000 -> 000
/// Configurable Delay


module pri_arbiter#(DELAY=2) (
  input clk,
  input [2:0] req,
  output [2:0] gnt
);
  
  //reg[2:0] gnt_int;
  
  reg [DELAY:0]req0;
  reg [DELAY:0]req1;
  reg [DELAY:0]req2;
  
  initial begin
    req0 <= 'b000;
    req1 <= 'b000;
    req2 <= 'b000;
  end
  
  always @(posedge clk) begin
    casex (req)
      3'b??1 : begin
        //gnt_int <= 3'b001;
        req0 <= {req0[DELAY-1:0],1'b1};
        req1 <= {req1[DELAY-1:0],1'b0};
        req2 <= {req2[DELAY-1:0],1'b0};
      end
      3'b?10 : begin
        //gnt_int <= 3'b010;
        req0 <= {req0[DELAY-1:0],1'b0};
        req1 <= {req1[DELAY-1:0],1'b1};
        req2 <= {req2[DELAY-1:0],1'b0};
      end
      3'b100 : begin
        //gnt_int <= 3'b100;
        req0 <= {req0[DELAY-1:0],1'b0};
        req1 <= {req1[DELAY-1:0],1'b0};
        req2 <= {req2[DELAY-1:0],1'b1};
      end
      3'b000 : begin
        //gnt_int <= 3'b000;
        req0 <= {req0[DELAY-1:0],1'b0};
        req1 <= {req1[DELAY-1:0],1'b0};
        req2 <= {req2[DELAY-1:0],1'b0};
      end
    endcase
  end
  
  assign gnt = {req2[DELAY],req1[DELAY],req0[DELAY]};
 
endmodule
