module immx_and_branch_target(
  input reg[31:0] out_inst,
  input reg[31:0] pc_out,
  output reg[31:0] immx,
  output [31:0] branch_target);
  wire[1:0]modify_bits;
  assign modify_bits = out_inst[17:16];
  always@(*) begin
    case(modify_bits)
      2'b00 : immx = {{16{out_inst[15]}},out_inst[15:0]};
      2'b01 : immx = {16'b0,out_inst[15:0]};/*u*/
      2'b10 : immx = {out_inst[15:0],16'b0};/*h*/
      default : immx = {{16{out_inst[15]}},out_inst[15:0]};
    endcase
  end
  assign branch_target = pc_out + {{3{out_inst[26]}},out_inst[26:0],2'b0};
endmodule
