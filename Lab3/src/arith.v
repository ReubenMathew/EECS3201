module arith(z,cout,a,b,s);

output [3:0] z;
output cout;
input [3:0] a,b;
input s;

reg [3:0] tmp;
wire [3:0] notB;
wire cin;

assign cin = s;
not subCase [3:0] (notB, b);

always@(*)
begin
	if(cin == 1'b1)
		tmp = notB;
	else
		tmp = b;
end

rippleAdder rippleAdder_a(z,cout,a,tmp,cin);

endmodule

//
//module mux(z,a,b,c);
//output[3:0] z;
//input[3:0] a, b, c;
//wire[3:0] notC, upper, lower;
//
//not my_not(notC, c);
//and upperAnd(upper, a, notC);
//and lowerAnd(lower, c, b);
//or my_or(z, upper, lower);
//
//endmodule
