module Seven_Segment_Display (display, value);
	
	input [6:0] display;
	output reg [3:0] value;
	
	always @ (display) begin
		if (display == 7'b1111110)
			value <= 0;
		if (display == 7'b0110000)
			value <= 1;
		if (display == 7'b1101101)
			value <= 2;
		if (display == 7'b1111001)
			value <= 3;
		if (display == 7'b0110011)
			value <= 4;
		if (display == 7'b1011011)
			value <= 5;
		if (display == 7'b1011111)
			value <= 6;
		if (display == 7'b1110000)
			value <= 7;
		if (display == 7'b1111111)
			value <= 8;
		if (display == 7'b1110011)
			value <= 9;
		if (display == 7'b1110111)
			value <= 10;
		if (display == 7'b0011111)
			value <= 11;
		if (display == 7'b1001110)
			value <= 12;
		if (display == 7'b0111101)
			value <= 13;
		if (display == 7'b1001111)
			value <= 14;
		if (display == 7'b1000111)
			value <= 15;
	end
endmodule
module Test_Bench;
	
	reg [6:0] display;
	wire [3:0] value;

	Seven_Segment_Display SSD (display, value);

	initial begin
		display = 7'b1111110; # 10 // 0
		display = 7'b0110000; # 10 // 1
		display = 7'b1101101; # 10 // 2
		display = 7'b1111001; # 10 // 3
		display = 7'b0110011; # 10 // 4
		display = 7'b1011011; # 10 // 5
		display = 7'b1011111; # 10 // 6
		display = 7'b1110000; # 10 // 7
		display = 7'b1111111; # 10 // 8
		display = 7'b1110011; # 10 // 9
		display = 7'b1110111; # 10 // A
		display = 7'b0011111; # 10 // B
		display = 7'b1001110; # 10 // C
		display = 7'b0111101; # 10 // D
		display = 7'b1001111; # 10 // E
		display = 7'b1000111; # 10 // F
		$finish;
	end

	initial
		$monitor("display = %b -> value = %h", display, value); 
endmodule
		

