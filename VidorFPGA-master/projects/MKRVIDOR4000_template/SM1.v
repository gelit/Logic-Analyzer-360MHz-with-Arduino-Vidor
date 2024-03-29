// Copyright (C) 2022  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// Generated by Quartus Prime Version 22.1std.0 Build 915 10/25/2022 SC Lite Edition
// Created on Sun Feb 19 11:05:17 2023

// synthesis message_off 10175

`timescale 1ns/1ns

module SM1 (
    reset,iSM1clk,iTrigger,A[10:0],iA5,iA6,iGO,
    oAshift,oClr1,oStart);

    input reset;
    input iSM1clk;
    input iTrigger;
    input [10:0] A;
    input iA5;
    input iA6;
    input iGO;
    tri0 reset;
    tri0 iTrigger;
    tri0 [10:0] A;
    tri0 iA5;
    tri0 iA6;
    tri0 iGO;
    output oAshift;
    output oClr1;
    output oStart;
    reg oAshift;
    reg reg_oAshift;
    reg oClr1;
    reg oStart;
    reg [5:0] fstate;
    reg [5:0] reg_fstate;
    parameter state1=0,state2=1,state3=2,state4=3,state5=4,state6=5;

    initial
    begin
        reg_oAshift <= 1'b0;
    end

    always @(posedge iSM1clk)
    begin
        if (iSM1clk) begin
            fstate <= reg_fstate;
        end
    end

    always @(fstate or reset or iTrigger or A or iA5 or iA6 or iGO or reg_oAshift)
    begin
        if (reset) begin
            reg_fstate <= state1;
            reg_oAshift <= 1'b0;
            oAshift <= 1'b0;
            oClr1 <= 1'b0;
            oStart <= 1'b0;
        end
        else begin
            reg_oAshift <= 1'b0;
            oClr1 <= 1'b0;
            oStart <= 1'b0;
            oAshift <= 1'b0;
            case (fstate)
                state1: begin
                    if ((iTrigger == 1'b1))
                        reg_fstate <= state2;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= state1;

                    oStart <= 1'b0;

                    oClr1 <= 1'b1;

                    reg_oAshift <= 1'b1;
                end
                state2: begin
                    if (((iA5 == 1'b1) & (iA6 == 1'b0)))
                        reg_fstate <= state3;
                    else if (((iA5 == 1'b0) & (iA6 == 1'b1)))
                        reg_fstate <= state4;
                    else if (((iA5 == 1'b1) & (iA6 == 1'b1)))
                        reg_fstate <= state5;
                    else if (((iA5 == 1'b0) & (iA6 == 1'b0)))
                        reg_fstate <= state1;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= state2;

                    oStart <= 1'b0;

                    oClr1 <= 1'b1;

                    reg_oAshift <= 1'b1;
                end
                state3: begin
                    if ((A[10:0] == 11'b11010100100))
                        reg_fstate <= state6;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= state3;

                    oStart <= 1'b0;

                    oClr1 <= 1'b0;

                    reg_oAshift <= 1'b1;
                end
                state4: begin
                    if ((A[10:0] == 11'b01110110110))
                        reg_fstate <= state6;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= state4;

                    oStart <= 1'b0;

                    oClr1 <= 1'b0;

                    reg_oAshift <= 1'b1;
                end
                state5: begin
                    if ((A[10:0] == 11'b00011001000))
                        reg_fstate <= state6;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= state5;

                    oStart <= 1'b0;

                    oClr1 <= 1'b0;

                    reg_oAshift <= 1'b1;
                end
                state6: begin
                    if ((iGO == 1'b1))
                        reg_fstate <= state1;
                    // Inserting 'else' block to prevent latch inference
                    else
                        reg_fstate <= state6;

                    oStart <= 1'b1;

                    oClr1 <= 1'b0;

                    reg_oAshift <= 1'b0;
                end
                default: begin
                    reg_oAshift <= 1'bx;
                    oClr1 <= 1'bx;
                    oStart <= 1'bx;
                    $display ("Reach undefined state");
                end
            endcase
            oAshift <= reg_oAshift;
        end
    end
endmodule // SM1
