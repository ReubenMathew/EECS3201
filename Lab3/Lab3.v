module Lab3(
	output[5:0] seg_sel,
	output[7:0] seg_data,
	input clk
);


reg[3:0] a = 4'd3;
reg[3:0] b = 4'd8;
reg s = 1'b1; // subtraction control

wire[3:0] z;
wire cout;


reg [5:0] cout_op;

always@(*)
begin
	if (s == 1'b1)
	begin
		if (cout == 1'b0)
			cout_op = 5'b10001;
		else
			cout_op = 5'b10000;
	end
	else
	begin
		if (cout == 1'b0)
			cout_op = 5'b10000;
		else
			cout_op = cout;
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
    .bin_data  (z),
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
