module Seven_Segment_Display (A, B, C, D, a, b, c, d, e, f, g);
	input A;
	input B;
	input C;
	input D;
	output reg a;
	output reg b;
	output reg c;
	output reg d;
	output reg e;
	output reg f;
	output reg g;
	always @ (*) begin

		// a = B'D' + A'C + BC + AD' + A'BD + AB'C'
		a <= (~B & ~D) | (~A & C) | (B & C) | (~A & B & D) | (A & ~B & ~C);
	       	// b  = A'B' + B'D' + A'C'D' + A'CD + AC'D	
		b <= (~A & ~B) | (~B & ~D) | (~A & ~C & D) | (A & ~C & D);
		// c = A'C' + A'D + C'D + A'B + AB'
		c <= (~A & ~C) | (~A & D) | (~C & D) | (~A & B) | (A & ~B); 
		// d = A'B'D' + B'CD + BC'D + BCD' + AC'D'
		d <= (~A & ~B & ~D) | (~B & C & D) | (B & ~C & D) | (B & C & ~D) | (A & ~C & ~D);
		// e = B'D' + CD' + AC + AB
		e <= (~B & ~D) | (C & ~D) | (A & C) | (A & B);
		// f = C'D' + BD' + AB' + AC + A'BC' 
		f <= (~C & ~D) | (B & ~D) | (A & ~B) | (A & C) | (~A & B & ~C);
		// g = B'C + CD' + AB' + AD + A'BC'
		g <= (~B & C) | (C & ~D) | (A & ~B) | (A & D) | (~A & B & ~C);
	end
	
endmodule // Seven_Segment_Display	
module Test_Bench;
	
	reg A, B, C, D;
	wire a, b, c, d, e, f, g;
	Seven_Segment_Display SSD (A, B, C, D, a, b, c, d, e, f, g);

	initial begin
		A = 0; B = 0; C = 0; D = 0; # 10
		A = 0; B = 0; C = 0; D = 1; # 10
		A = 0; B = 0; C = 1; D = 0; # 10
		A = 0; B = 0; C = 1; D = 1; # 10
		A = 0; B = 1; C = 0; D = 0; # 10
		A = 0; B = 1; C = 0; D = 1; # 10
		A = 0; B = 1; C = 1; D = 0; # 10
		A = 0; B = 1; C = 1; D = 1; # 10
		A = 1; B = 0; C = 0; D = 0; # 10
		A = 1; B = 0; C = 0; D = 1; # 10
		A = 1; B = 0; C = 1; D = 0; # 10
		A = 1; B = 0; C = 1; D = 1; # 10
		A = 1; B = 1; C = 0; D = 0; # 10
		A = 1; B = 1; C = 0; D = 1; # 10
		A = 1; B = 1; C = 1; D = 0; # 10
		A = 1; B = 1; C = 1; D = 1; # 10
		$finish;
	end
	initial 
		$monitor("A = %b, B = %b, C = %b, D = %b => a = %b, b = %b, c = %b , d = %b, e = %b, f = %b, g = %b", A, B, C, D, a, b, c, d, e, f, g);
endmodule	
