# COMSOL Multiphysics 6.2 Model Specifications (Whole-Space)

This document specifies the numerical configuration exported from the COMSOL Multiphysics 6.2 project file located at `Invtest/test.mph` for the GeoEMFEM 3D frequency-domain CSEM adjoint verification benchmark.

---

## 1. Whole-Space Physical Medium (No Air Layer)

* **Physical Context**: **Homogeneous Whole-Space (全空间)**. 
* **Background Conductivity**: $\sigma_0 = 0.01\ \text{S/m}$ ($100\ \Omega\cdot\text{m}$) throughout the entire $10\ \text{km} \times 10\ \text{km} \times 10\ \text{km}$ volume. There is **no air layer** ($Z < 0$ and $Z > 0$ are both part of the uniform $0.01\ \text{S/m}$ host).
* **Target Conductive Body**: An embedded block prism with $\sigma_{\text{target}} = 0.1\ \text{S/m}$ ($10\ \Omega\cdot\text{m}$).
* **Relative Permittivity & Permeability**: $\varepsilon_r = 1.0$, $\mu_r = 1.0$.
* **Outer Boundaries**: PEC ($\hat{n} \times \mathbf{E} = 0$) at $X, Y, Z = \pm 5000\ \text{m}$.

---

## 2. Geometric Entities in `test.mph`

| Domain Entity | COMSOL Tag | Physical Role | Dimensions (m) | Coordinate Bounds (m) | Conductivity |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Full Domain** | `blk1` | Whole-Space Domain | $10000 \times 10000 \times 10000$ | $X, Y, Z \in [-5000, 5000]$ | $0.01\ \text{S/m}$ |
| **Buffer Zone** | `blk2` | Mesh Transition Zone | $2000 \times 2000 \times 2000$ | $X, Y, Z \in [-1000, 1000]$ | $0.01\ \text{S/m}$ |
| **Inversion ROI** | `blk3` | Active Inversion Box | $1000 \times 1000 \times 500$ | $X, Y \in [-500, 500], Z \in [0, 500]$ | $0.01\ \text{S/m}$ (base) |
| **Target Anomaly** | `blk4` | Conductive Block Prism | $100 \times 100 \times 50$ | $X, Y \in [-50, 50], Z \in [25, 75]$ | $0.1\ \text{S/m}$ |
| **Wire Source** | `ls1` | Grounded Line Transmitter | Length = $200\ \text{m}$ | From $(-350, -100, 0)$ to $(-350, 100, 0)$ | $I = +1\ \text{A}$ |
| **Rx Station Grid** | `arr1` | Observation Station Array | $9 \times 9 = 81$ stations | $X, Y \in [-80, 80]\ (\Delta = 20\ \text{m}), Z = 0.0\ \text{m}$ | Embedded at $Z=0.0\ \text{m}$ |

---

## 3. Refined Mesh & Inversion Parameters

* **Mesh sequence**: `mesh1` in `test.mph` with receiver local refinement ($h \approx 10\ \text{m}$ around observation stations), converted to TetGen format via `convert_mphtxt.jl`.
* **Total Nodes**: 37,924
* **Total Tetrahedra**: 225,241
* **Total Edges**: 263,932
* **Total Faces**: 451,250
* **Inversion Parameters ($N_{\text{inv}}$)**: Tetrahedra inside the active ROI $X, Y \in [-500, 500]\ \text{m}, Z \in [0, 500]\ \text{m}$.
