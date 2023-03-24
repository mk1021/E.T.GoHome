
module fir (
	clk,
	reset_n,
	ast_sink_data,
	ast_sink_valid,
	ast_sink_error,
	ast_source_data,
	ast_source_valid,
	ast_source_error,
	coeff_in_clk,
	coeff_in_areset,
	coeff_in_address,
	coeff_in_read,
	coeff_out_valid,
	coeff_out_data,
	coeff_in_we,
	coeff_in_data);	

	input		clk;
	input		reset_n;
	input	[79:0]	ast_sink_data;
	input		ast_sink_valid;
	input	[1:0]	ast_sink_error;
	output	[219:0]	ast_source_data;
	output		ast_source_valid;
	output	[1:0]	ast_source_error;
	input		coeff_in_clk;
	input		coeff_in_areset;
	input	[5:0]	coeff_in_address;
	input		coeff_in_read;
	output	[0:0]	coeff_out_valid;
	output	[15:0]	coeff_out_data;
	input	[0:0]	coeff_in_we;
	input	[15:0]	coeff_in_data;
endmodule
