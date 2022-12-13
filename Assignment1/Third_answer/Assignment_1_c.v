module two_multipliers_and_one_adder(input wire [3:0] X0,input wire [3:0] X1,input wire [3:0] X2,input wire [3:0] X3,input wire [3:0] X4,input wire [3:0] X5,input wire [3:0] X6,input wire [3:0] X7,input wire [3:0] X8,input wire [3:0] X9,input wire [3:0] H0,input wire [3:0] H1,input wire [3:0] H2,input wire [3:0] H3,input wire [3:0] H4,input wire [3:0] H5,input wire [3:0] H6,input wire [3:0] H7,input wire [3:0] H8,input wire [3:0] H9,input clk,output reg[15:0] Y);

reg [15:0] mul1,mul2;
reg [15:0] sum[0:4];
reg [15:0] sumsecondstage[0:1];
// state is used to remember the state and perform the corresponding mux activity
reg [3:0] state = 4'b1111;
// 4 muxes are used
reg [15:0] mux1=0, mux2=0, mux3=0, mux4=0;
// 2 multipliers and adder to store multiplied values

always @(X0 or X1 or X2 or X3 or X4 or X5 or X6 or X7 or X8 or X9 or H0 or H1 or H2 or H3 or H4 or H5 or H6 or H7 or H8 or H9)
begin
    state = 4'b1111;
    // because if we start from 0 directly then we will be computing directly an addition + two multiplications without consuming any clock cycle
end

always @(posedge clk)
begin
      
      if (state < 9) 
        begin
          state <= state + 1;
        end
      else 
        begin
          state <= 4'b0000;
        end
end

always @(state) 

begin

    if (state < 9) 
        begin
            case (state)

            4'b0000: begin mux1 = X0; mux2 = H0; mux3 = X1; mux4 = H1; end
            4'b0001: begin mux1 = X2;mux2 = H2;mux3 = X3;mux4 = H3;end
            4'b0010: begin mux1 = X4;mux2 = H4;mux3 = X5;mux4 = H5;end
            4'b0011: begin mux1 = X6;mux2 = H6;mux3 = X7;mux4 = H7;end
            4'b0100: begin mux1 = X8;mux2 = H8;mux3 = X9;mux4 = H9;end
            4'b0101: begin sumsecondstage[0]= sum[0]+sum[1];end
            4'b0110: begin sumsecondstage[1]= sum[2]+sum[3];end
            4'b0111: begin sumsecondstage[1]= sumsecondstage[1]+sum[4];end
            4'b1000: begin Y= sumsecondstage[0]+sumsecondstage[1];end

            default: begin Y=0; end

            endcase

            mul1 = mux1 * mux2;
            mul2 = mux3 * mux4;
            sum[state] = mul1 + mul2;
            // Using one adder and two multipliers at a state which refers to one clock cycle 
        end

end

endmodule
