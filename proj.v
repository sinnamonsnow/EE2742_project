`timescale 1ns / 1ps

module proj(Req, Blk, clk, FLR1, FLR2, FLR3, Door,Reset);
	input Blk, clk;
	input [3:1] Req;
	output FLR1, FLR2, FLR3, Door;
	reg [4:1]state, next;
	param FL1=4'b0001,FL2=4'b0010,FL3=4'b0100,Op11=4'b1001,Op12=4'b0011,Op21=4'b1010,Op22=4'b0110,Op31=4'b1100,Op32=4'b1110;
	
	//initializing
	initial begin
		state=FL1;
		Req=3'bxxx;
		end
	//clk cycle
	always@(posedge clk)
		if(Reset)
			state=FL1;
		else begin
			past=state;
			state=next;
			end
	//sequential 
	always@(state,Blk,Req)
	begin
		case(state)
		FL1:begin
			if(Req==3'b001)
			next=Op11;
			else if(Req==3'b010||Req==3'b100)
			next=FL2;
			else next=state;
			end
		FL2:begin
			if(Req==3'b010)
			next=Op21;
			else if(Req==3'b100)
			next=FL3;
			else if(Req==3'b001)
			next=FL1;
			else next=state;
			end
		FL3:begin
			if(Req==3'b001)
			next=Op11;
			else if(Req==3'b010||Req==3'b100)
			next=FL2;
			else next=FL1;
			end
		Op11:next=Op12;
		Op12:begin
			if(!Blk)
			next=FL1;
			else next=Op11;
			end
		Op21:next=Op22;
		Op22:begin
			if(!Blk)
			next=FL2;
			else next=Op21;
			end
		Op31:next=Op32;
		Op32:begin
			if(!Blk)
			next=FL3;
			else next=Op31;
			end
		default: next=state;
		endcase
	end
	//output
	assign FLR1=(state==FL1||Op11||Op12);
	assign FLR2=(state==FL2||Op21||Op22);
	assign FLR3=(state==FL3||Op31||Op32);
	assign Door=(state==Op11||Op12||Op21||Op22||Op31||Op32);
endmodule
