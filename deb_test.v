`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:49:35 12/09/2018
// Design Name:   debouncer
// Module Name:   X:/Desktop/VGATest/deb_test.v
// Project Name:  VGATest
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: debouncer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module deb_test;

	// Inputs
	reg clk;
	reg reset;
	reg signal;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	debouncer uut (
		.clk(clk), 
		.reset(reset), 
		.signal(signal), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		signal = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always begin
	  #10 clk = ~clk;
	end
      
endmodule

