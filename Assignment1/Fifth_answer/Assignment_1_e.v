// Assuming that known h0,h1,h2,h3,h4,...,h9 are 0,1,2,3,4,5,6,7,8,9 respectively then 
module calculate_shift(input [3:0] h,input [3:0] x,input clk,output [15:0] out);
    wire isbitpresent0=h&4'b0001;
    wire isbitpresent1=(h>>1)&4'b0001;
    wire isbitpresent2=(h>>2)&4'b0001;
    wire isbitpresent3=(h>>3)&4'b0001;
    wire [15:0] out1=isbitpresent0==1?x:0;
    wire [15:0] out2=isbitpresent1?x<<1:0;
    wire [15:0] out3=isbitpresent2?x<<2:0;
    wire [15:0] out4=isbitpresent3?x<<3:0;
    assign out = out1+out2+out3+out4;
endmodule

module without_multiplier_and_memory(input wire [3:0] X0,input wire [3:0] X1,input wire [3:0] X2,input wire [3:0] X3,input wire [3:0] X4,input wire [3:0] X5,input wire [3:0] X6,input wire [3:0] X7,input wire [3:0] X8,input wire [3:0] X9,input clk,output reg[15:0] Y);

wire [15:0] memory_h[0:9];

calculate_shift h1(4'b0000,X0,clk,memory_h[0]);
calculate_shift h2(4'b0001,X1,clk,memory_h[1]);
calculate_shift h3(4'b0010,X2,clk,memory_h[2]);
calculate_shift h4(4'b0011,X3,clk,memory_h[3]);
calculate_shift h5(4'b0100,X4,clk,memory_h[4]);
calculate_shift h6(4'b0101,X5,clk,memory_h[5]);
calculate_shift h7(4'b0110,X6,clk,memory_h[6]);
calculate_shift h8(4'b0111,X7,clk,memory_h[7]);
calculate_shift h9(4'b1000,X8,clk,memory_h[8]);
calculate_shift h10(4'b1001,X9,clk,memory_h[9]);

always @(posedge clk)

begin
    // $display(memory_h[0],memory_h[1],memory_h[5],memory_h[8],memory_h[9]);
Y<=memory_h[0]+memory_h[1]+memory_h[2]+memory_h[3]+memory_h[4]+memory_h[5]+memory_h[6]+memory_h[7]+memory_h[8]+memory_h[9];

end

endmodule

