# RAM-DESIGN

Synchronous RAM (SRAM) is a type of memory where all operations—read and write—are synchronized with the clock signal.
Unlike asynchronous RAM, where memory access occurs instantly with signal changes, synchronous RAM performs operations only on the active edge of the clock (usually the rising edge).
This makes it suitable for digital systems like FPGAs, microcontrollers, and CPUs, where timing and synchronization are crucial.

Key Features of Synchronous RAM:
All memory operations are clock-driven.

Offers better timing control and synchronization with the rest of the system.

Suitable for both single-port and dual-port RAM designs.

Read and write operations often use enable signals to control memory access.


This Verilog code defines a synchronous RAM module, which is a small memory block that can store and retrieve data. The RAM operations are controlled by a clock signal, meaning it can only read or write data on the rising edge of the clock.

💡 What the Code Contains:
Memory Block
The code creates a memory array using:

verilog
Copy
Edit
reg [7:0] mem [0:15];
This means there are 16 memory locations, and each can store 8 bits (1 byte) of data.

Clock and Reset
The memory responds to a clock signal (clk) and sometimes a reset signal to initialize values.

Tasks for Read and Write

Write Task: Takes an address and data, and writes the data into that address.

Read Task: Takes an address and gives back the data stored at that location. These are defined using Verilog task blocks and are used for simulation.

Testbench Friendly
These tasks are often called from a testbench to check if the memory is working correctly—by writing data and reading it back to verify.

🔍 Example Behavior:
Imagine the RAM like a tiny 16-drawer cabinet.

You say: "Put number 100 into drawer 5" → That's a write.

Later, you say: "Open drawer 5 and tell me what's inside" → That's a read.

The code allows you to do this, but only when the clock says it's time (i.e., on its rising edge).

