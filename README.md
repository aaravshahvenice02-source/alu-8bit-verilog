# 8-bit ALU (Arithmetic Logic Unit) in Verilog

## Objective
Design and simulate an 8-bit ALU that performs arithmetic (addition, subtraction) and logical (AND, OR, XOR) operations.

## Tools Used
- Icarus Verilog (compile and simulate)
- GTKWave (waveform viewer)

## Interface
| Signal | Direction | Width | Description |
|--------|-----------|-------|-------------|
| A | input | 8 | First operand |
| B | input | 8 | Second operand |
| Sel | input | 3 | Operation select |
| Result | output | 8 | Operation result |
| CarryOut | output | 1 | Carry (add) / borrow (subtract) |
| Zero | output | 1 | High when Result is zero |

## Operations
| Sel | Operation |
|-----|-----------|
| 000 | Addition |
| 001 | Subtraction |
| 010 | AND |
| 011 | OR |
| 100 | XOR |

## Files
- alu.v - ALU design
- tb_alu.v - testbench
- waveform.png - simulation waveform
- simulation_output.png - terminal output

## How to Run
iverilog -o alu.out alu.v tb_alu.v
vvp alu.out
gtkwave alu.vcd

## Results
All test cases pass, including edge cases: overflow (255 + 1 gives 0 with Carry=1), equal subtraction (Zero flag set), negative result (5 - 10 gives 251 with borrow flag) and invalid Sel (output 0).
