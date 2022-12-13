
module one_at_once(input wire [3:0] X0,input wire [3:0] X1,input wire [3:0] X2,input wire [3:0] X3,input wire [3:0] X4,input wire [3:0] X5,input wire [3:0] X6,input wire [3:0] X7,input wire [3:0] X8,input wire [3:0] X9,input wire [3:0] H0,input wire [3:0] H1,input wire [3:0] H2,input wire [3:0] H3,input wire [3:0] H4,input wire [3:0] H5,input wire [3:0] H6,input wire [3:0] H7,input wire [3:0] H8,input wire [3:0] H9,input clk,output reg[15:0] Y);

// Verilog doesn't support Two dimensional arrays for mapping to input port. So I have taken all 20 input 4 bit numbers as individual

always @(posedge clk) 

begin
   
Y=X1*H1+X2*H2+X3*H3+X4*H4+X5*H5+X6*H6+X7*H7+X8*H8+X9*H9+X0*H0;

end

endmodule

