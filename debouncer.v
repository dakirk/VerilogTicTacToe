`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:06:54 12/09/2018 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(clk, reset, signal, out);
    input clk, reset, signal;
    output reg out = 1'b0;
    reg [31:0] counterVal = 32'd0;
    always @(posedge clk) begin
   	 if (reset || !signal) begin //if no signal or reset
   		 counterVal <= 32'd0;
   		 out <= 1'b0;
   	 end else if (counterVal == 32'd1000000) begin //if reached max
   		 out <= 1'b1;
   		 counterVal <= counterVal + 32'd1;
   	 end else if (signal) begin //if there is a signal
   		 counterVal <= counterVal + 32'd1;
   		 out <= 1'b0;
   	 end
    end
endmodule

