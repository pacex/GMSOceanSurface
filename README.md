# GMSOceanSurface

## About

This is my entry for [XOR's GM Fluid rendering contest](https://twitter.com/XorDev/status/1568277920698753026).
It is my attempt at rendering a large ocean surface in GameMaker.

![screenshot](/Screenshot.png)

Features include:
- Wave functions through discretizing [ocean wave spectra](https://dl.acm.org/doi/abs/10.1145/2791261.2791267?casa_token=OF9H-8r-9KAAAAAA:9rzbWV2qTQ4Z1UZ1Tb_oShQqisobm7bD2fxd8QSEQ5oPbWlEsn0vwWtw-leElX2tYXLR-yq4QCk-RQ)
  - Currently: Pierson-Moskowitz spectrum, but easily replaceable
- Rendering of trochoidal waves (Gerstner waves)
- Water surface shading
- Water surface reflections
  - Positionally invariant features (skybox): cube-map reflections
  - Objects in the scene: screen space reflections
    - binary and linear ray marching
- GUI to control wave and reflection parameters

## Usage
- WASD, Shift, Space to move the camera
- Right click + drag to turn the camera
- [U] to update wave functions
- [G] to toggle GUI

To change the number of wave functions sampled from the spectrum, change the `NUM_WAVES` parameter on the CPU side as well as in BOTH the vertex and fragment shader!

## Future Work
Discrete sampling of the wave spectrum is not ideal. Using an FFT to retrieve vertex displacements from the wave spectrum is far more efficient and provides better visual results. Due to time constraints I was unable to implement this until the contest deadline, but it will remain the main goal for this project.

[Boundary awareness](https://onlinelibrary.wiley.com/doi/abs/10.1111/cgf.14100?casa_token=7Xvtq25r1EgAAAAA:ppvNE30gOQ1n_iHbdYtJkyprjr0Z1_aNPfnx4pFVUgcPhsbLyrzPNKTmRY-dbJ9iBQyx4CneEA_UUGM) of waves adds substantially to visual appearance.
This is another aspect I aim to work on in the future.
