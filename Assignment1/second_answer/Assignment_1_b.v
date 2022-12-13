module no_two_different(input wire [3:0] X0,input wire [3:0] X1,input wire [3:0] X2,input wire [3:0] X3,input wire [3:0] X4,input wire [3:0] X5,input wire [3:0] X6,input wire [3:0] X7,input wire [3:0] X8,input wire [3:0] X9,input wire [3:0] H0,input wire [3:0] H1,input wire [3:0] H2,input wire [3:0] H3,input wire [3:0] H4,input wire [3:0] H5,input wire [3:0] H6,input wire [3:0] H7,input wire [3:0] H8,input wire [3:0] H9,input clk,output reg[15:0] Y);

// Verilog doesn't support Two dimensional arrays for mapping to input port. So I have taken all 20 input 4 bit numbers as individual

reg [15:0] mul1,mul2,mul3,mul4,mul5,mul6,mul7,mul8,mul9,mul0;

always @(posedge clk) 

begin
    
// All multplications at performed at single clock edge and stored in registers which are further used for addition in next cycle 
mul0<=X0*H0;
mul1<=X1*H1;
mul2<=X2*H2;
mul3<=X3*H3;
mul4<=X4*H4;
mul5<=X5*H5;
mul6<=X6*H6;
mul7<=X7*H7;
mul8<=X8*H8;
mul9<=X9*H9;

end

always @(negedge clk) 

// Doing multiplication on positive edge and saving results and using those results for addition in negative edge 

begin

 Y<= mul0+mul1+mul2+mul3+mul4+mul5+mul6+mul7+mul8+mul9;
  
end

endmodule
