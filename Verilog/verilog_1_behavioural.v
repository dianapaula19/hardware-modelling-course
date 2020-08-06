module Circuit_Behavioural (out, in1, in2, in3);
	
	output reg out;
	input in1;
	input in2;
	input in3;
	always @ (in1, in2, in3) begin
		out <= ( (in1 & in2 & in3) | (in2 ^ ~in3) ) ^ (~in1);
	end

endmodule //Circuit_Behavioural

module Test_Bench;
	
	reg a, b, c;
	wire out;
	Circuit_Behavioural CB (out, a, b, c);

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
		$monitor("Time = %2t, a = %b, b = %b, c = %b -> out = %b", $time, a, b, c, out);
endmodule	
