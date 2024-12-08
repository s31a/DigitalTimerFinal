module timer_fsm(clk, reset, start, state, load, run, done);
	input clk, reset, start, done;
	output reg [1:0] state;
	output reg load, run;
	
	parameter INPUT = 2'b00, COUNTDOWN = 2'b01, FINISH = 2'b10;
	
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			state <= INPUT;
			load <= 1;
			run <= 0;
		end else begin
			case (state)
				INPUT: begin
					load <= 1;
					run <= 0;
					if (start) state <= COUNTDOWN;
				end
				COUNTDOWN: begin
					load <= 0;
					run <= 1;
					if (done) state <= FINISH;
				end
				FINISH: begin
					load <= 0;
					run <= 0;
					if (reset) state <= INPUT;
				end
				default: state <= INPUT;
			endcase
		end
	end
endmodule