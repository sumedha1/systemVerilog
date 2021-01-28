class ran_gen;
  int num[10];
  rand int unum[8];
  rand int rnum[2];
  
  constraint rnum_c {
    foreach(rnum[i]) {
      rnum[i] inside {unum};
    }
    solve unum before rnum;
  }
  constraint unum_c {
    foreach (unum[i]) {
      unum[i] inside {[1:10]};
      foreach (unum[j]) {
        (i!=j) -> unum[i] != unum[j];
      }
    }
  }
  
        function void post_randomize();
      num= {unum,rnum};
      num.shuffle();
      
      endfunction 
        
endclass

module tb;
 
  initial begin 
    ran_gen r;
    r=new();
    r.randomize();
    $display("%p",r);
  end 
  
endmodule
