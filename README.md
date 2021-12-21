# MIPS-CPU
A 32-bits MIPS processor implement using VHDL. 


ALU multiplexer operation:
Func | 00 | 01 | 10 | 11 | 
--- | --- | --- | --- |--- |
Output | y |  '000...MSB of add_sub | Output of add_sub | Ouput of logic unit  |

The ALU has two sets of control imputs func and logic_func, func determines which of the four possible operations the ALU(lui, slt, arithmetic and logical) is to be performed. The logic_func control input determines which of the for possible logic operations (AND, OR, XOR, NOR) is to be performed. An additional control signal (add_sub) is used to choose between addition or subtraction
