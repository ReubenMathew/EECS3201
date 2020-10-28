module counter(
  input          clk,
  input          rst_n,
  input          en,    // Counter enable
  input 			  last,  // is most significant digit of counter?
  input[3:0]	  start,
  output reg[3:0]data,  //counter value
  output reg     t,     // carry enable signal
  output reg	  finish
 );

always@(posedge clk or negedge rst_n) 
begin
	if(rst_n==0)
    begin
        data <= start;
        t <= 1'd0;
		  finish <= 1'b0;
    end
    else if(en)
    begin
		  if ((last && data==4'd0))
		  begin
				t <= 1'b0;
            data <= 1'd0;
		  end
		  else if ((last && data==4'd1))
		  begin
				t <= 1'b0;
            data <= 1'd0;
				finish <= 1'b1;
		  end
        else if(data==4'd0)
        begin
            t<= 1'b1;    //Counter to 9 to generate carry
            data <= 4'd9;//Counter to 9 reset
				finish <= 1'b0;

        end
        else
        begin
            t <= 1'b0;
            data <= data - 4'd1;
				finish <= 1'b0;
        end
    end
    else
        t <= 1'b0;
end

endmodule
