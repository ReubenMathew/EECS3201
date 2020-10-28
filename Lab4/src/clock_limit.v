module clock_limit(
	input          control,
	output reg[3:0] first,
	output reg[3:0] second
);

always@(*)
begin
	
	if(control)
	begin
		first <= 4'd2;
		second <= 4'd4;
	end
	else
	begin
		first <= 4'd3;
		second <= 4'd0;
	end
	
end


endmodule
