module test_simple_risc;
  reg clk;
  reg reset;
  simple_risc uut (
    .clk(clk),.reset(reset)
  );
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
    clk<=0;reset=1;
    #400;
    $finish;
  end
  always 
  begin
   #5 clk = ~clk;
   #8 reset = 0;
  end

endmodule
