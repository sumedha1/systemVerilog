// Code your testbench here
// or browse Examples
`include "uvm_pkg.sv"
import uvm_pkg::*;

module test;
  
  class fifo;
    bit[7:0] q[bit[31:0]];
    int f;
    int s;
    
    function new(int size);
      f=0;
      s=size;
    endfunction 
    
    function void push(input bit[7:0] item);
      if(!this.isfull()) begin
        q[f] = item;
        f++;
      end 
    endfunction
    
    function int pop(output bit[7:0] item);
      
      if(!this.isempty()) begin
        f--;
        item = q[f];
        q.delete(f);
        return 1;
      end 
      else return 0;
    endfunction
    
    function int isempty();
      return (f==0);
    endfunction
    
    function int isfull();
      return (f==s);
    endfunction
  endclass

        initial begin 
          fifo f;
          bit[7:0] item; 
          f=new(2);
          
          f.push(10);
          $display("%p", f);
          f.push(20);
          $display("%p", f);
          f.push(30);
          $display("%p", f);
          f.pop(item);
          $display("%p", f);
          f.pop(item);
          $display("%p", f);
          f.pop(item);
          $display("%p", f);
          f.pop(item);
          $display("%p", f);
          f.push(20);
          $display("%p", f);
          f.pop(item);
          $display("%p", f);
          
        end 
endmodule
