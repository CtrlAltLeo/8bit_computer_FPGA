module output_register(
    input clk,
    //input fast_clk,

    output reg [6:0] display,
    
    input clear,
    input [7:0] bus,
    input input_en
    );
    
    reg [7:0] data;
    reg [3:0] digit0, digit1, digit2;
    
    //initialize space for the conversion
    reg [19:0] conversion;
    
    always @(posedge clk) begin
        if (input_en) begin
            data <= bus;
        end
    end
    
    integer i;
    always @(*) begin
        conversion[7:0] = data;
        for (i = 0; i < 8; i++) begin
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
    
    always @(*) begin
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
        endcase
    end
    
    /*always @(posedge fast_clk) begin
        display <= display + 1; //cycle through four displays
        
        case (display == 2'b00)


    end
    */

endmodule