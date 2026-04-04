# Project Guidelines

## Architecture

- Keep the exchanger architecture as a custom inline cold block with 6 straight channels unless test data justifies a change.
- Preserve a minimum 14.5 mm internal bore and smooth port-to-plenum transitions. Do not introduce hidden flow restrictions.
- Default final wet-path split is a 316L stainless steel lid with CNC POM base and separate CNC POM hose-plug pieces unless the task explicitly changes that decision.
- Do not use aluminum or brass in the wet path, and do not treat coated 3D-printed wet parts as final-release hardware.
- Treat the PLA-first plastic version as a fit and geometry prototype only; ABS is only a fallback if PLA quoting is awkward.
- Keep the 60 x 60 x 5 mm copper spreader between the TEC and the CPU cooler.
- Keep the first XIAO interface board separate from the 24 V / 6 A TEC power stage unless the task explicitly changes that decision.
- Treat the Round Display for XIAO as the default local HMI.
- Treat the XIAO nRF52840 Plus as the default controller variant, not the standard nRF52840, unless the task explicitly revisits that decision.

## Working Style

- Read the project memory in the `agent/` folder before changing architecture, BOM, or RFQ assumptions.
- Preserve the current cold-block geometry in `tec_cold_block_mockup.scad` unless the task explicitly calls for a geometry revision.
- Keep PCBWay deliverables explicit and manufacturing-oriented; prefer quote-ready notes over vague reminders.
- For any multi-part prototype print export, pack the parts into one compact bundle with the smallest reliable XY footprint. Choose print orientation before spacing: broad flat non-feature exterior faces down, open cavities and grooves up, and hose-plug bores vertical with the hose end up when practical.
- For interlocking prototype joints, default to hidden matching witness letters on the buried mating faces and light PLA-safe self-locating detents instead of exposed assembly marks or glue-only plain tabs, unless the task explicitly chooses another joint strategy.
- For diagrams and CAD release documents, follow the shared professional drawing/CAD standard, prioritize PCBWay ambiguity-reduction guidance, and clearly label reference SVGs as non-manufacturing sheets.

## Manufacturing

- For PLA-first plastic prototype work, prioritize hose fit, assembly access, dimensional fidelity, and low quote cost over cosmetic finish.
- Do not release a final hybrid wet-part machining package until the hose-plug size options have been validated against the real hose.
