# Validation And Open Items

This file captures what still needs to be validated before the project is truly frozen.

## Stage-gate plan

### Gate 1: geometry and hose-fit validation

Required before stainless order:

- test 16.0 mm full-block spigot fit on real Fluval hose
- test 15.4 mm coupon fit
- test 14.8 mm coupon fit
- verify insertion depth and clamp access
- verify that the body size fits the intended installation envelope

Output from Gate 1:

- final spigot OD decision
- confirmation or revision of block body clearance assumptions

### Gate 2: mechanical CAD freeze

Required before CNC metal order:

- lock final spigot OD
- confirm seal strategy
- confirm screw length and assembly method
- confirm whether any external flats or mounting details are needed

Output from Gate 2:

- release candidate STEP and drawing for stainless machining

### Gate 3: bench thermal bring-up

Required before running on the aquarium:

- verify driver safe default state
- verify hot-side cooling with TEC energized
- verify sensor readings and alarm logic
- leak check water loop
- confirm condensation control plan

Output from Gate 3:

- safe initial duty/current limit for live aquarium testing

### Gate 4: controlled aquarium testing

Required to confirm practical value:

- log room temperature
- log tank temperature
- log hot-side temperature
- log humidity near block
- verify actual achievable temperature below ambient

Output from Gate 4:

- real operating envelope and control tuning

## Open decisions

These are still intentionally unresolved.

1. Final spigot OD after coupon fit testing.
2. Final wet material: 316L stainless default or Grade 2 titanium premium.
3. Exact seal implementation: cord, custom O-ring, or gasket-equivalent.
4. Exact TEC driver used for the first powered prototype.
5. Whether the first controller PCB only conditions signals or also integrates some low-current switched outputs.
6. Exact CPU cooler fan voltage and current.
7. Exact sensor part numbers and connector family.
8. Whether the Round Display is assembled as a direct HMI module at the first PCBWay stage or left as a customer-installed module after the interface board is received.

## Important measurements still needed

1. Actual hose inside diameter on the real Fluval hose when measured with calipers.
2. Actual hose compliance and insertion force on each prototype coupon.
3. Actual installed space around the canister, hose bend radii, and cable routing.
4. Actual current draw and voltage rating of the chosen CPU cooler fan.
5. Practical enclosure or mounting space for the 43 x 43 mm class Round Display board and any controller enclosure around it.

## Prototype test checklist

Dry mechanical checks:

- block fits the space
- hose can be pushed on without damage
- clamp can be installed and tightened
- screws are accessible
- insulation can wrap the block cleanly

Electrical checks:

- XIAO powers from its regulated supply correctly
- Round Display powers, initializes, and has readable touch input on the chosen nRF52840 software path
- driver powers safely with outputs disabled
- PWM control behaves predictably
- any level shifting works correctly at 3.3 V logic

Thermal checks:

- TEC polarity is correct
- hot side remains under safe temperature
- cold block develops the expected temperature drop
- no uncontrolled condensation forms outside the insulated region

Hydraulic checks:

- no noticeable pump distress
- no obvious CO2 diffuser backpressure penalty beyond acceptable range
- no trapped-air behavior in the block

## What should not be treated as a success criterion for the plastic prototype print

- final leak-tightness
- final surface finish
- final thermal behavior
- final clamp durability under heat and moisture cycling

## Preferred next engineering tasks after the plastic prototype order

1. Export STEP / STL from the SCAD model and submit the PLA order.
2. Measure and record the actual hose-fit result for all three ODs.
3. Freeze the final metal geometry.
4. Draft the XIAO carrier board concept around the chosen sensors and external driver interface.
5. Produce a stainless-specific drawing package with passivation and leak-test notes.