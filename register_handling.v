module reg_file(
  input clk,
  input reset,
  input wb,
  input [3:0] read_port1,read_port2,write_adr,
  input [31:0] write_data,
  output [31:0] op1,op2);
  reg[31:0]reg_array[15:0];
  integer j;
  always@(posedge clk) begin
    if(reset) begin
      for(j=0;j<16;j=j+1)
        reg_array[j]=32'b0;
    end
    else if(wb)
      reg_array[write_adr]<=write_data;
    end
  assign op1 = reg_array[read_port1];
  assign op2 = reg_array[read_port2];
endmodule
