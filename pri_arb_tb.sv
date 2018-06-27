// Testbench code for basic stimulus
// ALso hase SVAs to validate design corrrectness 

module tb;

  logic clk;
  logic [2:0] req, gnt;
  
  defparam arb.DELAY = 5;
  
  pri_arbiter arb(.*);
  
  bind arb arb_sva#(.DELAY(DELAY)) arbp(.*);
  
  always #2ns clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    clk = 0;req=3'b000;
    @(posedge clk);
    req = 3'b001;
    @(posedge clk);
    req = 3'b010;
    @(posedge clk);
    req = 3'b000;
    @(posedge clk);
    req = 3'b000;
    @(posedge clk);
    req = 3'b111;
    #50ns;
    $finish;
  end
endmodule

module arb_sva #(DELAY=2) (
  input clk,
  input [2:0] req,
  input [2:0] gnt
);
  
  property arb_check;
    @(posedge clk) $changed(req) |->
    if (req[0]) ##(DELAY) gnt[0]
      else if (req[1]&&!req[0]) ##(DELAY) gnt[1]
        else if (req[2]&&!req[1]&&!req[0]) ##(DELAY) gnt[2]
          else ##(DELAY) (gnt==0);
   
  endproperty
  
  assert property (@(posedge clk) $onehot0(gnt));
    
  assert property (arb_check);
endmodule
