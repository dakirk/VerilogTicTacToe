`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:37:33 12/07/2018 
// Design Name: 
// Module Name:    comp_input 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module comp_input(board_in,play,clk,reset,choice);
  input play, clk, reset;
  input [17:0] board_in;
  output reg [3:0] choice;
  reg [1:0] board [8:0];
  reg [1:0] row1_sum,row2_sum,row3_sum,col1_sum,col2_sum,col3_sum,diag1_sum,diag2_sum;
  reg [3:0] choice1;
  reg [3:0] board_sum,out;
  
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      choice <= out;
    end
	 else begin
	   choice <= out;
    end
  end
	   
  
  always @(*) begin
    board[0] = board_in[1:0];
	 board[1] = board_in[3:2];
	 board[2] = board_in[5:4];
	 board[3] = board_in[7:6];
	 board[4] = board_in[9:8];
	 board[5] = board_in[11:10];
	 board[6] = board_in[13:12];
	 board[7] = board_in[15:14];
	 board[8] = board_in[17:16];
  
    board_sum = board[0][1] + board[1][1] + board[2][1] + board[3][1] + board[4][1] + board[5][1] + board[6][1] + board[7][1] + board[8][1];
  
    row1_sum = board[0][1] + board[1][1] + board[2][1];
    row2_sum = board[3][1] + board[4][1] + board[5][1];
    row3_sum = board[6][1] + board[7][1] + board[8][1];
  
    col1_sum = board[0][1] + board[3][1] + board[6][1];
    col2_sum = board[1][1] + board[4][1] + board[7][1];
    col3_sum = board[2][1] + board[5][1] + board[8][1];
  
    diag1_sum = board[0][1] + board[4][1] + board[8][1];
    diag2_sum = board[2][1] + board[4][1] + board[6][1];
	 
	 if (board_sum == 0 || board_sum == 2 || board_sum == 4 || board_sum == 6 || board_sum == 8  || ~play) begin
	   out = 10;
    end
	 
	 else if (board_sum == 1) begin                                               //Turn 1
	   if (board[0][0] || board[2][0] || board[6][0] || board[8][0]) begin
		  out = 4;
		  choice1 = 1;
		end
		else if (board[1][0] ||board[3][0] || board[4][0]) begin
		  out = 0;
		  choice1 = 2;
		end
		else if (board[5][0]) begin
		  out = 2;
		  choice1 = 3;
		end
		else begin
		  out = 1;
		  choice1 = 4;
		end
    end
	 
    else if (board_sum == 3) begin                                               //Turn 2
      if (choice1 == 1) begin
	     if ((board[0][0] && board[8][0]) || (board[2][0] && board[6][0])) begin
		    out = 1;
		  end
		  else if (row1_sum == 2) begin
		    if (board[0][0] && board[1][0]) begin
		      out = 2;
		    end
		    else if (board[0][0] && board[2][0]) begin
		      out = 1;
		    end
		    else begin
		      out = 0;
		    end
		  end
		  else if (row3_sum == 2) begin
		    if (board[6][0] == 1 && board[7][0]) begin
		      out = 8;
		    end
		    else if (board[6][0] && board[8][0]) begin
		      out = 7;
		    end
		    else begin
		      out = 6;
		    end
		  end
		  else if (col1_sum == 2) begin
		    if (board[0][0] == 1 && board[3][0]) begin
		      out = 6;
		    end
		    else if (board[0][0] && board[6][0]) begin
		      out = 3;
		    end
		    else begin
		      out = 0;
		    end
		  end
		  else if (col2_sum == 2) begin
		    if (board[2][0] == 1 && board[5][0]) begin
		      out = 8;
		    end
		    else if (board[2][0] && board[8][0]) begin
		      out = 5;
		    end
		    else begin
		      out = 2;
		    end
		  end
		  else begin
		    if ((board[2][0] && board[3][0]) || (board[1][0] && board[6][0])) begin
		      out = 0;
		    end
			 else if (board[8][0]) begin
			   out = 5;
			 end
		    else if (board[5][0]) begin
		      out = 1;
		    end
		    else begin
		      out = 3;
		    end
		  end
      end
	 
	   else if (choice1 == 4) begin
	     if (board[4][0]) begin
		    out = 0;
		  end
		  else if (board[6][0]) begin
		    out = 8;
		  end
		  else begin
		    out = 6;
		  end
      end
	 
      else if (choice1 == 3) begin
        if (board[3][0]) begin
	       out = 4;
	     end
	     else if (board[0][0] || board[1][0] || board[4][0]) begin
	       out = 3;
	     end
	     else begin
	       out = 0;
        end
      end
	 
      else if (choice1 == 2 && board[1][0]) begin
        if (board[2][0]) begin
          out = 3;
        end
	     else if (board[4][0]) begin
	       out = 7;
	     end
	     else if (board[5][0]) begin
	       out = 6;
	     end
	     else begin
	       out = 4;
	     end
      end
	 
      else if (choice1 == 2 && board[3][0]) begin
        if (board[4][0]) begin
	       out = 5;
        end
	     else if (board[6][0]) begin
	       out = 1;
	     end
	     else if (board[7][0] || board[8][0]) begin
	       out = 2;
	     end
	     else begin
	       out = 4;
	     end
      end
	 
      else begin
        if (board[1][0]) begin
	       out = 7;
	     end
        else if (board[2][0]) begin
	       out = 6;
	     end
	     else if (board[3][0]) begin
	       out = 5;
	     end
	     else if (board[5][0]) begin
	       out = 3;
	     end
	     else if (board[7][0]) begin
	       out = 1;
	     end
	     else begin
	       out = 2;
	     end
      end
    end
  
    else begin                                                                     //Turn 3,4,5
      if (row1_sum == 2 && ~board[0][0] && ~board[1][0] && ~board[2][0]) begin    //Win
	     if (board[0][1] == 0) begin
		    out = 0;
		  end
		  else if (board[1][1] == 0) begin
		    out = 1;
		  end
		  else begin
		    out = 2;
		  end
      end
	   else if (row2_sum == 2 && ~board[3][0] && ~board[4][0] && ~board[5][0]) begin
	     if (board[3][1] == 0) begin
		    out = 3;
		  end
		  else if (board[4][1] == 0) begin
		    out = 4;
		  end
		  else begin
		    out = 5;
		  end
      end
	   else if (row3_sum == 2 && ~board[6][0] && ~board[7][0] && ~board[8][0]) begin
	     if (board[6][1] == 0) begin
		    out = 6;
		  end
		  else if (board[7][1] == 0) begin
		    out = 7;
		  end
		  else begin
		    out = 8;
		  end
      end
	   else if (col1_sum == 2 && ~board[0][0] && ~board[3][0] && ~board[6][0]) begin
	     if (board[0][1] == 0) begin
		    out = 0;
		  end
		  else if (board[3][1] == 0) begin
		    out = 3;
		  end
		  else begin
		    out = 6;
		  end
      end
	   else if (col2_sum == 2 && ~board[1][0] && ~board[4][0] && ~board[7][0]) begin
	     if (board[1][1] == 0) begin
		    out = 1;
		  end
		  else if (board[4][1] == 0) begin
		    out = 4;
		  end
		  else begin
		    out = 7;
		  end
      end
	   else if (col3_sum == 2 && ~board[2][0] && ~board[5][0] && ~board[8][0]) begin
	     if (board[2][1] == 0) begin
		    out = 2;
		  end
		  else if (board[5][1] == 0) begin
		    out = 5;
		  end
		  else begin
		    out = 8;
		  end
      end
	   else if (diag1_sum == 2 && ~board[0][0] && ~board[4][0] && ~board[8][0]) begin
	     if (board[0][1] == 0) begin
		    out = 0;
		  end
		  else if (board[4][1] == 0) begin
		    out = 4;
		  end 
		  else begin
		    out = 8;
		  end
      end
	   else if (diag2_sum == 2 && ~board[2][0] && ~board[4][0] && ~board[6][0]) begin
	     if (board[2][1] == 0) begin
		    out = 2;
		  end
		  else if (board[4][1] == 0) begin
		    out = 4;
		  end
		  else begin
		    out = 6;
		  end
      end
	 
	   else if (row1_sum == 2 && ~(board[0][0] ^ board[1][0] ^ board[2][0])) begin    //Block
	     if (board[0][1] == 0) begin
		    out = 0;
		  end
		  else if (board[1][1] == 0) begin
		    out = 1;
		  end
		  else begin
		    out = 2;
		  end
      end
	   else if (row2_sum == 2 && ~(board[3][0] ^ board[4][0] ^ board[5][0])) begin
	     if (board[3][1] == 0) begin
		    out = 3;
		  end
		  else if (board[4][1] == 0) begin
		    out = 4;
		  end
		  else begin
		    out = 5;
		  end
      end
	   else if (row3_sum == 2 && ~(board[6][0] ^ board[7][0] ^ board[8][0])) begin
	     if (board[6][1] == 0) begin
		    out = 6;
		  end
		  else if (board[7][1] == 0) begin
		    out = 7;
		  end
		  else begin
		    out = 8;
		  end
      end
	   else if (col1_sum == 2 && ~(board[0][0] ^ board[3][0] ^ board[6][0])) begin
	     if (board[0][1] == 0) begin
		    out = 0;
		  end
		  else if (board[3][1] == 0) begin
		    out = 3;
		  end
		  else begin
		    out = 6;
		  end
      end
	   else if (col2_sum == 2 && ~(board[1][0] ^ board[4][0] ^ board[7][0])) begin
	     if (board[1][1] == 0) begin
		    out = 1;
		  end
		  else if (board[4][1] == 0) begin
		    out = 4;
		  end
		  else begin
		    out = 7;
		  end
      end
	   else if (col3_sum == 2 && ~(board[2][0] ^ board[5][0] ^ board[8][0])) begin
	     if (board[2][1] == 0) begin
		    out = 2;
		  end
		  else if (board[5][1] == 0) begin
		    out = 5;
		  end
		  else begin
		    out = 8;
		  end
      end
	   else if (diag1_sum == 2 && ~(board[0][0] ^ board[4][0] ^ board[8][0])) begin
	     if (board[0][1] == 0) begin
		    out = 0;
		  end
		  else if (board[4][1] == 0) begin
		    out = 4;
		  end
		  else begin
		    out = 8;
		  end
      end
	   else if (diag2_sum == 2 && ~(board[2][0] ^ board[4][0] ^ board[6][0])) begin
	     if (board[2][1] == 0) begin
		    out = 2;
		  end
		  else if (board[4][1] == 0) begin
		    out = 4;
		  end
		  else begin
		    out = 6;
		  end
      end
	 
	   else if (row1_sum == 1 && ~board[0][0] && ~board[1][0] && ~board[2][0]) begin    //Get 2 in a row
	     if (board[0][1] == 0) begin
		    out = 0;
		  end
		  else if (board[1][1] == 0) begin
		    out = 1;
		  end
		  else begin
		    out = 2;
		  end
      end
	   else if (row2_sum == 1 && ~board[3][0] && ~board[4][0] && ~board[5][0]) begin
	     if (board[3][1] == 0) begin
		    out = 3;
		  end
		  else if (board[4][1] == 0) begin
		    out = 4;
		  end
		  else begin
		    out = 5;
		  end
      end
	   else if (row3_sum == 1 && ~board[6][0] && ~board[7][0] && ~board[8][0]) begin
	     if (board[6][1] == 0) begin
		    out = 6;
		  end
		  else if (board[7][1] == 0) begin
		    out = 7;
		  end
		  else begin
		    out = 8;
		  end
      end
	   else if (col1_sum == 1 && ~board[0][0] && ~board[3][0] && ~board[6][0]) begin
	     if (board[0][1] == 0) begin
		    out = 0;
		  end
		  else if (board[3][1] == 0) begin
		    out = 3;
		  end
		  else begin
		    out = 6;
		  end
      end
	   else if (col2_sum == 1 && ~board[1][0] && ~board[4][0] && ~board[7][0]) begin
	     if (board[1][1] == 0) begin
		    out = 1;
		  end
		  else if (board[4][1] == 0) begin
		    out = 4;
		  end
		  else begin
		    out = 7;
		  end
      end
	   else if (col3_sum == 1 && ~board[2][0] && ~board[5][0] && ~board[8][0]) begin
	     if (board[2][1] == 0) begin
		    out = 2;
		  end
		  else if (board[5][1] == 0) begin
		    out = 5;
		  end
		  else begin
		    out = 8;
		  end
      end
	   else if (diag1_sum == 1 && ~board[0][0] && ~board[4][0] && ~board[8][0]) begin
	     if (board[0][1] == 0) begin
		    out = 0;
		  end
		  else if (board[4][1] == 0) begin
		    out = 4;
		  end
		  else begin
		    out = 8;
		  end
      end
	   else if (diag2_sum == 1 && ~board[2][0] && ~board[4][0] && ~board[6][0]) begin               //Switch 2 and 4
	     if (board[4][1] == 0) begin
		    out = 4;
		  end
		  else if (board[2][1] == 0) begin
		    out = 2;
		  end
		  else begin
		    out = 6;
		  end
      end
	 
	   else if (~board[0][1]) begin                                                 //Place "Random" Corner/Edge/Center
	     out = 0;
      end
	   else if (~board[2][1]) begin
	     out = 2;
      end
	   else if (~board[6][1]) begin
	     out = 6;
      end
	   else if (~board[8][1]) begin
	     out = 8;
      end
	   else if (~board[1][1]) begin
	     out = 1;
      end
	   else if (~board[3][1]) begin
	     out = 3;
      end
	   else if (~board[5][1]) begin
	     out = 5;
      end
	   else if (~board[7][1]) begin
	     out = 7;
      end
	   else begin
	     out = 4;
      end
    end
	 
	 out = out + 1;
	 
	 if (out == 11) begin
	   out = 0;
    end
  
  end     //Always
	 
endmodule
