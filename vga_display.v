module vga_display(
  input rst,
  input clk,
  input [5:0] switch,
  input button,
  input player_num,

  output [2:0]R,
  output [2:0]G,
  output [1:0]B,
  output HS,
  output VS,
  output reg light
  );
  
  
  wire redWin, blueWin, tie;
  wire [10:0] hcount, vcount;
  wire blank;
  wire [3:0] player_choice;
  wire [3:0] computer_choice,computer_temp;
  wire clk_25Mhz;
  wire [17:0] boardArr;
  wire turn;
  wire [8:0] redPos, bluePos;
  wire buttonClean;
  
  reg [3:0] position;
  reg [8:0] highlight;
  
  clock_divider clk_div_25 (
   .clock_in(clk),
   .reset(rst),
   .clock_out(clk_25Mhz)
  );
  
  debouncer deb(
	 .clk(clk),
	 .reset(rst),
	 .signal(button),
	 .out(buttonClean)
  );
  
  debouncer2 deb2(
	 .clk(clk),
	 .reset(rst),
	 .signal(computer_temp),
    .out(computer_choice)
  );

  vga_controller_640_60 vc(
    .rst(rst),
	 .pixel_clk(clk_25Mhz),
	 .HS(HS),
	 .VS(VS),
	 .hcounter(hcount),
	 .vcounter(vcount),
	 .blank(blank)
  );
  
  format_board_state boardFormatter(
	 .reset(rst),
	 .boardArr(boardArr),
	 .redPos(redPos),
	 .bluePos(bluePos)
  );
  
  Player_input p1(
    .switch(switch), 
    .button(buttonClean), 
	 .clk(clk),
    .reset(rst),	 
	 .choice(player_choice)
  );
  
  comp_input c1( 
    .board_in(boardArr), 
	 .play(player_num),
    .clk(clk),
    .reset(rst),
    .choice(computer_temp)
	);
  
  board_state_control control(
    .position(position),
    .xwin(redWin),
    .owin(blueWin),
    .tie(tie),	 
    .clk(clk_25Mhz), 
    .reset(rst), 
    .turn(turn), 
    .board_state(boardArr)
  );
  
  board_state_checker state(
    .board_in(boardArr), 
    .X_win(redWin), 
    .O_win(blueWin), 
    .tie(tie)
  );
  
 
  always @(posedge clk_25Mhz) begin
    light <= ~blank;
  end
  
  //determine location of highlight box
  always @(*) begin
    case (switch)
	   6'b100100: highlight = 9'b000000001;
		6'b100010: highlight = 9'b000000010;
		6'b100001: highlight = 9'b000000100;
		6'b010100: highlight = 9'b000001000;
		6'b010010: highlight = 9'b000010000;
		6'b010001: highlight = 9'b000100000;
		6'b001100: highlight = 9'b001000000;
		6'b001010: highlight = 9'b010000000;
		6'b001001: highlight = 9'b100000000;
		default: highlight = 9'b000000000;
    endcase
  end
    
  always @ (*) begin
	 if (player_num && turn) begin
	   position = computer_choice;
	 end
	 else begin
		position = player_choice;
	 end
	end
		
  wire board, redTiles, blueTiles;
  wire [8:0] redEnable, blueEnable;  
  assign redEnable = redPos;
  assign blueEnable = bluePos;
  
  //determine board limits
  assign board = (((hcount > 240) & (vcount > 70) & (hcount < 250) & (vcount < 390)) | //vertical left line
						((hcount > 350) & (vcount > 70) & (hcount < 360) & (vcount < 390)) | //vertical right line
						((hcount > 140) & (vcount > 170) & (hcount < 460) & (vcount < 180)) | //horizontal top line
						((hcount > 140) & (vcount > 280) & (hcount < 460) & (vcount < 290))) ? 1 : 0; //horizontal bottom line
				
  //determine all possible red tile positions				
  assign redTiles = (((redEnable[0]) & (hcount > 150) & (vcount > 80) & (hcount < 230) & (vcount < 160) & (((hcount > vcount+60) & (hcount < vcount+80)) | ((hcount + vcount > 300) & (hcount + vcount < 320)))) |
							((redEnable[1]) & (hcount > 260) & (vcount > 80) & (hcount < 340) & (vcount < 160) & (((hcount > vcount+170) & (hcount < vcount+190)) | ((hcount + vcount > 410) & (hcount + vcount < 430)))) |
							((redEnable[2]) & (hcount > 370) & (vcount > 80) & (hcount < 450) & (vcount < 160) & (((hcount > vcount+280) & (hcount < vcount+300)) | ((hcount + vcount > 520) & (hcount + vcount < 540)))) |
							((redEnable[3]) & (hcount > 150) & (vcount > 190) & (hcount < 230) & (vcount < 270) & (((hcount > vcount-50) & (hcount < vcount-30)) | ((hcount + vcount > 410) & (hcount + vcount < 430)))) |
							((redEnable[4]) & (hcount > 260) & (vcount > 190) & (hcount < 340) & (vcount < 270) & (((hcount > vcount+60) & (hcount < vcount+80)) | ((hcount + vcount > 520) & (hcount + vcount < 540)))) |
							((redEnable[5]) & (hcount > 370) & (vcount > 190) & (hcount < 450) & (vcount < 270) & (((hcount > vcount+170) & (hcount < vcount+190)) | ((hcount + vcount > 630) & (hcount + vcount < 650)))) |
							((redEnable[6]) & (hcount > 150) & (vcount > 300) & (hcount < 230) & (vcount < 380) & (((hcount > vcount-160) & (hcount < vcount-140)) | ((hcount + vcount > 520) & (hcount + vcount < 540)))) |
							((redEnable[7]) & (hcount > 260) & (vcount > 300) & (hcount < 340) & (vcount < 380) & (((hcount > vcount-50) & (hcount < vcount-30)) | ((hcount + vcount > 630) & (hcount + vcount < 650)))) |
							((redEnable[8]) & (hcount > 370) & (vcount > 300) & (hcount < 450) & (vcount < 380) & (((hcount > vcount+60) & (hcount < vcount+80)) | ((hcount + vcount > 740) & (hcount + vcount < 760)))) |
							
							//selection highlight box
							((~turn & ~redWin & ~blueWin & ~tie) & (((highlight[0]) & (hcount > 140) & (vcount > 70) & (hcount < 240) & (vcount < 170) & ~((hcount > 150) & (vcount > 80) & (hcount < 230) & (vcount < 160))) |
							((highlight[1]) & (hcount > 250) & (vcount > 70) & (hcount < 350) & (vcount < 170) & ~((hcount > 260) & (vcount > 80) & (hcount < 340) & (vcount < 160))) |
							((highlight[2]) & (hcount > 360) & (vcount > 70) & (hcount < 460) & (vcount < 170) & ~((hcount > 370) & (vcount > 80) & (hcount < 450) & (vcount < 160))) |
							((highlight[3]) & (hcount > 140) & (vcount > 180) & (hcount < 240) & (vcount < 280) & ~((hcount > 150) & (vcount > 190) & (hcount < 230) & (vcount < 270))) |
							((highlight[4]) & (hcount > 250) & (vcount > 180) & (hcount < 350) & (vcount < 280) & ~((hcount > 260) & (vcount > 190) & (hcount < 340) & (vcount < 270))) |
							((highlight[5]) & (hcount > 360) & (vcount > 180) & (hcount < 460) & (vcount < 280) & ~((hcount > 370) & (vcount > 190) & (hcount < 450) & (vcount < 270))) |
							((highlight[6]) & (hcount > 140) & (vcount > 290) & (hcount < 240) & (vcount < 390) & ~((hcount > 150) & (vcount > 300) & (hcount < 230) & (vcount < 380))) |
							((highlight[7]) & (hcount > 250) & (vcount > 290) & (hcount < 350) & (vcount < 390) & ~((hcount > 260) & (vcount > 300) & (hcount < 340) & (vcount < 380))) |
							((highlight[8]) & (hcount > 360) & (vcount > 290) & (hcount < 460) & (vcount < 390) & ~((hcount > 370) & (vcount > 300) & (hcount < 450) & (vcount < 380))))) |
							
							((redWin) & (((hcount > 245) & (vcount > 400) & (hcount < 255) & (vcount < 436)) |
							((hcount >= 255) & (vcount >= 436) & (hcount <= 265) & (vcount < 448)) |
							((hcount >= 265) & (vcount > 424) & (hcount <= 275) & (vcount <= 436)) |
							((hcount >= 275) & (vcount > 436) & (hcount <= 285) & (vcount < 448)) |
							((hcount > 285) & (vcount > 400) & (hcount < 295) & (vcount < 436)) | //w
							((hcount > 300) & (vcount > 400) & (hcount < 310) & (vcount < 448)) | //i
							((hcount > 315) & (vcount > 400) & (hcount < 325) & (vcount < 448)) |
							((hcount >= 325) & (vcount > 412) & (hcount <= 335) & (vcount <= 424)) |
							((hcount >= 335) & (vcount >= 424) & (hcount <= 345) & (vcount < 436)) | 
							((hcount > 345) & (vcount > 400) & (hcount < 355) & (vcount < 448)))) | //n
							
							((tie & ~redWin) & (((hcount > 260) & (vcount > 400) & (hcount < 290) & (vcount < 412)) |
							((hcount > 270) & (vcount > 400) & (hcount < 280) & (vcount < 448)) | //t
							((hcount > 295) & (vcount > 400) & (hcount < 305) & (vcount < 448)) | //i
							((hcount > 310) & (vcount > 400) & (hcount < 320) & (vcount < 448)) | 
							((hcount > 310) & (vcount > 400) & (hcount < 340) & (vcount < 412)) |
							((hcount > 310) & (vcount > 418) & (hcount < 330) & (vcount < 430)) | //e
							((hcount > 310) & (vcount > 436) & (hcount < 340) & (vcount < 448))))) ? 1 : 0;
	
  //determine all possible blue tile positions
  assign blueTiles = (((blueEnable[0]) & ((hcount-190)*(hcount-190) + (vcount-120)*(vcount-120) < 1600) & ((hcount-190)*(hcount-190) + (vcount-120)*(vcount-120) > 900)) |
							 ((blueEnable[1]) & ((hcount-300)*(hcount-300) + (vcount-120)*(vcount-120) < 1600) & ((hcount-300)*(hcount-300) + (vcount-120)*(vcount-120) > 900)) |
							 ((blueEnable[2]) & ((hcount-410)*(hcount-410) + (vcount-120)*(vcount-120) < 1600) & ((hcount-410)*(hcount-410) + (vcount-120)*(vcount-120) > 900)) |
							 ((blueEnable[3]) & ((hcount-190)*(hcount-190) + (vcount-230)*(vcount-230) < 1600) & ((hcount-190)*(hcount-190) + (vcount-230)*(vcount-230) > 900)) |
							 ((blueEnable[4]) & ((hcount-300)*(hcount-300) + (vcount-230)*(vcount-230) < 1600) & ((hcount-300)*(hcount-300) + (vcount-230)*(vcount-230) > 900)) |
							 ((blueEnable[5]) & ((hcount-410)*(hcount-410) + (vcount-230)*(vcount-230) < 1600) & ((hcount-410)*(hcount-410) + (vcount-230)*(vcount-230) > 900)) |
							 ((blueEnable[6]) & ((hcount-190)*(hcount-190) + (vcount-340)*(vcount-340) < 1600) & ((hcount-190)*(hcount-190) + (vcount-340)*(vcount-340) > 900)) |
							 ((blueEnable[7]) & ((hcount-300)*(hcount-300) + (vcount-340)*(vcount-340) < 1600) & ((hcount-300)*(hcount-300) + (vcount-340)*(vcount-340) > 900)) |
							 ((blueEnable[8]) & ((hcount-410)*(hcount-410) + (vcount-340)*(vcount-340) < 1600) & ((hcount-410)*(hcount-410) + (vcount-340)*(vcount-340) > 900)) |
							 
							 //selection highlight box
							 ((turn & ~player_num & ~redWin & ~blueWin & ~tie) & (((highlight[0]) & (hcount > 140) & (vcount > 70) & (hcount < 240) & (vcount < 170) & ~((hcount > 150) & (vcount > 80) & (hcount < 230) & (vcount < 160))) |
							 ((highlight[1]) & (hcount > 250) & (vcount > 70) & (hcount < 350) & (vcount < 170) & ~((hcount > 260) & (vcount > 80) & (hcount < 340) & (vcount < 160))) |
							 ((highlight[2]) & (hcount > 360) & (vcount > 70) & (hcount < 460) & (vcount < 170) & ~((hcount > 370) & (vcount > 80) & (hcount < 450) & (vcount < 160))) |
							 ((highlight[3]) & (hcount > 140) & (vcount > 180) & (hcount < 240) & (vcount < 280) & ~((hcount > 150) & (vcount > 190) & (hcount < 230) & (vcount < 270))) |
							 ((highlight[4]) & (hcount > 250) & (vcount > 180) & (hcount < 350) & (vcount < 280) & ~((hcount > 260) & (vcount > 190) & (hcount < 340) & (vcount < 270))) |
							 ((highlight[5]) & (hcount > 360) & (vcount > 180) & (hcount < 460) & (vcount < 280) & ~((hcount > 370) & (vcount > 190) & (hcount < 450) & (vcount < 270))) |
							 ((highlight[6]) & (hcount > 140) & (vcount > 290) & (hcount < 240) & (vcount < 390) & ~((hcount > 150) & (vcount > 300) & (hcount < 230) & (vcount < 380))) |
							 ((highlight[7]) & (hcount > 250) & (vcount > 290) & (hcount < 350) & (vcount < 390) & ~((hcount > 260) & (vcount > 300) & (hcount < 340) & (vcount < 380))) |
							 ((highlight[8]) & (hcount > 360) & (vcount > 290) & (hcount < 460) & (vcount < 390) & ~((hcount > 370) & (vcount > 300) & (hcount < 450) & (vcount < 380))))) |
							 
							 ((blueWin) & (((hcount > 245) & (vcount > 400) & (hcount < 255) & (vcount < 436)) |
							 ((hcount >= 255) & (vcount >= 436) & (hcount <= 265) & (vcount < 448)) |
							 ((hcount >= 265) & (vcount > 424) & (hcount <= 275) & (vcount <= 436)) |
							 ((hcount >= 275) & (vcount > 436) & (hcount <= 285) & (vcount < 448)) |
							 ((hcount > 285) & (vcount > 400) & (hcount < 295) & (vcount < 436)) | //w
							 ((hcount > 300) & (vcount > 400) & (hcount < 310) & (vcount < 448)) | //i
							 ((hcount > 315) & (vcount > 400) & (hcount < 325) & (vcount < 448)) |
							 ((hcount >= 325) & (vcount > 412) & (hcount <= 335) & (vcount <= 424)) |
							 ((hcount >= 335) & (vcount >= 424) & (hcount <= 345) & (vcount < 436)) | //n
							 ((hcount > 345) & (vcount > 400) & (hcount < 355) & (vcount < 448)))) |
							 
							 ((tie & ~redWin) & (((hcount > 260) & (vcount > 400) & (hcount < 290) & (vcount < 412)) |
							 ((hcount > 270) & (vcount > 400) & (hcount < 280) & (vcount < 448)) | //t
							 ((hcount > 295) & (vcount > 400) & (hcount < 305) & (vcount < 448)) | //i
							 ((hcount > 310) & (vcount > 400) & (hcount < 320) & (vcount < 448)) | 
							 ((hcount > 310) & (vcount > 400) & (hcount < 340) & (vcount < 412)) |
							 ((hcount > 310) & (vcount > 418) & (hcount < 330) & (vcount < 430)) | //e
							 ((hcount > 310) & (vcount > 436) & (hcount < 340) & (vcount < 448))))) ? 1 : 0;
		  
  //render board and tiles
  assign R = 3'd7*redTiles;
  assign G = 3'd7*board;
  assign B = 2'd3*blueTiles;

 
endmodule
