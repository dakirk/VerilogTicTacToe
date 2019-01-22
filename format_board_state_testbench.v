`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:53:56 12/07/2018
// Design Name:   format_board_state
// Module Name:   X:/EC311/VGATest/format_board_state_testbench.v
// Project Name:  VGATest
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: format_board_state
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module format_board_state_testbench;

	// Inputs
	reg reset;
	reg [17:0] boardArr;

	// Outputs
	wire [8:0] redPos;
	wire [8:0] bluePos;

	// Instantiate the Unit Under Test (UUT)
	format_board_state uut ( 
		.reset(reset), 
		.boardArr(boardArr), 
		.redPos(redPos), 
		.bluePos(bluePos)
	);

	initial begin
		// Initialize Inputs
		reset = 1;
		boardArr = 0;

		// Wait 100 ns for global reset to finish
		#10;
		
		reset = 0;
        
		// Add stimulus here
		
		boardArr[2] = 1;
		boardArr[3] = 1;
		
		boardArr[6] = 0;
		boardArr[7] = 1;

	end
      
endmodule

