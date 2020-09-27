module Lab3(
	output[5:0] seg_sel,
	output[7:0] seg_data,
	input clk
);

wire[6:0] seg_data_0;
seg_decoder seg_decoder_m0(
    .bin_data  (4'd0),
    .seg_data  (seg_data_0)
);
wire[6:0] seg_data_1;
seg_decoder seg_decoder_m1(
    .bin_data  (5'd10000),
    .seg_data  (seg_data_1)
);
wire[6:0] seg_data_2;
seg_decoder seg_decoder_m2(
    .bin_data  (4'd2),
    .seg_data  (seg_data_2)
);
wire[6:0] seg_data_3;
seg_decoder seg_decoder_m3(
    .bin_data  (5'd10000),
    .seg_data  (seg_data_3)
);
wire[6:0] seg_data_4;
seg_decoder seg_decoder_m4(
    .bin_data  (4'd4),
    .seg_data  (seg_data_4)
);

wire[6:0] seg_data_5;
seg_decoder seg_decoder_m5(
    .bin_data  (4'd5),
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
