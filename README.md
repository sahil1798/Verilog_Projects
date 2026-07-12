# Verilog HDL Designs & Projects

This repository contains my Verilog HDL designs and testbenches, developed and simulated using Xilinx Vivado. The project folder structure is organized hierarchically by design complexity.

## 📂 Repository Directory Layout

Each project or category folder contains its own dedicated `/src` (design sources) and `/tb` (verification testbenches) directories:

```
Verilog_Projects/
├── Complex_Systems/                 # System-level complex RTL designs
│   ├── FIFO_Buffer/                 # Parameterized FIFO system
│   │   ├── src/
│   │   └── tb/
│   ├── Elevator_Controller/         # Emergency-safe lift FSM
│   │   ├── src/
│   │   └── tb/
│   └── Traffic_Light_Controller/    # Moore FSM traffic cycle manager
│       ├── src/
│       └── tb/
└── Foundational_Blocks/             # Standard digital logic blocks
    ├── Arithmetic/                  # Adders, subtractors, and BCD addition
    │   ├── src/
    │   └── tb/
    ├── MUX_DEMUX/                   # Multiplexers, decoders, and encoders
    │   ├── src/
    │   └── tb/
    ├── Latches/                     # SR, JK, D, and T Latches
    │   ├── src/
    │   └── tb/
    └── Registers/                   # Shift registers and USR
        ├── src/
        └── tb/
```

---

## 🚀 System-Level RTL Designs (Complex Projects)

*   **Synchronous FIFO Buffer (`Complex_Systems/FIFO_Buffer`):** An 8x8 FIFO queue with read/write pointers, status flags (`full`, `empty`), and independent write/read controls for simultaneous operations. Includes structural wrapping with a transmitter (`mod_a`) and a receiver FSM (`mod_b`).
*   **Elevator (Lift) Controller (`Complex_Systems/Elevator_Controller`):** An FSM-based controller for a 4-floor building. Features direction control, door timers, a one-hot request resolver, and an emergency stop line.
*   **Traffic Light Controller (`Complex_Systems/Traffic_Light_Controller`):** A Moore FSM managing a Main Street/Side Street intersection using a clocked cycle counter for state durations.

---

## 🛠] Foundational Digital Blocks

These are standard combinational and sequential building blocks:

*   **Registers (`Foundational_Blocks/Registers`):** SISO, SIPO, PISO, PIPO shift registers and a 4-bit Universal Shift Register.
*   **Latches (`Foundational_Blocks/Latches`):** Gate-level SR, JK, D, and T bistable elements.
*   **MUX, DEMUX, Decoders & Encoders (`Foundational_Blocks/MUX_DEMUX`):** Multiplexers (2:1, 4:1), Demultiplexers (1:2), Decoders (2:4), and Encoders (4:2, Priority).
*   **Arithmetic (`Foundational_Blocks/Arithmetic`):** Half/Full Adders/Subtractors, 4-bit Ripple Carry Adder, and BCD Adder with correction logic.

---

## 💻 Simulation & Verification

To run behavioral simulations:
1. Open **Xilinx Vivado** and create an RTL project.
2. Add files from the desired `/src` folder as **Design Sources** and the corresponding `/tb` folder as **Simulation Sources**.
3. Right-click the testbench file (e.g., `lift_controller_tb.v`) ➔ **Set as Top**.
4. Click **Run Simulation** ➔ **Run Behavioral Simulation**.
