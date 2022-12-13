// Assuming that known h0,h1,h2,h3,h4,...,h9 are 0,1,2,3,4,5,6,7,8,9 respectively then 
module without_multiplier(input wire [3:0] X0,input wire [3:0] X1,input wire [3:0] X2,input wire [3:0] X3,input wire [3:0] X4,input wire [3:0] X5,input wire [3:0] X6,input wire [3:0] X7,input wire [3:0] X8,input wire [3:0] X9,input clk,output reg[15:0] Y);

wire [15:0] memory[0:15][0:15];

// storing all 16*16 combinations in memory 2D array where x can be from 0 to 15 and h can be 0 to 15 and we know h so we can direct multiply after storing.

assign memory[0][0]= 0;
assign memory[0][1]= 0;
assign memory[0][2]= 0;
assign memory[0][3]= 0;
assign memory[0][4]= 0;
assign memory[0][5]= 0;
assign memory[0][6]= 0;
assign memory[0][7]= 0;
assign memory[0][8]= 0;
assign memory[0][9]= 0;
assign memory[0][10]= 0;
assign memory[0][11]= 0;
assign memory[0][12]= 0;
assign memory[0][13]= 0;
assign memory[0][14]= 0;
assign memory[0][15]= 0;

assign memory[1][0]= 0;
assign memory[1][1]= 1;
assign memory[1][2]= 2;
assign memory[1][3]= 3;
assign memory[1][4]= 4;
assign memory[1][5]= 5;
assign memory[1][6]= 6;
assign memory[1][7]= 7;
assign memory[1][8]= 8;
assign memory[1][9]= 9;
assign memory[1][10]= 10;
assign memory[1][11]= 11;
assign memory[1][12]= 12;
assign memory[1][13]= 13;
assign memory[1][14]= 14;
assign memory[1][15]= 15;

assign memory[2][0]= 0;
assign memory[2][1]= 2;
assign memory[2][2]= 4;
assign memory[2][3]= 6;
assign memory[2][4]= 8;
assign memory[2][5]= 10;
assign memory[2][6]= 12;
assign memory[2][7]= 14;
assign memory[2][8]= 16;
assign memory[2][9]= 18;
assign memory[2][10]= 20;
assign memory[2][11]= 22;
assign memory[2][12]= 24;
assign memory[2][13]= 26;
assign memory[2][14]= 28;
assign memory[2][15]= 30;

assign memory[3][0]= 0;
assign memory[3][1]= 3;
assign memory[3][2]= 6;
assign memory[3][3]= 9;
assign memory[3][4]= 12;
assign memory[3][5]= 15;
assign memory[3][6]= 18;
assign memory[3][7]= 21;
assign memory[3][8]= 24;
assign memory[3][9]= 27;
assign memory[3][10]= 30;
assign memory[3][11]= 33;
assign memory[3][12]= 36;
assign memory[3][13]= 39;
assign memory[3][14]= 42;
assign memory[3][15]= 45;

assign memory[4][0]= 0;
assign memory[4][1]= 4;
assign memory[4][2]= 8;
assign memory[4][3]= 12;
assign memory[4][4]= 16;
assign memory[4][5]= 20;
assign memory[4][6]= 24;
assign memory[4][7]= 28;
assign memory[4][8]= 32;
assign memory[4][9]= 36;
assign memory[4][10]= 40;
assign memory[4][11]= 44;
assign memory[4][12]= 48;
assign memory[4][13]= 52;
assign memory[4][14]= 56;
assign memory[4][15]= 60;

assign memory[5][0]= 0;
assign memory[5][1]= 5;
assign memory[5][2]= 10;
assign memory[5][3]= 15;
assign memory[5][4]= 20;
assign memory[5][5]= 25;
assign memory[5][6]= 30;
assign memory[5][7]= 35;
assign memory[5][8]= 40;
assign memory[5][9]= 45;
assign memory[5][10]= 50;
assign memory[5][11]= 55;
assign memory[5][12]= 60;
assign memory[5][13]= 65;
assign memory[5][14]= 70;
assign memory[5][15]= 75;

assign memory[6][0]= 0;
assign memory[6][1]= 6;
assign memory[6][2]= 12;
assign memory[6][3]= 18;
assign memory[6][4]= 24;
assign memory[6][5]= 30;
assign memory[6][6]= 36;
assign memory[6][7]= 42;
assign memory[6][8]= 48;
assign memory[6][9]= 54;
assign memory[6][10]= 60;
assign memory[6][11]= 66;
assign memory[6][12]= 72;
assign memory[6][13]= 78;
assign memory[6][14]= 84;
assign memory[6][15]= 90;

assign memory[7][0]= 0;
assign memory[7][1]= 7;
assign memory[7][2]= 14;
assign memory[7][3]= 21;
assign memory[7][4]= 28;
assign memory[7][5]= 35;
assign memory[7][6]= 42;
assign memory[7][7]= 49;
assign memory[7][8]= 56;
assign memory[7][9]= 63;
assign memory[7][10]= 70;
assign memory[7][11]= 77;
assign memory[7][12]= 84;
assign memory[7][13]= 91;
assign memory[7][14]= 98;
assign memory[7][15]= 105;

assign memory[8][0]= 0;
assign memory[8][1]= 8;
assign memory[8][2]= 16;
assign memory[8][3]= 24;
assign memory[8][4]= 32;
assign memory[8][5]= 40;
assign memory[8][6]= 48;
assign memory[8][7]= 56;
assign memory[8][8]= 64;
assign memory[8][9]= 72;
assign memory[8][10]= 80;
assign memory[8][11]= 88;
assign memory[8][12]= 96;
assign memory[8][13]= 104;
assign memory[8][14]= 112;
assign memory[8][15]= 120;

assign memory[9][0]= 0;
assign memory[9][1]= 9;
assign memory[9][2]= 18;
assign memory[9][3]= 27;
assign memory[9][4]= 36;
assign memory[9][5]= 45;
assign memory[9][6]= 54;
assign memory[9][7]= 63;
assign memory[9][8]= 72;
assign memory[9][9]= 81;
assign memory[9][10]= 90;
assign memory[9][11]= 99;
assign memory[9][12]= 108;
assign memory[9][13]= 117;
assign memory[9][14]= 126;
assign memory[9][15]= 135;

assign memory[10][0]= 0;
assign memory[10][1]= 10;
assign memory[10][2]= 20;
assign memory[10][3]= 30;
assign memory[10][4]= 40;
assign memory[10][5]= 50;
assign memory[10][6]= 60;
assign memory[10][7]= 70;
assign memory[10][8]= 80;
assign memory[10][9]= 90;
assign memory[10][10]= 100;
assign memory[10][11]= 110;
assign memory[10][12]= 120;
assign memory[10][13]= 130;
assign memory[10][14]= 140;
assign memory[10][15]= 150;

assign memory[11][0]= 0;
assign memory[11][1]= 11;
assign memory[11][2]= 22;
assign memory[11][3]= 33;
assign memory[11][4]= 44;
assign memory[11][5]= 55;
assign memory[11][6]= 66;
assign memory[11][7]= 77;
assign memory[11][8]= 88;
assign memory[11][9]= 99;
assign memory[11][10]= 110;
assign memory[11][11]= 121;
assign memory[11][12]= 132;
assign memory[11][13]= 143;
assign memory[11][14]= 154;
assign memory[11][15]= 165;

assign memory[12][0]= 0;
assign memory[12][1]= 12;
assign memory[12][2]= 24;
assign memory[12][3]= 36;
assign memory[12][4]= 48;
assign memory[12][5]= 60;
assign memory[12][6]= 72;
assign memory[12][7]= 84;
assign memory[12][8]= 96;
assign memory[12][9]= 108;
assign memory[12][10]= 120;
assign memory[12][11]= 132;
assign memory[12][12]= 144;
assign memory[12][13]= 156;
assign memory[12][14]= 168;
assign memory[12][15]= 180;

assign memory[13][0]= 0;
assign memory[13][1]= 13;
assign memory[13][2]= 26;
assign memory[13][3]= 39;
assign memory[13][4]= 52;
assign memory[13][5]= 65;
assign memory[13][6]= 78;
assign memory[13][7]= 91;
assign memory[13][8]= 104;
assign memory[13][9]= 117;
assign memory[13][10]= 130;
assign memory[13][11]= 143;
assign memory[13][12]= 156;
assign memory[13][13]= 169;
assign memory[13][14]= 182;
assign memory[13][15]= 195;

assign memory[14][0]= 0;
assign memory[14][1]= 14;
assign memory[14][2]= 28;
assign memory[14][3]= 42;
assign memory[14][4]= 56;
assign memory[14][5]= 70;
assign memory[14][6]= 84;
assign memory[14][7]= 98;
assign memory[14][8]= 112;
assign memory[14][9]= 126;
assign memory[14][10]= 140;
assign memory[14][11]= 154;
assign memory[14][12]= 168;
assign memory[14][13]= 182;
assign memory[14][14]= 196;
assign memory[14][15]= 210;

assign memory[15][0]= 0;
assign memory[15][1]= 15;
assign memory[15][2]= 30;
assign memory[15][3]= 45;
assign memory[15][4]= 60;
assign memory[15][5]= 75;
assign memory[15][6]= 90;
assign memory[15][7]= 105;
assign memory[15][8]= 120;
assign memory[15][9]= 135;
assign memory[15][10]= 150;
assign memory[15][11]= 165;
assign memory[15][12]= 180;
assign memory[15][13]= 195;
assign memory[15][14]= 210;
assign memory[15][15]= 225;

always @(posedge clk) 

begin
    
Y<=memory[0][X0]+memory[1][X1]+memory[2][X2]+memory[3][X3]+memory[4][X4]+memory[5][X5]+memory[6][X6]+memory[7][X7]+memory[8][X8]+memory[9][X9];

end

endmodule
