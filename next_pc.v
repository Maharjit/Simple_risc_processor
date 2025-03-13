module pc_plus_4(input reg[31:0]pc_out,output [31:0]next_pc);
  assign next_pc = pc_out + 32'h4;
endmodule
