# 🚀 43-Tap Symmetric FIR Low Pass Filter in Verilog

A fully synthesizable **43-Tap Symmetric FIR Low Pass Filter** implemented in Verilog with MATLAB-based verification.

The design exploits **coefficient symmetry** to reduce the number of multipliers from **43 to 22** using pre-addition, making it area-efficient while maintaining identical filter performance.

---

# Features

- ✅ 43-Tap FIR Low Pass Filter
- ✅ Symmetric Coefficient Optimization
- ✅ 22 Multipliers instead of 43
- ✅ Pre-Adder Architecture
- ✅ Fixed-Point Q1.15 Arithmetic
- ✅ Coefficient ROM
- ✅ Balanced Adder Tree
- ✅ Saturation Logic
- ✅ MATLAB Testbench Verification
- ✅ Impulse Response Verification
- ✅ Sine Wave Verification
- ✅ Mixed Signal Verification
- ✅ White Noise Verification

---

# Architecture

```
                   Input Sample
                        │
                        ▼
                Delay Line (43 Samples)
                        │
                        ▼
             Symmetric Pair Generator
                        │
                        ▼
                 22 Pre-Adders
                        │
                        ▼
                 Multiplier Array
               (Coefficient ROM)
                        │
                        ▼
                 Balanced Adder Tree
                        │
                        ▼
               Output Scaling (Q1.15)
                        │
                        ▼
                 Saturation Logic
                        │
                        ▼
                    FIR Output
```

---

# Folder Structure

```
FIR_LPF
│
├── RTL
│   ├── fir_top.v
│   ├── delay_line.v
│   ├── symmetric_preadder.v
│   ├── multiplier_array.v
│   ├── coeff_rom.v
│   ├── adder_tree.v
│   └── output_scaler.v
│
├── Testbench
│   └── tb_fir_top.v
│
├── MATLAB
│   ├── Input Generation Scripts
│   ├── Verification Scripts
│   ├── input_samples.txt
│   └── output_samples.txt
│
└── README.md
```

---

# Filter Specifications

| Parameter | Value |
|-----------|-------|
| Filter Type | FIR Low Pass |
| Number of Taps | 43 |
| Symmetry | Yes |
| Multipliers Used | 22 |
| Data Format | Signed Q1.15 |
| Coefficient Format | Signed Q1.15 |
| Sampling Frequency | 48 kHz |

---

# Optimization

Instead of computing

```
h0*x0 + h42*x42
```

the architecture computes

```
(x0 + x42) × h0
```

Since

```
h0 = h42
```

the multiplier count is reduced by nearly **50%**.

---

# Verification

The design was verified using MATLAB and Xilinx Vivado.

The following tests were performed:

- ✔ Impulse Response
- ✔ 2 kHz Sine Wave
- ✔ 12 kHz Stopband Signal
- ✔ Mixed Signal (2 kHz + 12 kHz)
- ✔ White Noise

MATLAB generated fixed-point input vectors which were supplied to the Verilog testbench. The FPGA output was written back to a text file and compared sample-by-sample against the MATLAB reference.

---

# Verification Results

### Impulse Response

- Perfect coefficient reproduction
- Sample-by-sample match

---

### 2 kHz Passband Test

- MATLAB and FPGA outputs overlap almost exactly.
- Gain ≈ 0 dB

---

### 12 kHz Stopband Test

- Strong attenuation observed.
- MATLAB and FPGA responses closely matched.

---

### Mixed Signal Test

Input:

- 2 kHz desired signal
- 12 kHz high-frequency noise

Output:

- 2 kHz preserved
- 12 kHz significantly attenuated

---

### White Noise Test

Random broadband noise was filtered successfully.

Typical verification results:

```
Mean Error ≈ 1e-5
RMS Error  ≈ 1e-5
Maximum Error ≈ 3e-5
```

These small errors are due to fixed-point quantization and rounding.

---

# Tools Used

- Verilog HDL
- Xilinx Vivado
- MATLAB
- MATLAB Signal Processing Toolbox

---

# Future Improvements

- Runtime programmable coefficients
- Variable tap count
- Distributed Arithmetic implementation
- Pipelined architecture
- AXI-Stream interface
- FIR IP packaging
- Clock enable optimization
- Low-power implementation

---

# How to Run

## MATLAB

Generate input samples

```
input_samples.txt
```

## Vivado

Run simulation using

```
tb_fir_top.v
```

Simulation produces

```
output_samples.txt
```

## MATLAB

Run the verification script to compare

- MATLAB Reference
- FPGA Output

and generate

- Time-domain plots
- Frequency response
- Error statistics

---

# Author

**Yashaswini**

Electronics and Communication Engineering

Embedded Systems | Digital Design | DSP | FPGA
