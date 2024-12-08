module display(time_left, HEX0, HEX1);
	input [5:0] time_left;
	output [6:0] HEX0, HEX1;
	
	wire [3:0] tens, ones;
	
	assign tens = time_left / 10;
	assign ones = time_left % 10;
	
	seg7 tensDisp(
		.A(tens),
		.HEX0(HEX1)
	);
	
		seg7 onesDisp(
		.A(ones),
		.HEX0(HEX0)
	);
endmodule