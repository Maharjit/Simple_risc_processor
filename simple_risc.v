module simple_risc(
  input clk,reset);
  reg st,ld,beq,bgt,ret,wb,u_branch,call,add,sub,cmp,mul,div,mod,lsl,lsr,asr,is_or,is_and,is_not,mov;
  reg [4:0] opcode;
  reg[31:0] out_inst;
  data_path inst_10(clk,reset,st,ld,beq,bgt,ret,wb,u_branch,call,add,sub,cmp,mul,div,mod,lsl,lsr,asr,is_or,is_and,is_not,mov,opcode);
  control_unit inst_11(opcode,st,ld,beq,bgt,ret,wb,u_branch,call,add,sub,cmp,mul,div,mod,lsl,lsr,asr,is_or,is_and,is_not,mov);
endmodule
