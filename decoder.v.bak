module decoder (
	input		[3:0] idata,
	output reg	[6:0] odata
);
	always @(*) begin
		case (idata)
			4'h0: odata = 7'b1000000;
         4'h1: odata = 7'b1111001;
         4'h2: odata = 7'b0100100;
         4'h3: odata = 7'b0110000;
         4'h4: odata = 7'b0011001;
         4'h5: odata = 7'b0010010;
         4'h6: odata = 7'b0000010;
         4'h7: odata = 7'b1111000;
         4'h8: odata = 7'b0000000;
         4'h9: odata = 7'b0010000;
         default: odata = 7'b1111111;
		endcase
	end
endmodule