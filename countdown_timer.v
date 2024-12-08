module countdown_timer(clk, reset, load, run, sw_time, time_left, time_set, done);
	input clk, reset, load, run;
	input [5:0] sw_time;
	output reg [5:0] time_set, time_left;
	output reg done;

	always @(posedge clk or posedge reset) begin
		if (reset) begin
			time_left <= 0;
			time_set <= 0;
			done <= 0;
		end else if (load) begin
			time_set <= sw_time;
			time_left <= time_set;
			done <= 0;
		end else if (run) begin
			if (time_left > 0) begin
				time_left <= time_left - 1;
				done <= 0;
			end else begin
				done<= 1;
			end
		end
	end
endmodule