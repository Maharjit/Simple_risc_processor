module inst_memory(input clk,input reg [31:0] pc_out,output [31:0] out_inst);
  reg[31:0]rom[13:0];
  int i;
  wire [3 : 0] rom_addr = pc_out[5 : 2];
  initial begin
    $readmemb("test.inst", rom,0,13);
  end
  assign out_inst = rom[rom_addr];
endmodule
