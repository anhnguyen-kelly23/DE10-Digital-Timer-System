
module system (
	clk_clk,
	hexs_0_conduit_end_readdata,
	hexs_1_conduit_end_readdata,
	hexs_2_conduit_end_readdata,
	hexs_3_conduit_end_readdata,
	hexs_4_conduit_end_readdata,
	hexs_5_conduit_end_readdata,
	reset_reset_n,
	switches_0_conduit_end_export);	

	input		clk_clk;
	output	[6:0]	hexs_0_conduit_end_readdata;
	output	[6:0]	hexs_1_conduit_end_readdata;
	output	[6:0]	hexs_2_conduit_end_readdata;
	output	[6:0]	hexs_3_conduit_end_readdata;
	output	[6:0]	hexs_4_conduit_end_readdata;
	output	[6:0]	hexs_5_conduit_end_readdata;
	input		reset_reset_n;
	input	[31:0]	switches_0_conduit_end_export;
endmodule
