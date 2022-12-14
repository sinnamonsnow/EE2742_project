`timescale 1ns / 1ps
module proj(Req, Blk, clk, FLR1, FLR2, FLR3, Door,Reset);
    input Blk, clk,Reset;
    input [3:1] Req;
    output reg FLR1, FLR2, FLR3, Door;
    reg [4:1]state, next;
    reg [3:1]F;
    reg D;
    parameter FL1=4'b0001,FL2=4'b0010,FL3=4'b0100,OP11=4'b1001,OP12=4'b0011,OP21=4'b1010,OP22=4'b0110,OP31=4'b1100,OP32=4'b1110;
    
    initial begin
        state=FL1;
        F='b001;
        FLR1=F[1];
        FLR2=F[2];
        FLR3=F[3];
    end
    always@(posedge clk)
    begin
        state=next;
        FLR1=F[1];
        FLR2=F[2];
        FLR3=F[3];
        Door=D;
    end
    
    always@(Req,Blk,state)
    begin
    case(state)
        FL1:begin
            F='b001;D=0;
            if(Req==3'b001)
            next=OP11;
            else if(Req==3'b010||Req==3'b100)
            next=FL2;
            else next=FL1;
        end
        FL2:begin
            F='b010;D=0;
            if(Req==3'b010)
            next=OP21;
            else if(Req==3'b100)
            next=FL3;
            else if(Req==3'b001)
            next=FL1;
            else next=FL2;
        end
        FL3:begin
            F='b100;D=0;
            if(Req==3'b100)
            next=OP31;
            else if(Req==3'b010||Req==3'b001)
            next=FL2;
            else next=FL3;
        end
        OP11:begin
            D=1;
            F='b001;
            next=OP12;
        end
        OP12:begin
            D=1;
            F='b001;
            if(!Blk)
            next=FL1;
            else next=OP11;
        end
        OP21:begin
            D=1;
            F='b010;
            next=OP22;
        end
        OP22:begin
            D=1;
            F='b010;
            if(!Blk)
            next=FL2;
            else next=OP21;
        end
        OP31:begin
            D=1;
            F='b100;
            next=OP32;
        end
        OP32:begin
            D=1;
            F='b100;
            if(Blk)
            next=OP31;
            else next=FL3;
        end
    endcase
    end
endmodule
