// Code your testbench here
// or browse Examples
class fib;
  rand int a[10];
  
  constraint my_c {
    a[0] ==0;
    a[1]==1;
    foreach (a[i]) {i>1 -> a[i]==a[i-1]+a[i-2];}
  }
endclass

module tb;
  initial begin
    fib b;
    b=new();
    b.randomize();
    
    $display("%p", b.a);
    
  end
endmodule
