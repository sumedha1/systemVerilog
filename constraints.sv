// Unique Constraint
class A;
  rand bit[4:0] a[];
  
  constraint my_c {
    a.size() == 16;
    
    foreach (a[i]) {
      foreach (a[j]) {
        (i!=j) -> a[i] != a[j]; 
      }
    }
  }
endclass 
        
module tb;
  A aa;
  
  initial begin
    aa = new();
    repeat(5) begin
      aa.randomize();
      $display("%p",aa.a);
    end
  end
endmodule
