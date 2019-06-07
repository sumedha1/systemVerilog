class bit_flip;
  rand bit [5:0] a[3];
  
  constraint my_c {
    foreach (a[i]) {i>0 -> $countones(a[i]^a[i-1])==4;}
  }
endclass

module tb;
  initial begin
    bit_flip b;
    b=new();
    b.randomize();
    
    $display("%p", b.a);
    
  end
endmodule
