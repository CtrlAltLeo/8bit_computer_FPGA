module output_register(
    input clk,
    input fast_clk,

    output reg [6:0] digit,
    //output reg [1:0] display,
    
    input clear,
    input [7:0] bus
    );
    
    reg [7:0] data_in;
    
    //initialize space for the conversion
    reg [19:0] conversion;
    
    always @(posedge clk) begin
        if (data_in) begin
            data_in <= bus;
        end
    end
    
    always @(*) begin
        conversion[7:0] = data_in;
        while (conversion[7:0] > 7'd0) begin
            conversion = conversion << 1;
            if (conversion[11:8] => 4'd5) begin
                conversion[11:8] = conversion[11:8] + 3;
            end
            if (conversion[15:12] => 4'd5) begin
                conversion[15:12] = conversion[15:12] + 3;
            end
            if (conversion[19:16] => 4'd5) begin
                conversion[19:16] = conversion[19:16] + 3;
            end
        end
    end
    
    /*always @(posedge fast_clk) begin
        display <= display + 1; //cycle through four displays
        
        case (display == 2'b00)


    end
    */

endmodule