	component fir is
		port (
			clk              : in  std_logic                      := 'X';             -- clk
			reset_n          : in  std_logic                      := 'X';             -- reset_n
			ast_sink_data    : in  std_logic_vector(79 downto 0)  := (others => 'X'); -- data
			ast_sink_valid   : in  std_logic                      := 'X';             -- valid
			ast_sink_error   : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- error
			ast_source_data  : out std_logic_vector(219 downto 0);                    -- data
			ast_source_valid : out std_logic;                                         -- valid
			ast_source_error : out std_logic_vector(1 downto 0);                      -- error
			coeff_in_clk     : in  std_logic                      := 'X';             -- clk
			coeff_in_areset  : in  std_logic                      := 'X';             -- reset_n
			coeff_in_address : in  std_logic_vector(5 downto 0)   := (others => 'X'); -- address
			coeff_in_read    : in  std_logic                      := 'X';             -- read
			coeff_out_valid  : out std_logic_vector(0 downto 0);                      -- readdatavalid
			coeff_out_data   : out std_logic_vector(15 downto 0);                     -- readdata
			coeff_in_we      : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- write
			coeff_in_data    : in  std_logic_vector(15 downto 0)  := (others => 'X')  -- writedata
		);
	end component fir;

	u0 : component fir
		port map (
			clk              => CONNECTED_TO_clk,              --                     clk.clk
			reset_n          => CONNECTED_TO_reset_n,          --                     rst.reset_n
			ast_sink_data    => CONNECTED_TO_ast_sink_data,    --   avalon_streaming_sink.data
			ast_sink_valid   => CONNECTED_TO_ast_sink_valid,   --                        .valid
			ast_sink_error   => CONNECTED_TO_ast_sink_error,   --                        .error
			ast_source_data  => CONNECTED_TO_ast_source_data,  -- avalon_streaming_source.data
			ast_source_valid => CONNECTED_TO_ast_source_valid, --                        .valid
			ast_source_error => CONNECTED_TO_ast_source_error, --                        .error
			coeff_in_clk     => CONNECTED_TO_coeff_in_clk,     --             coeff_clock.clk
			coeff_in_areset  => CONNECTED_TO_coeff_in_areset,  --             coeff_reset.reset_n
			coeff_in_address => CONNECTED_TO_coeff_in_address, --         avalon_mm_slave.address
			coeff_in_read    => CONNECTED_TO_coeff_in_read,    --                        .read
			coeff_out_valid  => CONNECTED_TO_coeff_out_valid,  --                        .readdatavalid
			coeff_out_data   => CONNECTED_TO_coeff_out_data,   --                        .readdata
			coeff_in_we      => CONNECTED_TO_coeff_in_we,      --                        .write
			coeff_in_data    => CONNECTED_TO_coeff_in_data     --                        .writedata
		);

