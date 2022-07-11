# MIPS-CPU
A 32-bits MIPS processor implement using VHDL. 

# 1) ALU

ALU multiplexer operation:
Func | 00 | 01 | 10 | 11 | 
--- | --- | --- | --- |--- |
Output | y |  '000...MSB of add_sub | Output of add_sub | Ouput of logic unit  |

The ALU has two sets of control imputs func and logic_func, func determines which of the four possible operations the ALU(lui, slt, arithmetic and logical) is to be performed. The logic_func control input determines which of the for possible logic operations (AND, OR, XOR, NOR) is to be performed. An additional control signal (add_sub) is used to choose between addition or subtraction


# 2) register file

The register file consists of 32 registers (R0-R31).The entire register file can be reset (each register cleared to 0) by asserting the asynchronous active-high reset input. There are two read ports (out_a and out_b). The 5 bit addresses presented on the input ports read_a and read_b determine which of the 32 registers are made available at the output ports out_a and out_b respectively.

![image](https://user-images.githubusercontent.com/91975571/146937672-bd2f19af-79ff-4fa0-9e4f-b3869a75bea7.png)


# 3) Next address unit
The Next-Address unit is responsible for generating the next address which is to be stored in the
Program Counter (PC) register. Before describing the functionality of the next-address unit, we
will first examine encoding format of the jump and branch instructions. The five instructions (expressed in assembly language) are:
                   jump there ; jump to memory location “there”
                   jr rs ; jump to memory location whose address is in rs
                   beq rs,rt, loop ; jump to memory location “loop” if rs=rt
                   bne rs,rt, loop ; jump to memory location ”loop” if rs /= rt
                   bltz rs, loop ; jump to memory location “loop” if rs < 0
                   
All instructions are encoded in a 32 bit wide format with 6 bits used to represent the opcode. Memory addresses are 32 bits wide; consequently the jump instruction uses a variation of direct addressing known as “pseudo-direct” addressing since it is not possible to store the entire 32 bit address within a jump instruction. For the version of the processor implemented in these labs, a simpler form of this pseudo-direct addressing will be used.

![next_address](https://user-images.githubusercontent.com/91975571/178343352-252ca6ac-14c0-4af4-a981-09c01dd7195f.png)

# 4) Sign extend
Some of the MIPS instructions require that the 16-bit immediate field (stored in bits 0 to 15) of the instruction be sign extended to a full 32-bit width.

5)D_cache 
The data cache has an asynchronous reset, a clock (the writes into the data cache are synchronous with the clock), a data_write
control signal (which acts as a enable, in other words, data is written into the memory at the next rising clock edge if data_write = ‘1’), and a 32 bit wide data output port. Since only the load/store instructions access the data cache, the out_b of the register file (which is the rt register) is connected to the d_in port of the data cach

# 6)I_cache
The I-cache unit stores the program machine code. It is a 32 location read-only memory (ROM) consisting of a 5-bit wide address input and a 32-bit wide data output (consisting of the 32 bits of machine code for the instruction stored at the addressed location). It’s contents may be “hardwired” to contain a program in machine code during the development and debugging stages

# 7)PC register
The program counter register is a 32-bit wide register with an asynchronous reset. The input to the PC register is the output of the next-address unit. The output of the PC register ( the low-order 5 bits in order to reduce the size of the instruction cache memory) is used as the address input to the instruction cache memory

# 8) Sign extention
Some of the MIPS instructions require that the 16-bit immediate field (stored in bits 0 to 15) of Iformat instructions be sign extended to a full 32-bit width. The exact manner of this sign extension depends upon the type of instruction to be executed. Table 4 provides a summary of the possible
types of sign extension

# 9) Control unit 
The function of this unit  is to produce the correct values for all the control signals at the proper point in time. Tables 1 and 2 lists the 10 control signals and summarizes their operation.

:arrow_forward: The complete datapath is shown in the figure below
![Datapath](https://user-images.githubusercontent.com/91975571/178344632-7eb617fd-c3a1-44f4-8609-2d469495bfdc.png)


# Additional info
- To simulate the full 32-bit design we need to create a “board wrapper” VHDL file for implementation is is a port the the original entity
- The datapath was fulfilled using VHDL components and port mapping
- The simulation of the entities was done in simuLink as shows below(for register file)

[regfile_results.pdf](https://github.com/Danikh25/MIPS-CPU/files/9087151/regfile_results.pdf)


