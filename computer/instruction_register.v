module instruction_register(
    input clock,
    input reset,
    //instruction register
    inout wire [7:0] bus,
    input read,
    input write,
    input clear,
    );
    
    reg [7:0] instruction;

    always @(posedge clock) begin
        if (reset || clear)
            instruction <= 8'h00;
        else if (read)
            instruction <= bus;
    end
    
    assign bus = write ? instruction : 8'bz;


endmodule
