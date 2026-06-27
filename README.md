# Foundational Digital Design & Verilog HDL Portfolio

Welcome to my digital design portfolio. This repository contains a comprehensive collection of fundamental combinational and sequential logic circuits designed and implemented in synthesizable **Verilog HDL** and verified using **Xilinx Vivado** simulation testbenches.

This repository serves as a showcase of my understanding of RTL design, testbench verification, and digital system fundamentals, built during my B.Tech ECE studies at DDU Nadiad.

---

## 📂 Repository Structure

*   **`src/`**: Contains the Verilog source code for all design modules.
*   **`tb/`**: Contains the testbenches used to simulate and verify each design.
*   **`.gitignore`**: Excludes heavy Vivado-generated directories (`.cache`, `.hw`, `.sim`, etc.) to keep the repository lightweight and clean.

---

## 🛠️ Implemented Design Modules

The repository is categorized into four key areas of digital design:

### 1. Arithmetic & Addition Circuits
*   **Half Adder / Subtractor:** Foundational 1-bit arithmetic cells modeled at the gate level.
*   **Full Adder / Subtractor:** Modeled structurally using two half-adder/subtractor cells and primitive gates.
*   **4-Bit Ripple Carry Adder:** Cascaded Full Adders demonstrating carry propagation.
*   **BCD Adder:** Implements binary-coded decimal addition with correction logic ($+6$ correction) for sums greater than 9.

### 2. Combinational Logic Blocks
*   **Multiplexers (2:1 and 4:1 MUX):** Signal selection blocks designed using behavioral case statements.
*   **Demultiplexer (1:2 DEMUX):** Data routing block demonstrating prevention of unintentional latches.
*   **Decoder (2:4 Decoder):** Selects one of 4 outputs based on a 2-bit binary input.
*   **Encoders (4:2 Encoder & Priority Encoder):** Implements binary encoding and priority resolution logic using case statements.

### 3. Level-Sensitive Latches
*   **SR Latch & JK Latch:** Basic bistable elements designed with gate-level feedback loop logic.
*   **D Latch & T Latch:** Gated data and toggle latches showing level-sensitive enable control.

### 4. Sequential Shift Registers (RTL Registers)
*   **SISO (Serial-In Serial-Out):** Shifts data bit-by-bit; demonstrates serial time-delay paths.
*   **SIPO (Serial-In Parallel-Out):** Deserialization circuit converting serial inputs into a 4-bit parallel bus.
*   **PISO (Parallel-In Serial-Out):** Serialization circuit featuring a control line for parallel loading and serial shifting.
*   **PIPO (Parallel-In Parallel-Out):** Basic register that loads and outputs data in parallel.
*   **Universal Shift Register (USR):** Implements left-shift, right-shift, parallel-load, and hold modes controlled by a mode selector input.

---

## 🎓 Key Hardware Concepts Demonstrated

Through these designs, I have mastered the following fundamental concepts:
*   **Design Methodologies:** Gate-Level Modeling, Dataflow Modeling (continuous assignments), and Behavioral Modeling (`always` blocks).
*   **Blocking (`=`) vs. Non-Blocking (`<=`) Assignments:** Proper use of blocking assignments for combinational logic and non-blocking assignments for sequential registers to prevent race conditions.
*   **Latch Avoidance:** Structuring conditional statements (`if-else` and `case`) to fully define all outputs in all branches, preventing the compiler from generating unintentional latches.
*   **Reset Strategies:** Understanding the advantages and design implications of **Synchronous Resets** (sampled on clock edges) vs. **Asynchronous Resets** (immediate action).

---

## 🚀 How to Run & Verify

1.  Open **Xilinx Vivado**.
2.  Create a new RTL Project.
3.  Add the contents of the `src/` folder as **Design Sources**.
4.  Add the contents of the `tb/` folder as **Simulation Sources**.
5.  In the Sources hierarchy pane, right-click the testbench you want to run (e.g., `siso_tb.v`) and select **Set as Top**.
6.  Go to the Flow Navigator on the left and click **Run Simulation** ➔ **Run Behavioral Simulation**.
