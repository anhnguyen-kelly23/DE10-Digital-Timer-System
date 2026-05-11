module Bai4 (
	input 			CLOCK_50,
	input  [0:0]	KEY,
	input  [15:0]	SW,
	output [6:0]	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
);

	system NIOS_system (
		.clk_clk							(CLOCK_50),
		.hexs_0_conduit_end_readdata (HEX0),
      .hexs_1_conduit_end_readdata (HEX1),
      .hexs_2_conduit_end_readdata (HEX2),
      .hexs_3_conduit_end_readdata (HEX3),
      .hexs_4_conduit_end_readdata (HEX4),
      .hexs_5_conduit_end_readdata (HEX5),
		.reset_reset_n					(KEY[0]),
		.switches_0_conduit_end_export	(SW)
	);
	

endmodule
