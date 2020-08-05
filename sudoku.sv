class sudoku;
  rand int pos[9][9];
  
  constraint val_c {
    foreach (pos[i,j]) {
      pos[i][j] inside {[1:9]};
    }
  }
          
  constraint row_column_c {
    foreach( pos[i1,j1]) {
      foreach (pos[i2,j2]) {
        // ROw
        (j1 != j2) -> (pos[i1][j1] != pos[i1][j2]);
        // COlumn
        (i1 != i2) -> pos[i1][j1] != pos[i2][j1];
        // Sub - matrix 
        ((i1/3==i2/3)&&(j1/3==j2/3)&&(i1!=i2)&&(j1!=j2)) -> pos[i1][j1] != pos[i2][j2];
      }
    }
  }
          
 
endclass
      
module tb;
  initial begin 
    sudoku s;
    s= new();
    s.randomize();
    foreach (s.pos[i]) begin
      $display("%p", s.pos[i]);
    end 
    
  end 
endmodule 
