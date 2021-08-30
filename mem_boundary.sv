// Code your testbench here
// or browse Examples
// create a constraint for transactions 
// cmd - > read or write
// addr -> address holds 1 byte
// transfer size = 4 bytes = 32 bits 
// 0-> 1-> 2-> 3-> etc
// lenght -> should not cross 128 Bytes boundary
// Size 
// 0->1
// 1->2
// 2-> 4
// 3-> 8

// 128 = 10000000 => bit[6:0] ==0

module tb;
  
class transaction;
  rand bit cmd;
  rand bit [31:0] s_addr;
  rand bit [31:0] size;
  rand bit [31:0] e_addr;
  constraint my_c {
    (1<<size) inside {[1:32]};
    s_addr[31:8] == 0;
    s_addr[6:0] == 0;
    s_addr[6:0] + ((1<<size)-1)*4 < 128;
    e_addr == s_addr + ((1<<size)-1)*4;
  }
endclass 
  
  initial begin
    transaction txn;
    txn = new();
    repeat(10) begin 
      txn.randomize();
      $display("%p", txn);
      $display("Addr = %d, size = %d, len = %d, Final = %d, Diff = %d", txn.s_addr, txn.size,  (1<<txn.size), txn.e_addr, (txn.e_addr-txn.s_addr )/4);
      $display("Addr = %b, Final = %b", txn.s_addr, txn.e_addr);
    end 
  end 
endmodule 
