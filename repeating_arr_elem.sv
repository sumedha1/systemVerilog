module tb;
  
  
function int find(int a[]);
  int arr[*];
  foreach(a[i]) begin
    if (arr.exists(a[i])) begin 
      return a[i];
    end
    else arr[a[i]]=1;
  end
  return 0;
endfunction 
  
function findf(int a[]);
  int arr[*];
   int i;
  foreach (a[i]) begin
    if (arr.exists(a[i])) arr[a[i]] = arr[a[i]]+1;
    else arr[a[i]] = 1;
  end 
 
  arr.first(i);
  repeat(arr.size()) begin 
    
    if(arr[i]>1) return i;
    
    arr.next(i);
  end
  return 0;
endfunction 
  
initial begin 
  int a[7] = {1,3,4,5,3,6,1};
  
  
  $display("%d", find(a));

  $display("%d", findf(a));
end 
endmodule 
