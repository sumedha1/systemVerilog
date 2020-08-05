
class pickBall;
  rand bit balls[];
  int red, blue;
  int num;
  
  constraint c_bweight {
    balls.size() == num;
    foreach (balls[i]) {
      balls[i] dist {1:=red, 0:=blue};
    }
      
  }
  constraint c_btype {
    
    if (red>blue) {
      balls.sum() with (int'(item)) > num-blue-1;
      //balls.sum() with (int'(item)) < num;
      
    }
      else {
        balls.sum() with (int'(item)) < num-red+1;
        //balls.sum() with (int'(item)) > 1;
      }
    
    
  }
endclass

module tb;
  initial begin 
    pickBall p;
    p=new();
    p.num= 10;
    p.red = 5;
    p.blue = 12;
    repeat (5)begin
    p.randomize();
    //foreach (p.balls[i]) begin
      $display("%p", p.balls);
      //end
    end 
  end
endmodule 
