module data_path( input clk,reset,st,ld,beq,bgt,ret,wb,u_branch,call,add,sub,cmp,mul,div,mod,lsl,lsr,asr,is_or,is_and,is_not,mov, output reg [4:0] opcode );
  
  reg[31:0]pc_in,pc_out,next_pc,out_inst,write_data,op1,op2,immx,branch_target,branch_pc,alu_result,ld_result,B;
  reg[3:0]read_port1,read_port2,write_adr;
  reg is_branch_taken,flags_e,flags_gt;
  
  pc inst_1(.clk(clk),.reset(reset),.pc_in(pc_in),.pc_out(pc_out));
  
  pc_plus_4 inst_2(.pc_out(pc_out),.next_pc(next_pc));
  
  inst_memory inst_3(.clk(clk),.pc_out(pc_out),.out_inst(out_inst));
  
  immx_and_branch_target inst_4(.out_inst(out_inst),.pc_out(pc_out),.immx(immx),.branch_target(branch_target));
 
  assign read_port1 = (ret)?4'b1111:out_inst[21:18];
  assign read_port2 = (st)?out_inst[25:22]:out_inst[17:14];
  assign write_adr = (call)?4'b1111:out_inst[25:22];
  
  reg_file inst_5(.clk(clk),.reset(reset),.wb(wb),.read_port1(read_port1),.read_port2(read_port2),.write_adr(write_adr),.write_data(write_data),.op1(op1),.op2(op2));
 
  assign B=(out_inst[26])?immx:op2;
  
  ALU_unit inst_6(.A(op1),.B(B),.clk(clk),.add(add),.sub(sub),.cmp(cmp),.mul(mul),.div(div),.mod(mod),.lsl(lsl),.lsr(lsr),.asr(asr),.is_or(is_or),.is_not(is_not),.is_and(is_and),.mov(mov),.flags_e(flags_e),.flags_gt(flags_gt),.alu_result(alu_result));
  
  branch_unit inst_7(.branch_target(branch_target),.op1(op1),.flags_e(flags_e),.flags_gt(flags_gt),.beq(beq),.bgt(bgt),.u_branch(u_branch),.ret(ret),.is_branch_taken(is_branch_taken),.branch_pc(branch_pc));
  
  assign pc_in = (is_branch_taken)?branch_pc:next_pc;
  
  data_memory inst_8(.op2(op2),.alu_result(alu_result),.clk(clk),.ld(ld),.st(st),.ld_result(ld_result));
  
  four_mux inst_9(.in1(alu_result),.in2(ld_result),.in3(next_pc),.sel({call,ld}),.out(write_data));
  
  assign opcode = out_inst[31:27];
  
endmodule
