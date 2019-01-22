`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:51:25 12/08/2018 
// Design Name: 
// Module Name:    board_state_control 
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
module board_state_control(position,xwin,owin,tie,clk,reset,turn,board_state);
  input xwin,owin,tie,clk,reset;
  input [3:0] position;
  output reg turn;
  output reg [17:0] board_state;
  
  reg [17:0] board_next;
  reg turn_next;
  reg [3:0] valid;
  
  reg [1:0] board [8:0];
  
  always @(posedge clk or posedge reset) begin
    if (reset) begin
	   board_state <= 0;
		turn <= 0;
    end
	 else begin
	   board_state <= board_next;
		turn <= turn_next;
    end
  end
  
  always @(*) begin
    board[0] = board_state[1:0];
	 board[1] = board_state[3:2];
	 board[2] = board_state[5:4];
	 board[3] = board_state[7:6];
	 board[4] = board_state[9:8];
	 board[5] = board_state[11:10];
	 board[6] = board_state[13:12];
	 board[7] = board_state[15:14];
	 board[8] = board_state[17:16];
	 
	 valid = board[0][0] + board[1][0] + board[2][0] + board[3][0] + board[4][0] + board[5][0] + board[6][0] + board[7][0] + board[8][0];
	 
	 if (valid > 5) begin                                //Checking validity of board
	   board_next = 0;
		turn_next = 0;
    end
	 else if (position == 0 || position > 9 || xwin || owin || tie) begin
	   board_next = board_state;
		turn_next = turn;
    end
	 
	 
	 else if (position == 1) begin                    //Position 1
	   if (board[0][1] == 1) begin
		  board_next = board_state;
		  turn_next = turn;
		end
		else if (turn == 0) begin
		  board_next = board_state;
		  board_next[1:0] =  2'b11;
		  turn_next = ~turn;
		end
		else begin
		  board_next = board_state;
		  board_next[1:0] = 2'b10;
		  turn_next = ~turn;
	   end
	 end
		
	 else if (position == 2) begin                    //Position 2
	   if (board[1][1] == 1) begin
		  board_next = board_state;
		  turn_next = turn;
		end
		else if (turn == 0) begin
		  board_next = board_state;
		  board_next[3:2] = 2'b11;
		  turn_next = ~turn;
		end
		else begin
		  board_next = board_state;
		  board_next[3:2] =  2'b10;
		  turn_next = ~turn;
	   end
	 end
		
	 else if (position == 3) begin                    //Position 3
	   if (board[2][1] == 1) begin
		  board_next = board_state;
		  turn_next = turn;
		end
		else if (turn == 0) begin
		  board_next = board_state;
		  board_next[5:4] = 2'b11;
		  turn_next = ~turn;
		end
		else begin
		  board_next = board_state;
		  board_next[5:4] = 2'b10;
		  turn_next = ~turn;
	   end
	 end
		
		else if (position == 4) begin                    //Position 4
	   if (board[3][1] == 1) begin
		  board_next = board_state;
		  turn_next = turn;
		end
		else if (turn == 0) begin
		  board_next = board_state;
		  board_next[7:6] = 2'b11;
		  turn_next = ~turn;
		end
		else begin
		  board_next = board_state;
		  board_next[7:6] = 2'b10;
		  turn_next = ~turn;
	   end
	 end
		
	 else if (position == 5) begin                    //Position 5
	   if (board[4][1] == 1) begin
		  board_next = board_state;
		  turn_next = turn;
		end
		else if (turn == 0) begin
		  board_next = board_state;
		  board_next[9:8] = 2'b11;
		  turn_next = ~turn;
		end
		else begin
		  board_next = board_state;
		  board_next[9:8] = 2'b10;
		  turn_next = ~turn;
	   end
	 end
		
	 else if (position == 6) begin                    //Position 6
	   if (board[5][1] == 1) begin
		  board_next = board_state;
		  turn_next = turn;
		end
		else if (turn == 0) begin
		  board_next = board_state;
		  board_next[11:10] = 2'b11;
		  turn_next = ~turn;
		end
		else begin
		  board_next = board_state;
		  board_next[11:10] = 2'b10;
		  turn_next = ~turn;
	   end
	 end
		
	 else if (position == 7) begin                    //Position 7
	   if (board[6][1] == 1) begin
		  board_next = board_state;
		  turn_next = turn;
		end
		else if (turn == 0) begin
		  board_next = board_state;
		  board_next[13:12] = 2'b11;
		  turn_next = ~turn;
		end
		else begin
		  board_next = board_state;
		  board_next[13:12] = 2'b10;
		  turn_next = ~turn;
	   end
	 end
		
	 else if (position == 8) begin                    //Position 8
	   if (board[7][1] == 1) begin
		  board_next = board_state;
		  turn_next = turn;
		end
		else if (turn == 0) begin
		  board_next = board_state;
		  board_next[15:14] = 2'b11;
		  turn_next = ~turn;
		end
		else begin
		  board_next = board_state;
		  board_next[15:14] = 2'b10;
		  turn_next = ~turn;
	   end
	 end
		
	 else if (position == 9) begin                    //Position 9
	   if (board[8][1] == 1) begin
		  board_next = board_state;
		  turn_next = turn;
		end
		else if (turn == 0) begin
		  board_next = board_state;
		  board_next[17:16] = 2'b11;
		  turn_next = ~turn;
		end
		else begin
		  board_next = board_state;
		  board_next[17:16] = 2'b10;
		  turn_next = ~turn;
	   end
	 end
	 
	 else begin
	   board_next = 0;
		turn_next = 0;
    end
	 
  end
	 
endmodule
