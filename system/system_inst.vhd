	component system is
		port (
			clk_clk                       : in  std_logic                     := 'X';             -- clk
			hexs_0_conduit_end_readdata   : out std_logic_vector(6 downto 0);                     -- readdata
			hexs_1_conduit_end_readdata   : out std_logic_vector(6 downto 0);                     -- readdata
			hexs_2_conduit_end_readdata   : out std_logic_vector(6 downto 0);                     -- readdata
			hexs_3_conduit_end_readdata   : out std_logic_vector(6 downto 0);                     -- readdata
			hexs_4_conduit_end_readdata   : out std_logic_vector(6 downto 0);                     -- readdata
			hexs_5_conduit_end_readdata   : out std_logic_vector(6 downto 0);                     -- readdata
			reset_reset_n                 : in  std_logic                     := 'X';             -- reset_n
			switches_0_conduit_end_export : in  std_logic_vector(31 downto 0) := (others => 'X')  -- export
		);
	end component system;

	u0 : component system
		port map (
			clk_clk                       => CONNECTED_TO_clk_clk,                       --                    clk.clk
			hexs_0_conduit_end_readdata   => CONNECTED_TO_hexs_0_conduit_end_readdata,   --     hexs_0_conduit_end.readdata
			hexs_1_conduit_end_readdata   => CONNECTED_TO_hexs_1_conduit_end_readdata,   --     hexs_1_conduit_end.readdata
			hexs_2_conduit_end_readdata   => CONNECTED_TO_hexs_2_conduit_end_readdata,   --     hexs_2_conduit_end.readdata
			hexs_3_conduit_end_readdata   => CONNECTED_TO_hexs_3_conduit_end_readdata,   --     hexs_3_conduit_end.readdata
			hexs_4_conduit_end_readdata   => CONNECTED_TO_hexs_4_conduit_end_readdata,   --     hexs_4_conduit_end.readdata
			hexs_5_conduit_end_readdata   => CONNECTED_TO_hexs_5_conduit_end_readdata,   --     hexs_5_conduit_end.readdata
			reset_reset_n                 => CONNECTED_TO_reset_reset_n,                 --                  reset.reset_n
			switches_0_conduit_end_export => CONNECTED_TO_switches_0_conduit_end_export  -- switches_0_conduit_end.export
		);

