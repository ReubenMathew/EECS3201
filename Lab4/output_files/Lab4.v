module clock_limit(
	input          control,
	output reg[3:0] first,
	output reg[3:0] second
);

always@(*)
begin
	
	if(control)
	begin
		first_digit <= 4'd3;
		second_digit <= 4'd0;
	end
	else
	begin
		first_digit <= 4'd2;
		second_digit <= 4'd4;
	end
	
end


endmodule
