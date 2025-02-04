// Author : Reuben Ninan (216315509)
`timescale 1ns/1ps

module test2_tb();

reg clk = 0, a = 0;
wire [3:0] r;
parameter CLK_PERIOD = 20;

// TB clk
always
begin
    #((CLK_PERIOD/2)) clk <= !clk;
    if(r==4'b0)
    begin
        $display("Time:%tps   All outputs are zero",$time);
    end 
end 

test2 test2_m0(clk,a,r);

initial
begin
   a <= 0;
   #100
   a <= 1;
   #200 
   a <= 0; 
end

endmodule
