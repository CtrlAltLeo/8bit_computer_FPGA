module output_register(
    input clk,
    input fast_clk,

    output reg [6:0] digit,
    output reg [1:0] display,
    
    input clear,
    input data_in,
    input [7:0] bus
    );
    
    always @(posedge clk) begin
        if (data_in) begin
            data_in <= bus;
        end
    end
    
    always @(posedge fast_clk) begin
        display <= display + 1; //cycle through four displays
        
        case (display == 2'b00)


    end

endmodule
/*
    always @(*) begin
        case (state)
            s0: begin
                ns_light = 2'b10; //green
                ew_light = 2'b00; //red
            end
            s1: begin
                ns_light = 2'b01; //yellow
                ew_light = 2'b00; //red
            end
            s2: begin
                ns_light = 2'b00; //red
                ew_light = 2'b10; //green
            end
            s3: begin
                ns_light = 2'b00; //red
                ew_light = 2'b01; //yellow
            end
        endcase
        */