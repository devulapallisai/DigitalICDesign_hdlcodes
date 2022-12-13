`timescale 1ns/1ns

module cordic_tb;
reg clk=1;   
reg [15:0] angle;
reg  signed  [15:0] Xin;
reg  signed  [15:0] Yin;
real t; //for displaying angle
wire signed  [15:0] Xout;
wire signed  [15:0] Yout;

integer scaleingfactor=2**(16);

// I took angle as angle*(2^16)/360 so that all angles from 0 to 360 can be denoted by 16 bit unsigned binary numbers because as angle<=350 so max value that should represented is 2^16-1 when angle is 359deg which can be represented by a all 1s in 16bit binary 

always #1 clk=~clk;

Cordic cordic(clk, Xin, Yin,angle, Xout, Yout);

initial 
begin
   Xin=16'd1000;
   Yin=16'd1000;
   angle=16'b1110000000000000;
   t=(angle*360.00)/scaleingfactor;
   $monitor("time=%d Xin=%d Yin=%d angle=%fdeg Xout=%d,Yout=%d",$time,Xin,Yin,t,Xout,Yout);
   $dumpfile("cordic.vcd");
   $dumpvars();
   #114 $finish;
end

initial 
begin
   // manual testcases it takes 8 clock cycles to compute single thing so will give input after 8 clock cycles i.e 16ns
   #16 Xin=16'd1000;Yin=16'd1000;angle=16'b1000000000000000;t=(angle*360.00)/scaleingfactor;
   #16 Xin=16'd0;Yin=16'd1000;angle=16'b0000000100000000;t=(angle*360.00)/scaleingfactor;
   #16 Xin=16'd1000;Yin=16'd0;angle=16'b0010000000001000;t=(angle*360.00)/scaleingfactor;
   #16 Xin=16'd1000;Yin=16'd0;angle=16'b0100000000000000;t=(angle*360.00)/scaleingfactor;
   #16 Xin=16'd1000;Yin=16'd0;angle=16'b0000001000100010;t=(angle*360.00)/scaleingfactor;
   #16 Xin=16'd1000;Yin=16'd0;angle=16'b0001001000100010;t=(angle*360.00)/scaleingfactor;
end
endmodule