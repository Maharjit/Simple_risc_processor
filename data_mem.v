module data_memory(
  input [31:0] op2,alu_result,
  input clk,ld,st,
  output reg[31:0] ld_result);
  reg[31:0]data_mem[15:0];
  wire[3:0]mar=alu_result[3:0];
  integer f;
  initial begin
    $readmemb("test.data", data_mem,0,15);
    #400;
  end
  assign ld_result = (ld)?data_mem[mar]:32'b0;
  integer k;
  always@(posedge clk) begin
    if(st)
      data_mem[mar]=op2;
  end
endmodule
