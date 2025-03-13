module branch_unit(
  input [31:0] branch_target,op1,
  input flags_e,flags_gt,beq,bgt,u_branch,ret,
  output is_branch_taken,
  output [31:0] branch_pc);
  assign is_branch_taken = ((flags_e)&(beq))||((flags_gt)&(bgt))||(u_branch);
  assign branch_pc = (ret)?op1:branch_target;
endmodule
