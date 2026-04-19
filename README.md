# Synchronous FIFO in Verilog

This project implements a single-clock (synchronous) FIFO buffer using Verilog HDL. It demonstrates core RTL design concepts such as sequential logic, memory modeling, and control signal handling.

## Overview

The FIFO follows a First-In-First-Out data flow, where data written into the buffer is read out in the same order. It uses a circular buffer architecture with separate read and write pointers.

## Features

- 64 × 8 FIFO (64-depth, 8-bit data width)  
- Single clock domain (synchronous design)  
- Circular buffer with pointer wrap-around  
- Counter-based FIFO occupancy tracking  
- `full` and `empty` flag generation  
- Supports simultaneous read and write operations  

## Files

- `FIFO.v` – RTL design of the FIFO  
- `FIFO_tb.v` – Testbench for functional verification  

## Design Description

The FIFO uses separate read and write pointers that increment on valid operations and wrap around using modulo addressing.

A counter keeps track of the number of elements stored in the FIFO and is used to generate the `full` and `empty` signals.

## Operation

- Data is written when `wr_en` is high and FIFO is not full  
- Data is read when `rd_en` is high and FIFO is not empty  
- All operations occur on the rising edge of the clock  
- Simultaneous read and write operations are supported  

## Verification

The testbench verifies:

- Normal read/write operations  
- Simultaneous read and write  
- FIFO full and empty conditions  
- Pointer wrap-around behavior  

## Applications

FIFO buffers are widely used in digital systems for:

- Data buffering  
- Pipeline decoupling  
- Rate matching between modules  
<img width="1831" height="1013" alt="RTL schematic" src="https://github.com/user-attachments/assets/3b7a6571-13aa-4cc0-96a2-6429157ac0f8" />
---
<img width="1891" height="980" alt="Simulation" src="https://github.com/user-attachments/assets/0f7bafec-7f0f-4d1f-ad47-7fed88d964f1" />
