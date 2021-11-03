module tb;
  initial begin 
    int arr[4]='{3,2,6,1};
    int sq[$];
    int f[$];
    int max;
    
    f=arr.min(); // max
    max=f[0];
    sq.push_back(max);
    foreach(arr[i]) begin 
      if (max != arr[i]) begin 
        f=sq.find_first_index with (item < arr[i]); // item > arr[i]
        $display("%p",f);
        sq.insert(f[0], arr[i]);
      end 
      $display("%p",sq);
    end 
  end 
endmodule
