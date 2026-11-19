`timescale 1ns/1ps

module tb_alu;
    reg  [7:0] A, B;
    reg  [2:0] Sel;
    wire [7:0] Result;
    wire CarryOut, Zero;

    alu uut (.A(A), .B(B), .Sel(Sel), .Result(Result), .CarryOut(CarryOut), .Zero(Zero));

    task check;
        input [7:0] a;
        input [7:0] b;
        input [2:0] s;
        begin
            A = a; B = b; Sel = s;
            #10;
            $display("Sel=%b A=%3d B=%3d -> Result=%3d Carry=%b Zero=%b", Sel, A, B, Result, CarryOut, Zero);
        end
    endtask

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, tb_alu);

        $display("---- 8-bit ALU Test ----");
        check(8'd25,  8'd10,  3'b000);            // ADD: 35
        check(8'd25,  8'd10,  3'b001);            // SUB: 15
        check(8'b11001100, 8'b10101010, 3'b010);  // AND: 136
        check(8'b11001100, 8'b10101010, 3'b011);  // OR : 238
        check(8'b11001100, 8'b10101010, 3'b100);  // XOR: 102
        check(8'd255, 8'd1,   3'b000);            // ADD overflow: Result 0, Carry 1, Zero 1
        check(8'd10,  8'd10,  3'b001);            // SUB equal: Result 0, Zero 1
        check(8'd5,   8'd10,  3'b001);            // SUB negative: 251, borrow flag 1
        check(8'd7,   8'd7,   3'b111);            // invalid Sel: 0
        $display("---- Done ----");
        $finish;
    end
endmodule
