# 🚦 Traffic Light Controller - Verilog Module

## Overview

This Verilog module implements a **traffic light controller** for a simple intersection between a **highway** and a **farm road**. The controller follows a state machine design to control red, yellow, and green lights for both the highway and the farm road based on predefined timer values.

This simulation is ideal for learning how digital systems can manage real-world control scenarios using **Finite State Machines (FSMs)** and **timers**.

---

## 🛠️ Features

- Implements a 4-state traffic light control system:
  - `Highway Green`
  - `Highway Yellow`
  - `Farm Green`
  - `Farm Yellow`
- Configurable light durations using parameters.
- Synchronous reset and edge-triggered clock-based state transitions.
- Uses a simple internal timer to manage state transitions.

---

## 🔧 Module Interface

```verilog
module traffic_light_controller (
    input clk,            // Clock signal
    input reset,          // Synchronous reset signal
    output reg highway_red,
    output reg highway_yellow,
    output reg highway_green,
    output reg farm_red,
    output reg farm_yellow,
    output reg farm_green
);
```

### Inputs
- **clk**: Clock signal to drive the FSM.
- **reset**: Resets the system to the initial state (`Highway Green`).

### Outputs
- `highway_red/yellow/green`: Control signals for the highway traffic lights.
- `farm_red/yellow/green`: Control signals for the farm road traffic lights.

---

## ⏲️ Timing Parameters

| Parameter             | Description                              | Default |
|-----------------------|------------------------------------------|---------|
| `HIGHWAY_GREEN_TIME`  | Duration highway stays green             | 10      |
| `HIGHWAY_YELLOW_TIME` | Duration highway stays yellow            | 2       |
| `FARM_GREEN_TIME`     | Duration farm road stays green           | 5       |
| `FARM_YELLOW_TIME`    | Duration farm road stays yellow          | 2       |

---

## 🔄 State Machine

The controller cycles through the following states:

1. **S_HIGHWAY_GREEN**  
   - Highway: Green  
   - Farm Road: Red

2. **S_HIGHWAY_YELLOW**  
   - Highway: Yellow  
   - Farm Road: Red

3. **S_FARM_GREEN**  
   - Highway: Red  
   - Farm Road: Green

4. **S_FARM_YELLOW**  
   - Highway: Red  
   - Farm Road: Yellow

Each state runs for a duration determined by the timer and the associated parameter.

---

## 🧠 Internal Logic

- **`current_state`**: Holds the current state of the FSM.
- **`next_state`**: Computed based on the current state and timer.
- **`timer`**: A 4-bit counter to track how long the FSM has been in a state.

---

## 🔄 How It Works

- On each positive clock edge, the FSM checks if the `reset` is active.
  - If so, it resets to the initial state.
  - Otherwise, it transitions based on the current state and timer.
- Light signals are updated in each state according to what should be on/off.
- Timer increments every clock cycle (capped at 15).
- When the timer matches the time limit of the state, the FSM transitions to the next one.

---

## 💡 Example Use Case

This controller is ideal for:
- FPGA-based traffic light simulations.
- Teaching FSM design and time-based logic in digital electronics.
- Embedded system labs or coursework related to traffic control systems.

---

## 📁 File Info

- **File Name**: `traffic_light_controller.v`
- **Language**: Verilog HDL
- **Author**: *Akshit Singh*
- **License**: *MIT / Custom license if needed*

---
