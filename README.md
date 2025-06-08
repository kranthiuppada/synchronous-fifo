# 🔁 Synchronous FIFO – Design & Verification using Verilog
Verilog-based design and verification of a parameterized synchronous FIFO with full/empty detection and overflow/underflow handling.

This repository contains the RTL design, testbench, and simulation results for a **Synchronous FIFO (First-In-First-Out)** memory buffer, implemented using **Verilog HDL** and tested in **Vivado**.

A FIFO is an essential component in digital systems where **order-preserving, temporary storage** is required — such as data pipelines, communication interfaces, and memory controllers.

---

## 🧠 Project Overview

This project includes:

- ✅ **Parametric Verilog design** of a synchronous FIFO with customizable depth and data width
- 🧪 **Testbench** with exhaustive test cases (reset, full/empty, overflow, underflow, etc.)
- 📊 **Waveform analysis** using Vivado simulator
- 📄 **Formal report** covering architecture, test methodology, and results

---

## 📁 Repository Structure
sync_fifo
├── fifo.v
├── fifo_tb.v 

├── sim/ 
 ├── waveforms.vcd # Dump file for waveform viewing
 └── test_results.txt # Summary of test case outputs
 
├── docs/
│ └── Design_Report.pdf

├── vivado_project/ 
    ├── README.md 
    └── .gitignore 

---

## 🔧 FIFO Design Summary

**File:** `fifo.v`  
**Language:** Verilog HDL  
**Top Module:** `sync_fifo`

## 🧱 Design Goals & Highlights

This FIFO design was created with modularity, scalability, and correctness in mind. Key features include:

- 📌 **Clear Module Interface:**  
  All inputs, outputs, and parameters are cleanly defined to ensure smooth integration with other components.

- ⚙️ **Parameterization:**  
  Both FIFO depth and data width are parameterized, making the design easily configurable for different applications.

- 🚦 **Status Flag Control:**  
  Implements logic for `full` and `empty` flags based on read/write pointers, preventing illegal operations.

- 🔁 **Pointer Management:**  
  Carefully manages read and write pointers using circular addressing to efficiently use memory.

- 🔄 **Synchronized Read/Write:**  
  All operations are synchronous, triggered by a common clock for reliable timing and behavior.

- 🛡️ **Robust Error Handling:**  
  Built-in handling for overflow and underflow conditions ensures safe operation during corner cases.



---

## 🔬 Testbench & Verification

**File:** `fifo_tb.v`  
**Tool:** Vivado Simulator  
**Approach:** Stimulus-based testing with waveform observation

### 🧪 Test Cases:
| Test Case                | Purpose                                 |
|--------------------------|-----------------------------------------|
| Reset Test               | Ensure FIFO resets correctly            |
| Write Test               | Check data write functionality          |
| Read Test                | Check data read functionality           |
| Full Condition           | Validate full flag and block writes     |
| Empty Condition          | Validate empty flag and block reads     |
| Simultaneous R/W         | Test FIFO with both read & write active |
| Alternating R/W          | Verify pointer wrapping behavior        |
| Overflow Test            | Ensure FIFO doesn’t corrupt on overflow |
| Underflow Test           | Ensure safe behavior on underflow       |


📜 Documentation
For detailed design specifications, block diagrams, waveforms and testbench results:

🔗 Download Project PDF
(https://github.com/kranthiuppada/synchronous-fifo/blob/main/Design%20%26%20Verification%20of%20Synchronous%20FIFO%20using%20Verilog.pdf)

---

## 🛠️ Technologies Used

- 🖥️ **Vivado Design Suite** – RTL simulation & synthesis  
- 📜 **Verilog HDL** – Hardware design  
- 📈 **VCD/GTKWAVE** – Optional for waveform analysis  
- 🧪 Manual Testbench – No UVM or formal verification

---
---

## 📜 License

This project is licensed under the [MIT License](LICENSE).  


---

## 👩‍💻 Author

**Kranthi Uppada**  
B.Tech ECE | Digital Design Enthusiast  
[GitHub Profile](https://github.com/kranthiuppada)

---



Thank you for viewing this project.  


