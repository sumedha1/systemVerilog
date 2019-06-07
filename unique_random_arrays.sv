// Code your testbench here
// or browse Examples
class random_arrays;
  rand bit[3:0] a[6];
  rand bit[3:0] b[6];
  
  /*constraint unique_a {
    foreach (a[i,j]) {
      if (i!=j) a[i] != a[j];
    }
    
  };*/
  
 /*constraint unique_b {
    foreach (b[i,j]) {
      if (i!=j) b[i] != b[j];
    }
  };*/
      
  constraint unique_a_b {
      /*foreach (a[i]) {
        foreach (b[j]) {
          a[i] != b[j];
        }
      }*/
    unique{a[0:4],b[0:4]};
  };
  
endclass

module tb;
  random_arrays r;
  initial begin
    r = new();
    r.randomize();
    $display("%p", r.a);
    $display("%p", r.b);
  end 
endmodule
