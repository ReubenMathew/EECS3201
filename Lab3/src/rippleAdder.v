module rippleAdder(z, cout, a, b,cin);

output [3:0] z;
output cout;
input [3:0] a, b;
input cin;

wire cout1, cout2, cout3;

fullAdder fullAdder_0(z[0],cout1,a[0],b[0],cin);
fullAdder fullAdder_1(z[1],cout2,a[1],b[1],cout1);
fullAdder fullAdder_2(z[2],cout3,a[2],b[2],cout2);
fullAdder fullAdder_3(z[3],cout,a[3],b[3],cout3);

endmodule
