module display(
	input 			 clk,
	output reg[5:0] seg_sel,      //digital led chip select
	output reg[6:0] seg_data,     //7 segment digital output	
	input[7:0]      seg_data_0,
	input[7:0]      seg_data_1,
	input[7:0]      seg_data_2,
	input[7:0]      seg_data_3,
	input[7:0]      seg_data_4,
	input[7:0]      seg_data_5
);


//parameter SCAN_COUNT = 50000000 /(200 * 6) - 1;
parameter SCAN_COUNT = 200;

reg[31:0] scan_timer;
reg[3:0] scan_sel;

always@(posedge clk)
begin 
	if(scan_timer >= SCAN_COUNT)
	begin
		scan_timer <= 32'd0;
		if(scan_sel == 4'd5)
			scan_sel <= 4'd0;
		else
			scan_sel <= scan_sel + 4'd1;
	end
	else
	begin
			scan_timer <= scan_timer + 32'd1;
	end
end

always@(posedge clk)
begin 
	case(scan_sel)
		4'd0:
		begin
			seg_sel <= 6'b11_1110;
			seg_data <= seg_data_0;
		end
		4'd1:
		begin
			seg_sel <= 6'b11_1101;
			seg_data <= seg_data_1;
		end
		4'd2:
		begin
			seg_sel <= 6'b11_1011;
			seg_data <= seg_data_2;
		end
		4'd3:
		begin
			seg_sel <= 6'b11_0111;
			seg_data <= seg_data_3;
		end
		4'd4:
		begin
			seg_sel <= 6'b10_1111;
			seg_data <= seg_data_4;
		end
		4'd5:
		begin
			seg_sel <= 6'b01_1111;
			seg_data <= seg_data_5;
		end
		default:
		begin
			seg_sel <= 6'b11_1111;
			seg_data <= 8'hff;
		end
	endcase
end

endmodule
