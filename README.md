# 3-Bit Gray Code Counter Using SR Flip-Flops

## Overview

This project implements a **3-bit Gray Code Counter** using **SR Flip-Flops** in Verilog HDL. The design employs structural modeling, where combinational logic generates the required Set (S) and Reset (R) signals for each flip-flop. The counter follows the Gray code sequence, ensuring that only **one bit changes between consecutive states**, minimizing switching activity and reducing the possibility of transition errors.

---

## Project Structure

```text
├── SR_ff.v            # SR Flip-Flop module
├── SR_ff_graycode.v      # Top-level Gray code counter
├── tb_SR_ff_graycode.v     # Testbench
└── README.md
```

---

## Design Architecture

The project consists of two Verilog modules:

### 1. SR Flip-Flop (`SR_ff.v`)

A positive-edge triggered **SR Flip-Flop** with an asynchronous active-high reset.

#### Inputs

| Signal | Description |
|---------|-------------|
| `clk` | System clock |
| `rst` | Asynchronous active-high reset |
| `s` | Set input |
| `r` | Reset input |

#### Output

| Signal | Description |
|---------|-------------|
| `q` | Flip-Flop output |

#### Truth Table

| S | R | Next State |
|---|---|------------|
| 0 | 0 | Hold Previous State |
| 0 | 1 | Reset (0) |
| 1 | 0 | Set (1) |
| 1 | 1 | Invalid / Undefined |

---

### 2. Gray Code Counter (`SR_ff_graycode.v`)

This module implements a **3-bit Gray Code Counter** by connecting three SR Flip-Flops with combinational logic.

#### Inputs

| Signal | Description |
|---------|-------------|
| `clk` | Clock input |
| `rst` | Active-high reset |

#### Output

| Signal | Description |
|---------|-------------|
| `c[2:0]` | 3-bit Gray code output |

---

## Next-State Logic

The Set and Reset inputs for each SR Flip-Flop are generated using combinational logic.

### Flip-Flop 2 (MSB)

```
S2 = Q1 · Q0̅
R2 = Q1̅ · Q0̅
```

---

### Flip-Flop 1

```
S1 = Q2̅ · Q0
R1 = Q2 · Q0
```

---

### Flip-Flop 0 (LSB)

```
S0 = Q2 XNOR Q1
R0 = Q2 XOR Q1
```

---

## Working Principle

1. When the reset signal is asserted, all flip-flops are initialized to `000`.
2. On each rising edge of the clock, the combinational logic generates the required Set and Reset signals.
3. Each SR Flip-Flop updates its output simultaneously.
4. The counter progresses through the Gray code sequence, where only one output bit changes at each transition.
5. This characteristic minimizes switching noise and reduces transition errors in digital systems.

---

## Gray Code Sequence

An example 3-bit Gray code sequence is shown below:

| Decimal | Gray Code |
|---------:|:---------:|
| 0- 000   | 000       |
| 1- 001   | 001       |
| 2- 010   | 011       |
| 3- 011   | 010       |
| 4- 100   | 110       |
| 5- 101   | 111       |
| 6- 110   | 101       |
| 7- 111   | 100       |

---

## Testbench

The testbench (`tb_SR_ff_graycode.v`) verifies the operation of the Gray code counter.

### Simulation Procedure

- Generate a clock with a **10-time unit period**.
- Assert reset during the initial simulation period.
- Release reset after **10 time units**.
- Continue simulation for **1000 time units**.
- Observe the Gray code sequence in the waveform.

---

## Simulation Flow

Compile the source files in the following order:

```text
SR_ff.v
SR_ff_graycode.v
tb_SR_ff_graycode.v
```

Run the simulation using ModelSim or QuestaSim:

```tcl
vlib work
vlog tb_SR_ff_graycode.v
vsim tb_SR_ff_graycode
add wave *
run -all
```

---

## Features

- Structural Verilog implementation
- Positive-edge triggered SR Flip-Flops
- Asynchronous active-high reset
- Gray code sequence generation
- Modular and reusable architecture
- Reduced switching activity
- Compatible with ModelSim and QuestaSim

---

## Applications

- Gray code counters
- Rotary encoders
- Finite State Machines (FSMs)
- Digital communication systems
- FPGA and ASIC designs
- Low-power digital circuits
- Error-resistant digital interfaces

---

## Tools Used
Language:Verilog HDL
Simulator: ModelSim / QuestaSim
code editor: Gvim


---

## Author
**Kabilan N S**

Digital Design | RTL Design | Verilog HDL | VLSI Design & Verification