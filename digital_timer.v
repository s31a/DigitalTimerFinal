module digital_timer(CLOCK_50, KEY, SW, LEDR, HEX0, HEX1);
	input CLOCK_50;
	input[3:0] KEY;
	input[5:0] SW;
	output[9:0] LEDR;
	output[6:0] HEX0, HEX1;
	
	wire clk, reset, start, load, run, done;
	wire [5:0] time_left, time_set;
	wire [6:0] spinnyThingy;
	
	assign reset = ~KEY[0];
	assign start = ~KEY[1];
	
	Hz_1 clkdiv(
		.C50(CLOCK_50),
		.clk1hz(clk)
	);
	
	timer_fsm fsm(
		.clk(clk),
		.reset(reset),
		.start(start),
		.state(),
		.load(load),
		.run(run),
		.done(done)
	);
	
	countdown_timer timer(
		.clk(clk),
		.reset(reset),
		.load(load),
		.run(run),
		.sw_time(SW),
		.time_left(time_left),
		.time_set(time_set),
		.done(done)
	);
	
	display disp(
		.time_left(time_left),
		.HEX0(HEX0),
		.HEX1(HEX1)
	);
	
	spinny spin(
		.clk(clk), 
		.reset(reset), 
		.run(run), 
		.spinnyThingy(spinnyThingy)
	);
	
	assign HEX5 = spinnyThingy;
	assign LEDR[9:0] = done ? 10'b1111111111 : 10'b0000000000;
endmodule