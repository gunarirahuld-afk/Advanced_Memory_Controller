Advanced Memory Controller using Verilog HDL
Overview

Designed and implemented an Advanced Memory Controller using Verilog HDL for memory read and write operations. The design was simulated using Icarus Verilog, verified with GTKWave, synthesized using Yosys, and analyzed through RTL schematic generation.

Features
Memory read and write operations
Address-based data access
Synchronous control logic
RTL simulation and waveform verification
Yosys RTL synthesis
RTL schematic generation
Verification of multiple memory locations
Simulation Result
READ 1
Address = 10
Data    = deadbeef
READ 1 TEST: PASS

READ 2
Address = 25
Data    = 12345678
READ 2 TEST: PASS

==========================================
Advanced Memory Controller Test Complete
==========================================
RTL Synthesis

Yosys was used for RTL synthesis and design verification.

Found and reported 0 problems.
Synthesis Statistics
22 wires
316 wire bits
9 public wires
76 public wire bits
9 ports
76 port bits
16 cells
3 $dff
1 $mem_v2
12 $mux
Verification

GTKWave was used to analyze the generated VCD waveform and verify memory control, address, write-data, read-data, and read/write operation signals.

Tools Used

Verilog HDL, Icarus Verilog, GTKWave, Yosys

Project Structure
Advanced_Memory_Controller/
├── rtl/
│   └── advanced_memory_controller.v
├── tb/
│   └── tb_advanced_memory_controller.v
├── sim/
│   ├── advanced_memory_controller.vcd
│   ├── advanced_memory_controller_synth.v
│   ├── advanced_memory_controller_schematic.dot
│   └── advanced_memory_controller_schematic.png
└── README.md
Author

Rahul D G
Electronics and Communication Engineering
