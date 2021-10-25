module clkgen#(parameter div=3) (input clk, output clk_out);
  logic[3:0] count;
  logic clk_out;
  
  always @(posedge clk) begin 
    if(count==div-1)count=0;
    else count=count+1;
  end 
  
  always @(negedge clk) begin 
    if(count==div-1)count=0;
    else count=count+1;
  end 
  
  always @(count) begin 
    if(count==div-1) clk_out=~clk_out;
  end 
  
  initial begin 
    clk_out=0;
    count=0;
  end 
endmodule 
