module ALU_unit(
  input clk,
  input reg[31:0] A,B,
  input  reg add,sub,cmp,mul,div,mod,lsl,lsr,asr,is_or,is_not,is_and,mov,
  output reg flags_e,flags_gt,
  output reg[31:0] alu_result);
  reg[12:0]alu_sel;
  assign alu_sel={add,sub,mul,div,mod,lsl,lsr,asr,is_or,is_not,is_and,mov};
  always@(*) begin
    case(alu_sel)
      13'b100000000000:alu_result=A+B;
      13'b010000000000:alu_result=A-B;
      13'b001000000000:alu_result=A*B;
      13'b000100000000:alu_result=A/B;
      13'b000010000000:alu_result=A%B;
      13'b000001000000:alu_result=A<<B;
      13'b000000100000:alu_result=A>>>B;
      13'b000000010000:alu_result=A>>B;
      13'b000000001000:alu_result=A|B;
      13'b000000000010:alu_result=A&B;
      13'b000000000100:alu_result=~B;
      13'b000000000001:alu_result=B;
      default:begin 
        alu_result=0;
       
      end
    endcase
  end
  always@(posedge clk) begin
    if(cmp) begin
      if(A==B) begin
        flags_e<=1;
        flags_gt<=0;
      end
      else if(A>B) begin
        flags_e<=0;
        flags_gt<=1;
      end
    end
    else begin
      flags_e<=flags_e;
      flags_gt<=flags_gt;
    end
  end
