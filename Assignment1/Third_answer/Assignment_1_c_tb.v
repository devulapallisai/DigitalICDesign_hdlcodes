`timescale 1ns/1ns
module Assignment_1_c_tb;
reg [3:0]X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9;
reg clk;
integer i;
wire [15:0]P;
always #1 clk = ~clk;

two_multipliers_and_one_adder m1(X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9,clk,P);

initial begin
    clk=1;
    X0=$random;X1=$random;X2=$random;X3=$random;X4=$random;X5=$random;X6=$random;X7=$random;X8=$random;X9=$random;Y0=$random;Y1=$random;Y2=$random;Y3=$random;Y4=$random;Y5=$random;Y6=$random;Y7=$random;Y8=$random;Y9=$random;
    $monitor("Time %dns X0=%d X1=%d X2=%d X3=%d X4=%d X5=%d X6=%d X7=%d X8=%d X9=%d Y0=%d Y1=%d Y2=%d Y3=%d Y4=%d Y5=%d Y6=%d Y7=%d Y8=%d Y9=%d Output=%d",$time,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,Y9,P);
    $dumpfile("3.vcd");
    $dumpvars;
    #200 $finish;
end

initial begin
 for (i=0; i<5; i++) begin
    #18
    X0=$random;X1=$random;X2=$random;X3=$random;X4=$random;X5=$random;X6=$random;X7=$random;X8=$random;X9=$random;Y0=$random;Y1=$random;Y2=$random;Y3=$random;Y4=$random;Y5=$random;Y6=$random;Y7=$random;Y8=$random;Y9=$random;
 end
end
endmodule
