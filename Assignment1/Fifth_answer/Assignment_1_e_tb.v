`timescale 1ns / 1ns
// Assuming that known h0,h1,h2,h3,h4,...,h9 are 0,1,2,3,4,5,6,7,8,9 respectively then 

module Assignment_1_e_tb;
 reg [3:0] X0, X1, X2, X3, X4, X5, X6, X7, X8, X9;
 reg clk=1;
 wire [15:0] Y;
 integer i;

always #1 clk=~clk ;

without_multiplier_and_memory m1 (X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,clk,Y);

initial begin
   X0=$random;X1=$random;X2=$random;X3=$random;X4=$random;X5=$random;X6=$random;X7=$random;X8=$random;X9=$random;
   // initialising all values first 
   $monitor("Time %dns X0=%d X1=%d X2=%d X3=%d X4=%d X5=%d X6=%d X7=%d X8=%d X9=%d Output=%d",$time,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,Y);

   $dumpfile("5.vcd");
   $dumpvars;
   #30 $finish;
end

initial begin
   for (i = 0; i < 5; i++) begin
      #2
      X0=$random;X1=$random;X2=$random;X3=$random;X4=$random;X5=$random;X6=$random;X7=$random;X8=$random;X9=$random;
   end
end
endmodule