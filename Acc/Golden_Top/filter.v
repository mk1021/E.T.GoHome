/*
module filter(

  input clk,
  input reset,
  input signed [31:0] data_in,
  output signed [31:0] data_out

);

  parameter WIDTH = 32;  // word width
  parameter COEFFS [3:0] = {1, 2, 3, 2};  // filter coefficients (modify this for the number and coeffs value)

  reg signed [WIDTH-1:0] x = {0,0,0,0};  // input shift register
  wire signed [WIDTH-1:0] y;       // filter output

  assign data_out = y;  // output the filtered data

  always @(posedge clk) begin

    if (reset) begin
      // reset the input shift register
      x <= {WIDTH{1'b0}};
    end 
    else begin
      // shift the input data into the shift register
      x[0] <= data_in;
      x[1] <= x[0];
      x[2] <= x[1];
      x[3] <= x[2];
    end

    // Sum the products of the filter coefficients and the values in the input shift register taps using a for loop
    integer i;
    y = 0;
    //for (i = 0; i < COEFFS.size(); i = i + 1) begin
    y = y + COEFFS[i] * x[i];
   // end

  end

endmodule
*/