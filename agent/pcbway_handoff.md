# PCBWay Handoff Strategy

This file is written as a practical manufacturing guide for using PCBWay as the primary fabrication partner.

## Manufacturing phases

The project should be split into three separate procurement tracks.

### Track 1: low-cost plastic geometry prototype

Purpose:

- verify size
- verify hose fit
- verify clamp access
- verify cabinet or installation envelope
- verify assembly order

This part is not meant to validate:

- final thermal performance
- long-term sealing
- final surface finish quality

What to send:

- STEP or STL exported from the SCAD model
- clear note that this is a fit prototype only
- request that the three hose-plug size options ship in the same order

Preferred request notes:

- prefer PLA for the first quote because cost matters more than final material similarity
- prioritize dimensional fidelity over cosmetic finish
- keep the three hose-plug ODs accurate
- do not resize or smooth the hose-plug outside profiles or trapped root geometry without approval

If PLA process selection becomes awkward:

- ABS is acceptable
- another rigid prototype plastic is acceptable for fit-only work, but document the substitution

## Track 2: Final hybrid wet block

Default materials:

- lid: 316L stainless steel
- base: CNC POM
- separate hose plugs: CNC POM

What to send:

- separate STEP models for the lid, base, and hose plugs
- 2D drawing or PDF with explicit dimensions and callouts
- notes for flatness, finish, seal groove, hose-plug interlock, and leak test

Critical callouts for the quote package:

- no internal bore reduction below 14.5 mm
- keep the 6 straight-channel geometry in the lid
- preserve the 28 mm smooth transition sections
- POM base and hose plugs must be CNC machined from solid stock, not printed
- wet surfaces must be deburred
- TEC landing face in the lid must be flat and smooth
- O-ring groove in the base must be clean and burr-free
- use through-bolts and compression control; do not silently convert the POM base to tapped screw retention
- part must be leak tested before shipment

Preferred added notes:

- passivate 316L after machining if available
- do not abrasive-blast inside wet passages
- hand polish or otherwise smooth the diffuser / converger surfaces if tool marks are heavy
- send photos of the landing face, groove, and hose plugs before shipping if possible

If the final hose-plug OD is not frozen yet:

- do not release the final hybrid wet-part order until the plastic hose-plug options are tested on the real Fluval hose

## Track 3: XIAO carrier PCB and PCB assembly

This should be treated as a separate RFQ from the mechanical work.

Recommended board purpose in rev 1:

- mount the XIAO nRF52840 Plus module
- preserve or replicate the XIAO pin-row geometry needed by the Round Display
- distribute regulated power for logic and sensors
- break out connectors
- condition control signals to the external TEC driver
- support sensing, alarms, and debugging

Recommended rev 1 non-goal:

- do not integrate the full 24 V 6 A TEC power stage onto the same first-pass controller board

## PCBWay PCB / PCBA file requirements to prepare

PCBWay calls out these core PCBA files:

- BOM in CSV, XLS, or XLSX
- Gerber files, including at minimum the copper, silkscreen, and solder paste layers in RS-274X format
- centroid / pick-and-place / XY rotation file

PCBWay also explicitly recommends sending additional documents even when not mandatory:

- assembly drawings
- special assembly instructions
- images or photos if something about placement or orientation could be ambiguous

That recommendation matters here because the XIAO module, antenna keepout, and external-wiring intent should all be documented clearly.

Because the project now uses the Round Display as the HMI:

- the assembly drawing should explicitly show the display mating orientation
- the pin budget and the use of Plus-only additional pads should be called out clearly
- if the Round Display is not being sourced by PCBWay, note whether it is customer-assembled later or whether the interface board is being quoted separately from the HMI module

## Suggested controller-board manufacturing spec

Recommended baseline:

- 4-layer FR-4
- 1.6 mm thickness
- ENIG finish
- ordinary logic-grade copper is sufficient if TEC current stays off-board in rev 1

PCB capability references that matter from PCBWay:

- standard boards up to 14 layers
- FR-4, aluminum, and copper-base board options exist
- typical outline tolerance around +/-0.2 mm for CNC-routed boards
- standard minimum trace and spacing around 0.1 mm / 4 mil
- castellated-hole capability exists in their advanced capability references

Design implication:

- a XIAO-carrier board using castellated module mounting is reasonable
- keep the design comfortably within standard capabilities rather than pushing minimum limits

## Questions to explicitly send PCBWay before the PCBA order

1. Can PCBWay source the exact Seeed Studio XIAO nRF52840 Plus module, or should it be consigned by the customer?
2. If consigned, do they prefer the XIAO as a customer-supplied SMT module in tape / tray or as loose modules?
3. Do they want any special stencil or placement note for the castellated module footprint?
4. Can they assemble the XIAO directly to the interface board, or do they prefer headers for prototype stage?
5. If the Round Display is included in the controller stack, do they want that module assembled separately from the main interface board or left as a customer-installed accessory?

Current engineering recommendation:

- prefer direct board mounting of the XIAO as a module
- fall back to manual module installation only if sourcing or assembly becomes awkward

## Data package quality level

Because the project is intentionally over-engineered for prototype quality, the RFQ package should include more than the bare minimum.

For mechanical RFQs include:

- 3D CAD
- 2D drawing
- finish notes
- sealing notes
- leak test note
- material note
- critical-to-function dimensions highlighted
- units in mm and clear drawing status or revision
- explicit statement that any supplemental SVG is reference-only and not a substitute for the release drawing
- explicit approval requirement before any manufacturability-driven geometry change

For PCBA RFQs include:

- BOM
- Gerbers
- centroid file
- assembly drawing
- special assembly instructions when orientation or source responsibility could be ambiguous
- marked images or photos when a module stack-up or cable orientation could be misread
- notes for antenna keepout
- notes for any customer-supplied XIAO module
- explicit statement that high current stays off-board in rev 1

## Recommended contact discipline

Do not rely on the instant quote form alone when something is critical.

When the part is close to being ordered:

- send a short message to the assigned sales rep
- restate the critical no-restriction bore requirement
- restate the wet-surface finish and leak-test requirement
- ask for confirmation that there are no manufacturability changes without approval

This is especially important for the final hybrid wet part because silent geometry changes inside the water path would defeat the design intent.
