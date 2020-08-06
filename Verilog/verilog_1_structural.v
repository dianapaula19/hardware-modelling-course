// ( ( in1 and in2 and in3 ) or ( in2 or (not in3) ) ) xor (not in1) = out
module Circuit_Struct (out, in1, in2, in3);	
	output out;
	input in1; 
	input in2; 
	input in3; 
	wire w1, w2;
	wire u;
	and (w1, in1, in2, in3);
	xor (w2, in2, ~in3);
	or (u, w1, w2);
       	xor (out, u, ~in1);
endmodule // Circuit_Struct	

module Test_Bench;

	reg a, b, c;
	wire out;

	Circuit_Struct CS (out, a, b, c); 

	initial begin

		a = 0; b = 0; c = 0; # 10
		a = 0; b = 0; c = 1; # 10
		a = 0; b = 1; c = 0; # 10
		a = 0; b = 1; c = 1; # 10
		a = 1; b = 0; c = 0; # 10
		a = 1; b = 0; c = 1; # 10
		a = 1; b = 1; c = 0; # 10
		a = 1; b = 1; c = 1; # 10

		$finish;
	end

	initial
		$monitor("At time %2t, a = %b, b = %b, c = %b -> out = %b", $time, a, b, c, out);	
endmodule
