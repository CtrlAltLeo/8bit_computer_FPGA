module output_register(
    input clk,
    input fast_clk,

    output reg [6:0] display,
    output reg [2:0] display_en,
    
    input clear,
    input [7:0] bus,
    input input_en
    );
    
    reg [7:0] data;
    reg [3:0] digit0, digit1, digit2;
    
    //initialize space for the conversion
    reg [19:0] conversion;
    
    
    //accpt input when enabled
    always @(posedge clk) begin
        if (input_en) begin
            data <= bus;
        end
    end
    
    //rotate through the three digits
    always @(posedge fast_clk) begin
        if (display_en == 3'b110) begin
            display_en <= 3'b101;
        end else if (display_en == 3'b101) begin
            display_en <= 3'b011;
        end else begin
            display_en <= 3'b110;
        end
    end
    
    //binary to bcd conversion
    integer i;
    always @(*) begin
        conversion = 20'b0;
        conversion[7:0] = data;
        for (i = 0; i < 8; i = i + 1) begin
            if (conversion[11:8] > 4'd4) begin
                conversion[11:8] = conversion[11:8] + 3;
            end
            if (conversion[15:12] > 4'd4) begin
                conversion[15:12] = conversion[15:12] + 3;
            end
            if (conversion[19:16] > 4'd4) begin
                conversion[19:16] = conversion[19:16] + 3;
            end
            conversion = conversion << 1;
        end
        digit0 = conversion[11:8];
        digit1 = conversion[15:12];
        digit2 = conversion[19:16];
    end
    
    //display the digit
    always @(*) begin
        if (!display_en[0]) begin
            case (digit0)
                0: display = 7'b1111110;
                1: display = 7'b0110000;
                2: display = 7'b1101101;
                3: display = 7'b1111001;
                4: display = 7'b0110011;
                5: display = 7'b1011011;
                6: display = 7'b1011111;
                7: display = 7'b1110000;
                8: display = 7'b1111111;
                9: display = 7'b1111011;
                default: display = 7'b11111111;
            endcase
        end else if (!display_en[1]) begin
            case (digit1)
                0: display = 7'b1111110;
                1: display = 7'b0110000;
                2: display = 7'b1101101;
                3: display = 7'b1111001;
                4: display = 7'b0110011;
                5: display = 7'b1011011;
                6: display = 7'b1011111;
                7: display = 7'b1110000;
                8: display = 7'b1111111;
                9: display = 7'b1111011;
                default: display = 7'b11111111;
            endcase
        end else if (!display_en[2]) begin
            case (digit2)
                0: display = 7'b1111110;
                1: display = 7'b0110000;
                2: display = 7'b1101101;
                3: display = 7'b1111001;
                4: display = 7'b0110011;
                5: display = 7'b1011011;
                6: display = 7'b1011111;
                7: display = 7'b1110000;
                8: display = 7'b1111111;
                9: display = 7'b1111011;
                default: display = 7'b11111111;
            endcase
        end else begin
            display = 7'b11111111;
        end
    end
    
endmodule