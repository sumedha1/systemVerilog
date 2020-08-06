typedef enum {ADD, SUB, MUL, DIV} inst_e;
class carray;
  rand inst_e inst[$];
 
  constraint size_c {
    inst.size() == 15;
    (inst.sum() with (int'(item == ADD) )) == 5;
    (inst.sum() with (int'(item == DIV) )) > 1;
  }
  
  
endclass

module tb;
  initial begin
    carray i;
    i = new();
    i.randomize();
    foreach (i.inst[j]) $display("%p", i.inst[j]);
   
  end 
endmodule 
