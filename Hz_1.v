///////
///////Frequency Divider/////
//////MOD50E6/////

module Hz_1(C50, clk1hz);
input C50;
output clk1hz;
reg [31:0] q;
reg clk1hz;

always @(posedge C50)

begin
	if (q==32'd50_0000_00) begin q<=32'd0; clk1hz<=1'b1; end
	else begin q <= q+1; clk1hz=1'b0; end
end
	
endmodule

/*
module mod50mhz(CLOCK_50, clk);
input CLOCK_50;
output clk;
wire M10, M100, M1K, M10K, M100K, M1x6, M10x6, M50x6;

 MOD10 M10a(CLOCK_50, M10);
 MOD10 M100a(M10, M100);
 MOD10 M1Ka(M100, M1K);
 MOD10 M10Ka(M1K, M10K);
 MOD10 M100Ka(M10K, M100K);
 MOD10 M1x6a(M100K, M1x6);
 MOD10 M10x6a(M1x6, M10x6);
 MOD5  M50x6a(M10x6, M50x6);
 assign clk=M50x6;
 endmodule*/
 