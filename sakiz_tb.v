module clock_gen (clk);
 `define PERIOD = 10;
output clk;
reg clk;
initial clk = 0;
always begin
 #`PERIOD/2
 clk = ~clk;
end
endmodule 

module sakiz_tb();
  
reg A_in, B_in, C_in, rst;
wire collect, A_out, B_ out, cikis;

sakiz SM(
  .A_in(A_in),
  .B_in(B_in),
  .C_in(C_in),
  .clk(clk),
  .rst(rst),
  .collect(collect),
  .A_out(A_out),
  .B_out(B_out),
  .cikis(cikis)
  );
  
  
  initial begin
   A_in=0;
   B_in=0;
   C_in=0;
   rst=0;
   #'clk_period; 
   
   rst=1; //ba?la
   #'clk_period; 
   
   rst=0;
   #('clk_period); 
   
   A_in=1;
   B_in=0;  //5 kuru?
   C_in=0;
   #('clk_period); 
   
   A_in=0;
   B_in=1;  //10 kuru?
   C_in=0;
   #('clk_period); 
   
   A_in=0;
   B_in=0;  //25 kuru?
   C_in=1;
   #('clk_period); 
   
   A_in=0;
   B_in=0;  //25 kuru?
   C_in=1;
   #('clk_period); 
   
   
   #('clk_period * 5);
   
   $finish;
 end
 endmodule
   
   
   
   
  
