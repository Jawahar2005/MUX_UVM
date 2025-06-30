// Code your design here
module mux_16x1 (
  input logic clk,rst,
  input  logic [15:0][32:0] i,
  input  logic [3:0] s,
  output logic [32:0] y
);

  always @(posedge clk or negedge clk)
    begin
      if(rst)begin
        assign y=4'b0000;
      end
      else begin
        if (s == 4'b0000) begin
          assign y = i[0];
        end
        else if (s == 4'b0001) begin
          assign y = i[1];
        end
        else if (s == 4'b0010) begin
          assign y = i[2];
        end
        else if (s == 4'b0011) begin
          assign y = i[3];
        end
        else if (s == 4'b0100) begin
          assign y = i[4];
        end
        else if (s == 4'b0101) begin
          assign y = i[5];
        end
        else if (s == 4'b0110) begin
          assign y = i[6];
        end
        else if (s == 4'b0111) begin
          assign y = i[7];
        end
        else if (s == 4'b1000) begin
          assign y = i[8];
        end
        else if (s == 4'b1001) begin
          assign y = i[9];
        end
        else if (s == 4'b1010) begin
          assign y = i[10];
        end
        else if (s == 4'b1011) begin
          assign y = i[11];
        end
        else if (s == 4'b1100) begin
          assign y = i[12];
        end
        else if (s == 4'b1101) begin
          assign y = i[13];
        end
        else if (s == 4'b1110) begin
          assign y = i[14];
        end
        else  begin
          assign y = i[15];
        end
      end
    end  
endmodule
