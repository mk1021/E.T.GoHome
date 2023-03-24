	fir u0 (
		.clk              (<connected-to-clk>),              //                     clk.clk
		.reset_n          (<connected-to-reset_n>),          //                     rst.reset_n
		.ast_sink_data    (<connected-to-ast_sink_data>),    //   avalon_streaming_sink.data
		.ast_sink_valid   (<connected-to-ast_sink_valid>),   //                        .valid
		.ast_sink_error   (<connected-to-ast_sink_error>),   //                        .error
		.ast_source_data  (<connected-to-ast_source_data>),  // avalon_streaming_source.data
		.ast_source_valid (<connected-to-ast_source_valid>), //                        .valid
		.ast_source_error (<connected-to-ast_source_error>), //                        .error
		.coeff_in_clk     (<connected-to-coeff_in_clk>),     //             coeff_clock.clk
		.coeff_in_areset  (<connected-to-coeff_in_areset>),  //             coeff_reset.reset_n
		.coeff_in_address (<connected-to-coeff_in_address>), //         avalon_mm_slave.address
		.coeff_in_read    (<connected-to-coeff_in_read>),    //                        .read
		.coeff_out_valid  (<connected-to-coeff_out_valid>),  //                        .readdatavalid
		.coeff_out_data   (<connected-to-coeff_out_data>),   //                        .readdata
		.coeff_in_we      (<connected-to-coeff_in_we>),      //                        .write
		.coeff_in_data    (<connected-to-coeff_in_data>)     //                        .writedata
	);

