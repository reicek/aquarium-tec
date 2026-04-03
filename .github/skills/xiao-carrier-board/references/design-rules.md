## Hard Rules

- Treat all XIAO user I/O as 3.3 V logic.
- Do not assume generic driver-module inputs are safely 3.3 V compatible without verification.
- Keep the XIAO antenna end clear of copper pours, shields, large metal, and the stainless block.
- Keep the high-current TEC path off the rev-1 XIAO carrier board.
- Reserve the standard XIAO header pins for the Round Display unless a deliberate redesign says otherwise.
- Use the XIAO nRF52840 Plus additional pads for non-HMI system I/O.

## Controller Functions The Rev-1 Board Should Own

- water temperature input
- hot-side temperature input
- cold-block temperature input
- humidity input
- optional leak input
- alarm output
- TEC driver enable and control signals
- optional fan control or tach input
- Round Display interface preservation
