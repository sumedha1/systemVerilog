// Code your testbench here
// or browse Examples
// Create 32 bit palindromes 

class palindrome;
  rand bit[31:0] a;
  
  constraint my_c {
    foreach (a[i]) {
      a[i] == a[31-i];
    }
  }
endclass
      
class palin;
  rand int a;
  
  function void post_randomize();
    for (int i=0; i<32/2; i++) a[i]=a[31-i]; 
  endfunction 
endclass

module tb;
  palin r;
  initial begin
    r = new();
    r.randomize();
    $display("%b", r.a);
    
  end 
endmodule
