class fifo;
  int a[];
  int e,f;
  int size;
  
  function new(int n);
    size=n;
    e=0;
    f=0;
    a=new[n];
  endfunction 
  
  function int isempty();
    if (e==f) return 1;
    else return 0;
  endfunction 
  
  function int isfull();
    if (e==size) return 1;
    else return 0;
  endfunction 
  
  function void push(int n);
    
    if (!isfull()) begin
      a[e]=n;
      e++;
    end 
  endfunction 
  
  function int pop();
    int t;
    
    if (!isempty()) begin 
      t = a[f];
      for (int x=0;x<e; x++) begin 
        a[x]=a[x+1];
      end 
      e = e-1;
    end 
    return t;
  endfunction 
endclass

module tb;
  initial begin 
    fifo f;
    f=new(4);
    f.push(1);
    f.push(2);
    f.push(3);
    f.push(4);
    f.push(5);
    f.push(6);
    $display("%p", f);
    $display("%d",f.pop());
    $display("%p", f);
    f.push(5);
    $display("%p", f);
    f.push(6);
    $display("%p", f);
    $display("%d",f.pop());
    $display("%p", f);
    $display("%d",f.pop());
    $display("%p", f);
    f.push(6);
    $display("%p", f);
    f.push(7);
    $display("%p", f);
  end 
endmodule 
