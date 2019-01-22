`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Engineer: Lorenzo Kinnicutt
// 
// Create Date:    13:30:28 12/08/2018 
// Module Name:    board_state_checker 
// Project Name:   EC311 Final (Project)
//
//////////////////////////////////////////////////////////////////////////////////
module board_state_checker(board_in,X_win, O_win, tie);
  
  input [17:0] board_in;
  // Input "board_in" is an 18-bit array 
  // This array can be regarded as 9 sets of 2 bits
  // The first bit of each set represents if that board space is occupied (occupied is logic 1, unoccupied is logic 0)
  // The second bit of each set represents the piece that occupies that board space (only matters if occupation bit is 1)
     // If the second bit of a set is 1, it is occupied by an X; If the second bit of a set is 0, it is occupied by a O
     // If the first bit of a set is logic 0, the second bit of the set is a don't-care
  reg [1:0] space_0, space_1, space_2, space_3, space_4, space_5, space_6, space_7, space_8; 
  // Each of the aforementioned "sets" will be assigned to one of the above variables 
  // This will improve the readability of the code and facilitate debugging
  output reg X_win, O_win, tie;
  // If X has won a game, X_win == 1
  // If O has won a game, O_win == 1
  // If the end result of a game is a tie, tie == 1

  always @ (board_in) begin 
  
    space_0[0] = board_in[16];
    space_0[1] = board_in[17];
    // 2-bit array space_0 holds all information about spot 0 on board
    space_1[0] = board_in[14];
    space_1[1] = board_in[15];
    // 2-bit array space_1 holds all information about spot 1 on board
    space_2[0] = board_in[12];
    space_2[1] = board_in[13];
    // 2-bit array space_2 holds all information about spot 2 on board
    space_3[0] = board_in[10];
    space_3[1] = board_in[11];
    // 2-bit array space_3 holds all information about spot 3 on board
    space_4[0] = board_in[8];
    space_4[1] = board_in[9];
    // 2-bit array space_4 holds all information about spot 4 on board
    space_5[0] = board_in[6];
    space_5[1] = board_in[7];
    // 2-bit array space_5 holds all information about spot 5 on board
    space_6[0] = board_in[4];
    space_6[1] = board_in[5];
    // 2-bit array space_6 holds all information about spot 6 on board
    space_7[0] = board_in[2];
    space_7[1] = board_in[3];
    // 2-bit array space_7 holds all information about spot 7 on board
    space_8[0] = board_in[0];
    space_8[1] = board_in[1];
    // 2-bit array space_8 holds all information about spot 8 on board

    if (space_0 == 2'b11 && space_1 == 2'b11 && space_2 == 2'b11) begin
	   X_win <= 1;
	 // Three Xs in first row -> X wins 
	 end else if (space_3 == 2'b11 && space_4 == 2'b11 && space_5 == 2'b11) begin
      X_win <= 1;		
	 // Three Xs in second row -> X wins 
    end else if (space_6 == 2'b11 && space_7 == 2'b11 && space_8 == 2'b11) begin
      X_win <= 1;	
    // Three Xs in third row -> X wins 
    end else if (space_0 == 2'b11 && space_3 == 2'b11 && space_6 == 2'b11) begin
      X_win <= 1;	
	 // Three Xs in first column -> X wins 
    end else if (space_1 == 2'b11 && space_4 == 2'b11 && space_7 == 2'b11) begin
      X_win <= 1;	
	 // Three Xs in second column -> X wins 
    end else if (space_2 == 2'b11 && space_5 == 2'b11 && space_8 == 2'b11) begin
      X_win <= 1;
	 // Three Xs in third column -> X wins 
    end else if (space_0 == 2'b11 && space_4 == 2'b11 && space_8 == 2'b11) begin
      X_win <= 1;
	 // Three Xs in left diagonal -> X wins 
    end else if (space_2 == 2'b11 && space_4 == 2'b11 && space_6 == 2'b11) begin
      X_win <= 1;
	 // Three Xs in right diagonal -> X wins 

	 // ALL POSSIBLE CONDITIONS FOR X VICTORY HAVE BEEN ACCOUNTED FOR  

    end else if (space_0 == 2'b10 && space_1 == 2'b10 && space_2 == 2'b10) begin
	   O_win <= 1;
	 // Three Os in first row -> O wins
	 end else if (space_3 == 2'b10 && space_4 == 2'b10 && space_5 == 2'b10) begin
      O_win <= 1;	
    // Three Os in second row -> O wins		
    end else if (space_6 == 2'b10 && space_7 == 2'b10 && space_8 == 2'b10) begin
      O_win <= 1;	
	 // Three Os in third row -> O wins
    end else if (space_0 == 2'b10 && space_3 == 2'b10 && space_6 == 2'b10) begin
      O_win <= 1;	
	 // Three Os in first column -> O wins
    end else if (space_1 == 2'b10 && space_4 == 2'b10 && space_7 == 2'b10) begin
      O_win <= 1;	
	 // Three Os in second column -> O wins
    end else if (space_2 == 2'b10 && space_5 == 2'b10 && space_8 == 2'b10) begin
      O_win <= 1;
	 // Three Os in third column -> O wins
    end else if (space_0 == 2'b10 && space_4 == 2'b10 && space_8 == 2'b10) begin
      O_win <= 1;
	 // Three Os in left diagonal -> O wins
    end else if (space_2 == 2'b10 && space_4 == 2'b10 && space_6 == 2'b10) begin
      O_win <= 1;
	 // Three Os in right diagonal -> O wins

	 // ALL POSSIBLE CONDITIONS FOR O VICTORY HAVE BEEN ACCOUNTED FOR  

	 end else if (space_0[1] == 1'b1 && space_1[1] == 1'b1 && space_2[1] == 1'b1 && space_3[1] == 1'b1 
	 && space_4[1] == 1'b1 && space_5[1] == 1'b1 && space_6[1] == 1'b1 && space_7[1] == 1'b1 && space_8[1] == 1'b1) begin
	   tie <= 1;
	 // If none of the previous sixteen conditions have been satisfied and all spaces are occupied,
	 // the game is declared as a tie 
	 end else begin 
	   X_win <= 0;
		O_win <= 0; 
		tie <= 0;
	 end
  end 
endmodule 