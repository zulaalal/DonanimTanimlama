module sakiz(
  input A_in, 
  input B_in,
  input C_in,
  input clk,
  input rst,
  output reg collect,
  output reg A_out,
  output reg B_out,
  output reg cikis
  );
  
  reg[11:0] current_state, next_state;
  
  localparam S0=12'b0000_0000_0001,
             S5=12'b0000_0000_0010,
             S10=12'b0000_0000_0100,
             S15=12'b0000_0000_1000,
             S20=12'b0000_0001_0000,
             S25=12'b0000_0010_0000,
             S30=12'b0000_0100_0000,
             S35=12'b0000_1000_0000,
             S40=12'b0001_0000_0000,
             S45=12'b0010_0000_0000,
             S50=12'b0100_0000_0000,
             S55=12'b1000_0000_0000;
             
  always @(posedge clk or posedge rst)
    if(rst) begin
      current_state <=S0;
    end else begin
      current_state<=next_state;
    end
    
  
  always @(A_in or B_in or C_in)
      case(current_state)
        S0: if(A_in==1) begin next_state=S5; {collect, A_out,B_out,cikis} = 4'b0000; end
            else if(B_in==1) begin next_state=S10; {collect, A_out,B_out,cikis} = 4'b0000; end
            else if(C_in==1) begin next_state=S25; {collect, A_out,B_out,cikis} = 4'b0000; end
            else begin             next_state=S0; {collect, A_out,B_out,cikis} = 4'b0000; end

        S5: if(A_in==1) begin next_state=S10; {collect, A_out,B_out,cikis} = 4'b000; end
            else if(B_in==1) begin next_state=S15; {collect, A_out,B_out,cikis} = 4'b0000; end
            else if(C_in==1) begin next_state=S20; {collect, A_out,B_out,cikis} = 4'b0000; end
            else begin             next_state=S5; {collect, A_out,B_out,cikis} = 4'b0000; end

          
        S10: if(A_in==1) begin next_state=S15; {collect, A_out,B_out,cikis} = 4'b0000; end
            else if(B_in==1) begin next_state=S20; {collect, A_out,B_out,cikis} = 4'b0000; end
            else if(C_in==1) begin next_state=S35; {collect, A_out,B_out,cikis} = 4'b0000; end
            else begin             next_state=S10; {collect, A_out,B_out,cikis} = 4'b1001; end
              
        S15: if(A_in==1) begin next_state=S20; {collect, A_out,B_out,cikis} = 4'b000; end
            else if(B_in==1) begin next_state=S25; {collect, A_out,B_out,cikis} = 4'b000; end
            else if(C_in==1) begin next_state=S40; {collect, A_out,B_out,cikis} = 4'b000; end
            else begin             next_state=S15; {collect, A_out,B_out,cikis} = 4'b1101; end
              
        S20: if(A_in==1) begin next_state=S25; {collect, A_out,B_out,cikis} = 4'b000; end
            else if(B_in==1) begin next_state=30; {collect, A_out,B_out,cikis} = 4'b000; end
            else if(C_in==1) begin next_state=S45; {collect, A_out,B_out,cikis} = 4'b000; end
            else begin             next_state=S20; {collect, A_out,B_out,cikis} = 4'b1101; end
        
        S25: if(A_in==1) begin next_state=S25; {collect, A_out,B_out,cikis} = 4'b0000; end
            else if(B_in==1) begin next_state=30; {collect, A_out,B_out,cikis} = 4'b0000; end
            else if(C_in==1) begin next_state=S40; {collect, A_out,B_out,cikis} = 4'b1001; end
            else begin             next_state=S15; {collect, A_out,B_out,cikis} = 4'b1101; end
        
        S30: if(A_in==1) begin next_state=S35; {collect, A_out,B_out,cikis} = 4'b0000; end
            else if(B_in==1) begin next_state=S40; {collect, A_out,B_out,cikis} = 4'b1001; end
            else if(C_in==1) begin next_state=S55; {collect, A_out,B_out,cikis} = 4'b1101; end
            else begin             next_state=S30; {collect, A_out,B_out,cikis} = 4'b1111; end
              
        S35: next_state = S0;
        S40: next_state = S0;
        S45: next_state = S0;
        S50: next_state = S0;
        S55: next_state = S0; {collect, A_out, B_out, cikis} = 4'b0010; end
        
    default: begin next_state= S0; {collect, A_out, B_out, cikis } = 4'b0000; end
  endcase
       
endmodule

