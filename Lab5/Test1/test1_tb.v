// Author : Reuben Ninan (216315509)
`timescale 1ns/1ps

module test1_tb();

integer i,j,k;

// inputs
reg a = 0, b = 0, c = 0;
//outputs
wire x,y;

test1 test1_m0(a,b,c,x,y);

initial
begin

    for (i=0; i<2; i=i+1)
    begin
        for (j=0; j<2; j=j+1)
        begin
            for (k=0; k<2; k=k+1)
            begin
                #19 a = i; b = j; c = k;    
                #1
                if((x == 0 ) && (y == 0))
                begin
                    $display("All outputs are zero");
                end

            end    
        end 
    end

end

initial
begin
    $monitor("a=%d b=%d c=%d     x=%d y=%d",a,b,c,x,y); 
end


endmodule