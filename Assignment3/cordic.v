module cordiciter(input clk,input signed  [15:0] Xin,input signed  [15:0] Yin,input   [15:0] Zin,input signed[15:0] prev_angle,output reg [15:0] Xout,output reg [15:0] Yout,output reg [15:0] Zout,input [2:0] i);
always @(posedge clk)
begin
    Xout<=Yin[15]? Xin-(Yin>>>i) : Xin+(Yin>>>i);
    Yout<=Yin[15]? Yin+(Xin>>>i) : Yin-(Xin>>>i);
    Zout<=Yin[15]? Zin-prev_angle : Zin+prev_angle;
    // Y>0 or <0 or =0
end
endmodule

module Cordic(input clk,input signed  [15:0] Xin, input signed  [15:0] Yin, output reg signed  [15:0]norm, output reg signed  [15:0]inclination);

   real allcosmulfactor=0.612;
   wire[15:0] Xi[0:7]; //for each stage the output of x 
   assign Xi[0]=Xin[15]?-Xin:Xin; //signed bit 1 so we have negative number 

   wire[15:0] Yi[0:7]; //for each stage output of y
   assign Yi[0]=Yin;
   
 
   wire[15:0] Z[0:7]; //after each stage rotated angle 
   assign Z[0]=0;   

   wire signed [15:0]Xf;
   wire signed [15:0]Yf;
   wire [15:0] angle_rotated_total;
	
   wire [15:0] angles [0:7];
	assign angles[0] = 16'b0010000000000000; 
   assign angles[1] = 16'b0001001011100100; 
   assign angles[2] = 16'b0000100111111011; 
   assign angles[3] = 16'b0000010100010001; 
   assign angles[4] = 16'b0000001010001011;
   assign angles[5] = 16'b0000000101000101;
   assign angles[6] = 16'b0000000010100010;
   assign angles[7] = 16'b0000000001010001;



   cordiciter c0(clk,Xi[0],Yi[0],Z[0],angles[0],Xi[1],Yi[1],Z[1],3'd0);
   cordiciter c1(clk,Xi[1],Yi[1],Z[1],angles[1],Xi[2],Yi[2],Z[2],3'd1);
   cordiciter c2(clk,Xi[2],Yi[2],Z[2],angles[2],Xi[3],Yi[3],Z[3],3'd2);
   cordiciter c3(clk,Xi[3],Yi[3],Z[3],angles[3],Xi[4],Yi[4],Z[4],3'd3);
   cordiciter c4(clk,Xi[4],Yi[4],Z[4],angles[4],Xi[5],Yi[5],Z[5],3'd4);
   cordiciter c5(clk,Xi[5],Yi[5],Z[5],angles[5],Xi[6],Yi[6],Z[6],3'd5);
   cordiciter c6(clk,Xi[6],Yi[6],Z[6],angles[6],Xi[7],Yi[7],Z[7],3'd6);
   cordiciter c7(clk,Xi[7],Yi[7],Z[7],angles[7],Xf,Yf,angle_rotated_total,3'd7);
   // we are designing 

   always @(posedge clk)
   begin
        inclination=Xin[15]?16'b1000000000000000-angle_rotated_total:angle_rotated_total;
        // 180-theta or theta depending on sign of Xin
        norm=allcosmulfactor*Xf;
   end
endmodule