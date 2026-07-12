# Verilog HDL Designs & Projects

This repository contains my Verilog HDL designs and testbenches, developed and simulated using Xilinx Vivado. The projects are split into system-level designs and foundational digital building blocks.

## 📂 Directory Layout
*   `/src`: Verilog design source files (`.v`)
*   `/tb`: Testbenches for verification (`.v`)

---

## 🚀 System-Level RTL Designs (Complex Projects)

These are larger, state-machine driven or buffer-based designs that integrate multiple blocks.

*   **Synchronous FIFO Buffer (`fifo_8_8.v`):** An 8x8 FIFO queue with read/write pointers, status flags (`full`, `empty`), and independent write/read controls for simultaneous operations.
*   **Elevator (Lift) Controller (`lift_controller.v`):** An FSM-based controller for a 4-floor building. Features direction control, door timers, a one-hot request resolver, and an emergency stop line.
*   **Traffic Light Controller (`traffic_light_controller.v`):** A Moore FSM managing a Main Street/Side Street intersection using a clocked cycle counter for state durations.
*   **Top FIFO System Wrapper (`top_fifo.v`):** Structural top-level design wiring a data transmitter (`mod_a`) and a receiver FSM (`mod_b`) around the FIFO queue.

---

## 🛠️ Foundational Digital Blocks

These are standard combinational and sequential blocks that form the building blocks of digital logic.

### 1. Shift Registers & Memory
*   **Universal Shift Register (`universal_register.v`):** Left-shift, right-shift, parallel-load, and hold modes.
*   **SISO / SIPO / PISO / PIPO:** Basic serial/parallel shifting configurations.
*   **RAM 8x8 (`RAM_8_8.v`):** Simple read/write memory bank.

### 2. Latches
*   **SR / JK / D / T Latches:** Level-sensitive feedback storage elements.

### 3. MUX, DEMUX, Decoders & Encoders
*   **Multiplexers:** 2:1 and 4:1 behavioral multiplexers.
*   **Demultiplexer:** 1:2 routing block.
*   **Decoder:** 2:4 binary decoder.
*   **Encoders:** 4:2 encoder and 4:2 priority encoder.

### 4. Adders & Subtractors
*   **BCD Adder (`bcd_adder.v`):** Binary-coded decimal addition with $+6$ correction logic.
*   **Ripple Carry Adder (`ripple_carry_adder.v`):** 4-bit carry-propagation adder.
*   **Half/Full Adder & Subtractor:** Gate-level and structural arithmetic cells.

---

## 💻 Simulation & Verification

To run behavioral simulations:
1. Open **Xilinx Vivado** and create an RTL project.
2. Add files from `/src` as **Design Sources** and `/tb` as **Simulation Sources**.
3. Right-click the desired testbench (e.g., `lift_controller_tb.v`) ➔ **Set as Top**.
4. Click **Run Simulation** ➔ **Run Behavioral Simulation**.
