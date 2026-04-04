# Aquarium TEC Prototype Agent

This folder is the project memory and handoff package for the custom inline TEC chiller for an 8 gallon aquarium using a Fluval 107-class hose path.

The intent is to preserve the current engineering state so future sessions can continue from a stable baseline instead of rediscovering the same constraints.

## Project goal

Build a high-quality prototype aquarium chiller around a 50 x 50 mm TEC module, with:

- an inline custom heat exchanger instead of cooling the canister body
- low hydraulic restriction so the Fluval 107 and inline CO2 diffuser do not see excessive backpressure
- a two-stage manufacturing path: low-cost PLA fit prototype first, then a hybrid CNC wet-part release with a 316L lid and CNC POM base and plugs
- wireless monitoring and control using a Seeed Studio XIAO nRF52840 Plus
- a local HMI using the Seeed Studio Round Display for XIAO
- documentation written for practical RFQs to PCBWay

## Current design baseline

The project has converged on a custom inline cold block rather than a canister-bottom contact plate.

Reason:

- the plastic canister wall is too strong a thermal bottleneck
- a direct inline exchanger removes that bottleneck
- the hose size mismatch in off-the-shelf chillers pushed the design toward a custom full-bore exchanger

The current cold block baseline is:

- 6 straight parallel channels
- full-bore 14.5 mm minimum internal water path
- smooth 28 mm inlet diffuser and 28 mm outlet converger
- body excluding hose plugs: 140 x 92 x 24 mm
- lid/base split: 8 mm / 16 mm
- cavity envelope: 112 x 62 x 6 mm
- 6 channels, each about 8.67 x 56 x 6 mm
- 5 internal fins at 2 mm and no dedicated side walls
- 6 assembly screws after the side-center pair was removed
- current SCAD uses separate 24 mm hose plugs for the prototype and final hybrid baseline
- 4 x Intel LGA1700 / LGA1851 hot-side mounting holes on a 78 x 78 mm square
- open prototype support frame: about 248 x 190 mm footprint with block cradle, side display mast, compact rear vertical PSU panel with fixed Mean Well LRS-350-24 side-mount spacing, a rear-facing Double BTS7960 mount with the heatsink outboard plus a pass-through window and widened lower cable notch behind the board, and low hose strain-relief tabs aligned to the hose-plug bead position
- provisional installed hose-plug OD: 16.0 mm
- extra hose-plug option ODs: 15.4 mm and 14.8 mm
- final wet-part material split: 316L lid, CNC POM base, separate CNC POM hose plugs
- final wet-part direction: separate trapped hose plugs are now the active SCAD and package baseline

The current mechanical source files live one level above this folder:

- `../tec_cold_block_mockup.scad`
- `../whole_block_preview.svg`
- `../cold_block_lid_preview.svg`
- `../cold_block_base_preview.svg`
- `../hose_fit_coupons_preview.svg`
- `../cold_block_combined_preview.svg`
- `../fabrication_notes.md`

## Reference SVG conventions

- use a consistent palette: charcoal outlines and text, blue water, green seals, amber thermal zones, and blue-gray hidden geometry
- in section views, show blue water only inside block-owned internal volumes; do not let water overlays float over dry plug-capture pockets unless the plug or wetted throat is intentionally shown
- the SCAD and SVGs must stay aligned on the separate trapped hose-plug baseline; if the plug geometry changes, update the lid, base, whole, and combined sheets together
- combined overview sheets should reuse the dedicated lid and base reference geometry rather than looser sketches
- if reference SVGs are included with RFQ material, verify them against the current SCAD before relying on them

## Frozen decisions

These decisions are intentionally treated as fixed unless new test data invalidates them.

1. Use the custom inline exchanger approach, not canister-bottom cooling.
2. Use straight parallel channels, not an S-path or serpentine path.
3. Use 6 channels, not 7 or 9, because low head loss matters more than extra wetted perimeter in this application.
4. Keep minimum internal bore at or above the Fluval hose ID target of 14.5 mm.
5. Do not use aluminum in the wet water path.
6. Prototype the geometry in PLA first, then use a 316L lid with CNC POM base and separate CNC POM hose plugs as the default final wet assembly.
7. Use the Thermalright Assassin X 120 Refined SE as the current exact hot-side heatsink, pair it with a Noctua NF-F12 industrialPPC-24V-2000 IP67 PWM fan, and keep the copper spreader between TEC and cooler base.
8. Keep the high-current TEC driver separate from the XIAO logic board in the first electronics revision.
9. Use the Seeed Studio XIAO nRF52840 Plus as the main controller platform.
10. Use the Seeed Studio Round Display for XIAO as the screen and touch HMI.
11. Because the Round Display consumes most standard XIAO pins, use the Plus-only additional pads through a custom interface board instead of relying on the standard 2 x 7 header pins alone.

## Preferred system architecture

Mechanical and thermal stack:

- Thermalright Assassin X 120 Refined SE heatsink
- Noctua NF-F12 industrialPPC-24V-2000 IP67 PWM fan
- thermal paste
- 60 x 60 x 5 mm copper spreader
- thermal paste
- 50 x 50 mm TEC module
- thermal paste
- custom inline cold block
- open prototype support frame carrying the block from below and holding the side electronics package
- closed-cell insulation on cold block and adjacent tubing

Electrical architecture:

- 24 V main PSU
- dedicated TEC driver or H-bridge
- separate regulated logic supply for the XIAO
- no separate 12 V rail in the current exact prototype build because the cooler uses a 24 V fan
- sensor suite for water, hot-side, cold-side, intake-air / ambient, outlet-air, ambient humidity, and leak detection

Control architecture:

- XIAO nRF52840 Plus mounted on a custom controller or interposer PCB
- Round Display for XIAO used as the local screen and touch interface
- external driver for the TEC in prototype phase
- BLE telemetry and configuration
- sensor acquisition, alarms, fail-safes, and closed-loop cooling control

## Current electrical recommendations

Power supply:

- Locked: Mean Well LRS-350-24
- Output: 24 V, 14.6 A, 350.4 W
- Reason: enough headroom for the TEC, control electronics, cooling fan conversion losses, and continuous-duty margin

Prototype TEC driver:

- Locked for the first powered prototype: IBT-2 Double BTS7960 43A H-bridge module
- Quality-preferred option for later refinement: a better-qualified 24 V motor/H-bridge module or a custom MOSFET power stage

Important electrical note:

- the XIAO Plus uses 3.3 V logic only
- many generic H-bridge modules are sold as 5 V logic accessories, so the actual logic thresholds must be verified
- if there is any doubt, add a proper level shifter or gate buffer between the XIAO and the driver inputs

## Current thermal expectation

The inline custom exchanger should perform materially better than canister-body cooling.

Working estimate for an 8 gallon aquarium with this inline block, a 50 x 50 mm TEC, a competent hot side, and proper insulation:

- typical realistic hold: about 3 to 5 C below room temperature
- optimistic case: about 5 to 6 C below room temperature

This is still a prototype estimate, not a guaranteed result. The final result depends on room temperature, lighting, pump heat, tubing losses, and actual TEC operating point.

## Manufacturing philosophy

This prototype should be treated like a high-quality industrial development part, not a hobby rough draft.

Priority order:

1. dimensional correctness
2. hydraulic behavior
3. sealing reliability
4. corrosion safety in aquarium use
5. surface finish in critical thermal and wet areas
6. cosmetic appearance

Key manufacturing stance:

- over-engineer early
- avoid hidden restrictions
- do not mix unproven high-current power electronics with first-pass logic PCB work
- use PCBWay as a manufacturing service, but give them unusually explicit instructions

## Controller and HMI summary

The chosen controller platform is the Seeed Studio XIAO nRF52840 Plus because it gives:

- BLE and NFC capability
- low-power Nordic MCU platform
- same classic XIAO size as the standard nRF52840
- 9 additional GPIO available through Plus-only SMD pads, giving about 20 GPIO total
- enough I/O margin to survive the Round Display pin usage and still control sensors and the TEC driver

The chosen local HMI is the Seeed Studio Round Display for XIAO because it gives:

- 1.28 inch round capacitive touch display
- onboard RTC
- onboard battery-management hardware if ever needed
- microSD slot if local logging is added later
- a clean operator interface without building a custom screen board from scratch

Important implications:

- 3.3 V I/O only
- keep the onboard antenna clear of metal and ground planes
- do not mount the module too close to the stainless water block or CPU cooler if wireless range matters
- the Round Display consumes most of the standard XIAO pins, so the extra Plus pins are now strategically important
- design a custom interposer or interface PCB rather than trying to wire the whole system point-to-point

## File map

- `decision_log.md`: reasoning history, rejected options, and rationale
- `system_bom.md`: full project parts list with status and notes
- `system_bom.csv`: machine-friendly BOM seed for later PCBWay prep
- `mechanical_design.md`: frozen geometry, material, seal, and machining guidance
- `electronics_control.md`: power tree, driver strategy, sensor plan, and carrier-board concept
- `xiao_nrf52840.md`: technical details and project-specific implications of the XIAO board
- `pcbway_handoff.md`: PCBWay-oriented RFQ and file-prep notes for the plastic-fit, CNC, and PCB phases
- `validation_and_open_items.md`: prototype gates, test plan, and open decisions
- `packages/controller_hmi_schematic_package.md`: schematic-ready system package for the XIAO Plus, Round Display, and interface board
- `../rfq/pla_prototype/pla_prototype_rfq_package.md`: first PCBWay RFQ package for the PLA plastic fit mockup

## Immediate next actions

1. review the SCAD and SVGs visually
2. order the PLA mockup and hose-plug option set
3. use the prototype hose-plug results to lock the final hose-plug OD
4. freeze the hybrid lid/base/plug drawing and machining request
5. bring up the XIAO Plus plus Round Display HMI stack using Arduino GFX or Seeed_GFX, not the TFT-only path
6. decide whether the first electronics spin uses an external TEC driver module or a custom power stage

## Non-obvious risks to keep in mind

- the hose OD that fits well externally can still create thin wall thickness if the internal bore is kept full-size
- BLE range can collapse if the XIAO is buried near the stainless block, PSU, or CPU cooler metal
- a standard 12 V CPU fan may require a dedicated 24 V to 12 V buck rail
- a generic driver module may work electrically but still be the weak reliability link in the system
- plastic fit prototypes should only validate fit, access, envelope, and assembly logic, not sealing or thermal performance
- on the nRF52840 family, the Round Display is better treated as an Arduino GFX or Seeed_GFX target than as a TFT-only target
- the extra pads on XIAO Plus are not useful unless the custom interface board actually breaks them out
