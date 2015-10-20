module demo(
    input      clk,
    output reg LED1,
    output reg LED2,
    output     LED3,
    output     LED4,
    output     LED5,
    input      PMOD1, // input A
    input      PMOD2, // input B
    input      PMOD3, // run/stop
    input      PMOD4  // reset
    );


// Manage 12MHz clock
   reg [10:0] cnt1;
   reg [10:0]  cnt2;
   reg [0:0]  dec_cntr;
   reg 	      half_sec_pulse;

   assign LED5 = (dec_cntr == 1) ;//green
   //assign LED4 = (dec_cntr == 0) ;//red
   //assign LED3 = (dec_cntr == 0) ;//red
   //assign LED2 = (dec_cntr == 0) ;//red
   //assign LED1 = (dec_cntr == 0) ;//red


// The 12MHz clock is too fast
	always@(posedge clk)
	       begin
		  cnt1 <=  cnt1 + 1;
		  //if (cnt1 < 524287 )	
		  if (cnt1 == 0 )	
		   begin
		    dec_cntr <= dec_cntr + 1; // count half seconds
		    cnt2 <=  cnt2 + 1;
		   end
		  if (cnt1 == cnt2 )
		   begin
		   dec_cntr <= dec_cntr + 1;
		   end
	       end

endmodule
