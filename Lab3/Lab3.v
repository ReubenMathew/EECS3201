module Lab3(
	output[5:0] seg_sel,
	output[7:0] seg_data,
	input clk
);


reg[3:0] a = 4'd4;
reg[3:0] b = 4'd10;
reg s = 1'b1; // subtraction control

wire[3:0] z;
wire cout;

reg [5:0] cout_op;
reg [3:0] result;


// If there is a carry out during subtraction, it means the resultant subtraction must undo the twos complement and display a "-" sign
// If not then it either is regular subtraction with a positive difference and no "-" sign, or addition where there may be a carry out
// Using nested if statements I can create the required output for the 4 possible cases
always@(*)
begin
	if (s == 1'b1)
	begin
		if (cout == 1'b0)
		begin
			cout_op = 5'b10001;
			result = (~z)+1'b1;
		end
		else
		begin
			cout_op = 5'b10000;
			result = z;
		end
				
	end
	else
	begin
		if (cout == 1'b0)
			cout_op = 5'b10000;
		else
			cout_op = cout;

		result = z;
	end
end


arith arith_1(z, cout, a, b,s);

wire[6:0] seg_data_0;
seg_decoder seg_decoder_m0(
    .bin_data  (a),
    .seg_data  (seg_data_0)
);
wire[6:0] seg_data_1;
seg_decoder seg_decoder_m1(
    .bin_data  (5'b10000),
    .seg_data  (seg_data_1)
);
wire[6:0] seg_data_2;
seg_decoder seg_decoder_m2(
    .bin_data  (b),
    .seg_data  (seg_data_2)
);
wire[6:0] seg_data_3;
seg_decoder seg_decoder_m3(
    .bin_data  (5'b10000),
    .seg_data  (seg_data_3)
);

wire[6:0] seg_data_4;
seg_decoder seg_decoder_m4(
    .bin_data  (cout_op),
    .seg_data  (seg_data_4)
);

wire[6:0] seg_data_5;
seg_decoder seg_decoder_m5(
    .bin_data  (result),
    .seg_data  (seg_data_5)
);




display display_1(
	 .clk			 (clk),
    .seg_sel    (seg_sel),
    .seg_data   (seg_data),
    .seg_data_0 ({1'b0,seg_data_0}),      //The  decimal point at the highest bit,and low level effecitve
    .seg_data_1 ({1'b0,seg_data_1}), 
    .seg_data_2 ({1'b0,seg_data_2}),
    .seg_data_3 ({1'b0,seg_data_3}),
    .seg_data_4 ({1'b0,seg_data_4}),
    .seg_data_5 ({1'b0,seg_data_5})
);


endmodule
