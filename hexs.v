module hexs (
    input             iClk,
    input             iReset_n,
    input             iChip_select_n,
    input             iWrite_n,
    input             iRead_n,
    input       [1:0] iAddress,
    input      [31:0] iData,
    output reg [31:0] oReadData,
    
    output      [6:0] oHEX0, oHEX1, 
    output      [6:0] oHEX2, oHEX3, 
    output      [6:0] oHEX4, oHEX5
);

    reg         [15:0] hour;
    reg         [15:0] minu;
    reg         [15:0] secd;
    
    always @(posedge iClk or negedge iReset_n) begin
        if (!iReset_n) begin
            hour <= 16'd0;
            minu <= 16'd0;
            secd <= 16'd0;
        end
        else if (~iChip_select_n & !iWrite_n) begin
            case (iAddress)
                2'd0: secd <= iData[15:0];
                2'd1: minu <= iData[15:0];
                2'd2: hour <= iData[15:0];
                default: ;
            endcase
        end
    end
    
    always @(*) begin
        if (~iChip_select_n & ~iRead_n) begin
            case (iAddress)
                2'd0: oReadData = {16'b0, secd};
                2'd1: oReadData = {16'b0, minu};
                2'd2: oReadData = {16'b0, hour};
                default: oReadData = 32'h0;
            endcase
        end 
        else begin
            oReadData = 32'h0;
        end
    end
    
    decoder dec0 (.idata(secd[3:0]), .odata(oHEX0));
    decoder dec1 (.idata(secd[7:4]), .odata(oHEX1));
    
    decoder dec2 (.idata(minu[3:0]), .odata(oHEX2));
    decoder dec3 (.idata(minu[7:4]), .odata(oHEX3));
    
    decoder dec4 (.idata(hour[3:0]), .odata(oHEX4));
    decoder dec5 (.idata(hour[7:4]), .odata(oHEX5));
        
endmodule
