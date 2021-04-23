module single_port_ram 
#(parameter DATA_WIDTH=16, parameter ADDR_WIDTH=5)
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] addr,
	input we, clk,
	output [(DATA_WIDTH-1):0] q
);

	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];

	// Variable to hold the registered read address
	reg [ADDR_WIDTH-1:0] addr_reg;

	always @ (posedge clk)
	begin
		// Write
		if (we)
		begin
			ram[addr] <= data;
		end
		addr_reg <= addr;
		q <= ram[addr_reg];
	end

endmodule
