// Two Implementations of round
// robin arbiter with a variable delay
// arb1 is a more verbose implementation

module rr_arbiter1 (
  input clk,
  input [2:0] req,
  output [2:0] gnt
);
  reg [2:0] gnt_int;
  
  assign gnt = gnt_int;
  
  initial begin
    gnt_int = 3'b0;
  end
  always @(posedge clk) begin
    if (gnt[0]) begin
      if (req[1]) gnt_int <= 3'b010;
      else if (req[2]) gnt_int <= 3'b100;
      else if (req[0]) gnt_int <= 3'b001;
      else gnt_int <= 3'b000;
    end
    
    else if (gnt[1]) begin
      if (req[2]) gnt_int <= 3'b100;
      else if (req[0]) gnt_int <= 3'b001;
      else if (req[1]) gnt_int <= 3'b010;
      else gnt_int <= 3'b000;
    end
    
    else  begin
      if (req[0]) gnt_int <= 3'b001;
      else if (req[1]) gnt_int <= 3'b010;
      else if (req[2]) gnt_int <= 3'b100;
      else gnt_int <= 3'b000;
    end
    
  end
  
endmodule

module rr_arbiter2#(DELAY=2) (
  input clk,
  input [2:0] req,
  output [2:0] gnt
);
  reg [2:0] gnt_int;
  
  reg [DELAY:0]req0;
  reg [DELAY:0]req1;
  reg [DELAY:0]req2;
  
  
  assign gnt = {req2[DELAY],req1[DELAY],req0[DELAY]};
  
  initial begin
    gnt_int = 3'b0;
    req0 <= 'b000;
    req1 <= 'b000;
    req2 <= 'b000;
  end
  
  
  
  always @(posedge clk) begin
    casex ({gnt_int,req})
      6'bxxx_000: gnt_int <= 3'b000;
      
      6'bx00_??1: gnt_int <= 3'b001;
      6'bx00_?10: gnt_int <= 3'b010;
      6'bx00_100: gnt_int <= 3'b100;
      
      6'b001_001: gnt_int <= 3'b001;
      6'b001_?1?: gnt_int <= 3'b010;
      6'b001_10?: gnt_int <= 3'b100;
      
      6'b010_0?1: gnt_int <= 3'b001;
      6'b010_010: gnt_int <= 3'b010;
      6'b010_1??: gnt_int <= 3'b100;
      
    endcase  
  end
  
  always @(gnt_int) begin
    case (gnt_int)
      3'b001: begin
        req0 = {req0[DELAY-1:0],1'b1};
        req1 = {req1[DELAY-1:0],1'b0};
        req2 = {req2[DELAY-1:0],1'b0};
      end
      3'b010: begin
        req0 = {req0[DELAY-1:0],1'b0};
        req1 = {req1[DELAY-1:0],1'b1};
        req2 = {req2[DELAY-1:0],1'b0};
      end
      3'b100: begin
        req0 = {req0[DELAY-1:0],1'b0};
        req1 = {req1[DELAY-1:0],1'b0};
        req2 = {req2[DELAY-1:0],1'b1};
      end
      3'b000: begin
        req0 = {req0[DELAY-1:0],1'b0};
        req1 = {req1[DELAY-1:0],1'b0};
        req2 = {req2[DELAY-1:0],1'b0};
      end
    endcase
  end
  
endmodule
