//Counter module (74LS161A)
module program_counter (
    clk,
    reset,
    //start,
    //stop,
    count
    );
    
    input        clk;
    input        reset;
    //input        start;
    //input        stop;
    output [3:0] count;
    

    //reg         cnt_en;
    reg [3:0]   count;
    //reg         stop_d1;
    //reg         stop_d2;
	 

	 
    //Design
    
	 
    //SR Flop
    /*always @ ( posedge clk or posedge reset )
    begin
        if ( reset )
            cnt_en <= 1'b0;
        else if ( start )
            cnt_en <= 1'b1;
        else if ( stop )
            cnt_en <=1'b0;
    end*/
	 
	 //counter without reset
	 
	 always @ ( posedge clk or posedge reset )
	 begin
		 if ( reset )
			 count <= 4'b0;
	     else if ( count == 4'd15 )
		      count <= 4'b0;
		  else
		      count <= count + 1;
	 end

    //Counter
	 /*
    always @ ( posedge clk )//or posedge reset )
    begin
        if ( reset )
            count <= 4'b0;
        else if ( cnt_en && count == 4'd7)
            count <= 4'b0;
        else if ( cnt_en )
            count <= count + 1;
    end*/
	 
        
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
