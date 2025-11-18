//Counter module (74LS161A)
module programCounter (
    clk,
    reset,
    start,
    stop,
    count
    );
    
    input        clk;
    input        reset;
    input        start;
    input        stop;
    output [3:0] count;
    
    reg [15:0]  my_clk;
	reg			sub_clk;
    reg         cnt_en;
    reg [3:0]   count;
    reg         stop_d1;
    reg         stop_d2;
	 

	 
    //Design
	//Counter to Slow Clock
    
    /*always @ ( posedge clk or posedge reset )
    begin
        if ( reset )
		  begin
            clk_cnt <= 16'd0;
				sub_clk <= 1'b0;
		  end
        else if ( clk_cnt === 16'hFFFF )
		  begin
            clk_cnt <= 16'd0;
				sub_clk <= 1'b1;
		  end
        else
		  begin
            clk_cnt <= clk_cnt + 1;
				sub_clk <= 1'b0;
		  end
    end*/
	 
	 //Slow clock
	 
	 /*always @ ( posedge clk or posedge reset )
	 begin
		if ( reset )
			my_clk*/

	 
    //SR Flop
    always @ ( posedge clk or posedge reset )
    begin
        if ( reset )
            cnt_en <= 1'b0;
        else if ( start )
            cnt_en <= 1'b1;
        else if ( stop )
            cnt_en <=1'b0;
    end

    //Counter
    always @ ( posedge clk or posedge reset )
    begin
        if ( reset )
            count <= 4'b0;
        else if ( cnt_en && count === 4'd7 && sub_clk)
            count <= 4'b0;
        else if ( cnt_en && sub_clk)
            count <= count + 1;
    end
	 
        
    //Delay
    /*always @ ( posedge clk or posedge reset )
    begin
        if ( reset )
        begin
            stop_d1 <= 1'b0;
            stop_d2 <= stop_d1;
        end
    end*/
endmodule

//Bus transceiver (74LS245)
