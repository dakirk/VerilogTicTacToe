`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:44:27 12/07/2018 
// Design Name: 
// Module Name:    format_board_state 
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
module format_board_state(reset, boardArr, redPos, bluePos);
	input reset;
	input [17:0] boardArr;
	output reg [8:0] redPos;
	output reg [8:0] bluePos;
	integer i;

	always @(*) begin
		if (reset) begin
		
			//wipe everything
			for (i = 0; i < 9; i = i + 1) begin
				bluePos[i] <= 0;
				redPos[i] <= 0;
			end
			
		end else begin
		
			//iterate through tiles to determine which are where
			for (i = 0; i < 9; i = i+1) begin
				if (boardArr[2*i+1] == 1) begin
				
					//if tile is blue
					if (boardArr[2*i] == 0) begin
						bluePos[i] <= 1;
						redPos[i] <= 0;
					end 
					
					//if tile is red
					else begin
						bluePos[i] <= 0;
						redPos[i] <= 1;
					end
				end 
				
				//if tile is unoccupied
				else begin
					bluePos[i] <= 0;
					redPos[i] <= 0;
				end
			end
		end
	end
	
	

endmodule
