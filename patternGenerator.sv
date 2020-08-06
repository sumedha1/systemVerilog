class patternGen;
  bit[3:0] pattern;
  int maxNum;
  
  rand int count[29];
  
  rand bit[31:0] a;
  rand int Num;
  
  constraint size_c {
    Num == maxNum;
  }
  constraint pattern_c {
    (count.sum() with (int'(a[item.index+:4]==pattern))) == Num;
    
    solve Num before a;
  }
  
endclass

module tb;
  initial begin
    patternGen pg;
    pg = new();
    pg.pattern = 4'b1001;
    pg.maxNum = 4;
    pg.randomize();
    pg.randomize();
    $display("%b", pg.a);
   
  end 
endmodule 
