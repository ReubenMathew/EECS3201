module Lab4(
	input 		clk,
	input 		rst_n,
	input			key1,
	input			key2,
	output[5:0] seg_sel,
	output[7:0]	seg_data
);

reg[31:0] timer_cnt;
reg en_1hz;
reg zero_ctrl;

always@(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
	begin
		en_1hz <= 1'b0;
		timer_cnt <= 32'd0;
		zero_ctrl <= 1'b0;
	end
	else if(timer_cnt >= 32'd49_999_999)
	begin
		en_1hz <= 1'b1;
		timer_cnt <= 32'd0;
	end
	else if(key1 == 1'b0)
	begin
		en_1hz <= 1'b0;
	end
	else
	begin
		en_1hz <= 1'b0;
		timer_cnt <= timer_cnt + 32'd1; 
	end

	
end

wire[3:0] first_digit, second_digit;
clock_limit clock_limit_1(
	.control	(key2),
	.first	(first_digit),
	.second	(second_digit)
);

// MSB
wire[3:0] count0;
wire t0, finishClock;
counter count10_m0(
  .clk    (clk),
  .rst_n  (rst_n),
  .en     (t1),
  .last 	 (1'b1),
  .start	 (first_digit),
  .data   (count0),
  .t      (t0),
  .finish (finishClock)
);

// LSB
wire[3:0] count1;
wire t1;
counter count10_m1(
  .clk    (clk),
  .rst_n  (rst_n),
  .en     (en_1hz),
  .last 	 (finishClock),
  .start	 (second_digit),
  .data   (count1),
  .t      (t1)
); 


wire[6:0] seg_data_0;
seg_decoder seg_decoder_m0(
    .bin_data  (count0),
    .seg_data  (seg_data_0)
);
wire[6:0] seg_data_1;
seg_decoder seg_decoder_m1(
    .bin_data  (count1),
    .seg_data  (seg_data_1)
);


display seg_scan_m0(
    .clk        (clk),
    .rst_n      (rst_n),
    .seg_sel    (seg_sel),
    .seg_data   (seg_data),
    .seg_data_0 ({1'b1,seg_data_0}),
    .seg_data_1 ({1'b1,seg_data_1})

);
endmodule 
