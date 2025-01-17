module spinny(clk, reset, run, spinnyThingy);
	input clk, reset, run;
	output reg [6:0] spinnyThingy;
	
	reg [2:0] state;
	
	parameter A = 3'b000;
	parameter B = 3'b001;
	parameter C = 3'b010;
	parameter D = 3'b011;
	parameter E = 3'b100;
	parameter F = 3'b101;
	parameter G1 = 3'b110;
	parameter G2 = 3'b110;
	
	parameter A_seg = 7'b0111111;
	parameter B_seg = 7'b1011111;
	parameter C_seg = 7'b1101111;
	parameter D_seg = 7'b1110111;
	parameter E_seg = 7'b1111011;
	parameter F_seg = 7'b1111101;
	parameter G_seg = 7'b1111110;
	
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			state <= A;
		end else if (run) begin
			case (state)
				A: state <= A;
				B: state <= G1;
				G1: state <= E;
				E: state <= D;
				D: state <= C;
				C: state <= G2;
				G2: state <= F;
				default: state <= A;
			endcase
		end
	end
	
	always @(*) begin
		case (state)
			A: spinnyThingy = A_seg;
			B: spinnyThingy = B_seg;
			C: spinnyThingy = C_seg;
			D: spinnyThingy = D_seg;
			E: spinnyThingy = E_seg;
			F: spinnyThingy = F_seg;
			G1: spinnyThingy = G_seg;
			G2: spinnyThingy = G_seg;
		endcase
	end
endmodule