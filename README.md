# MIPS-CPU
A 32-bits MIPS processor implement using VHDL. 

1) ALU
ALU multiplexer operation:
Func | 00 | 01 | 10 | 11 | 
--- | --- | --- | --- |--- |
Output | y |  '000...MSB of add_sub | Output of add_sub | Ouput of logic unit  |

The ALU has two sets of control imputs func and logic_func, func determines which of the four possible operations the ALU(lui, slt, arithmetic and logical) is to be performed. The logic_func control input determines which of the for possible logic operations (AND, OR, XOR, NOR) is to be performed. An additional control signal (add_sub) is used to choose between addition or subtraction


2) register file
The register file consists of 32 registers (R0-R31).The entire register file can be reset (each register cleared to 0) by asserting the asynchronous active-high reset input. There are two read ports (out_a and out_b). The 5 bit addresses presented on the input ports read_a and read_b determine which of the 32 registers are made available at the output ports out_a and out_b respectively.

![image](https://user-images.githubusercontent.com/91975571/146937672-bd2f19af-79ff-4fa0-9e4f-b3869a75bea7.png)
