`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:23 12/08/2018 
// Design Name: 
// Module Name:    Player_input 
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
module Player_input(switch,button,clk,reset,choice);
  input [5:0] switch;
  input clk,reset,button;
  output reg [3:0] choice;
  
  reg [3:0] place;
  
  always @(posedge clk or posedge reset) begin
    if (reset) begin
	   choice <= 0;
	 end
    else if (button) begin
	   choice <= place;
    end
	 else if (place == 0) begin
	   choice <= 0;
    end
	 else begin
	   choice <= choice;
    end
  end
  
  always @(*) begin
    case (switch)
	   6'b100100: place = 1;
		6'b100010: place = 2;
		6'b100001: place = 3;
		6'b010100: place = 4;
		6'b010010: place = 5;
		6'b010001: place = 6;
		6'b001100: place = 7;
		6'b001010: place = 8;
		6'b001001: place = 9;
		default: place = 0;
    endcase
  end
endmodule
