# PCBWay PLA Fit Prototype RFQ Package

This package is for the first low-cost PLA fit and geometry prototype of the inline cold block and its open prototype support frame.

Status:

- current prototype print-quote package
- all stated dimensions are in mm
- any preview SVG sent with this package is reference-only and not to scale

## Directory note

- the folder name remains `rfq/abs_prototype` for continuity
- this quote round should be sent as PLA, not ABS

## Purpose

This order is only for:

- geometry validation
- hose-fit validation
- installation envelope validation
- screw and clamp access validation
- support-frame packaging validation for the cooler, PSU, and side HMI

This order is not intended to validate:

- final leak performance
- final thermal performance
- final material choice
- final long-term sealing reliability

## Parts to include in the first order

### Required core parts

### Part A: cold block lid

- quantity: 1
- source geometry: `tec_cold_block_mockup.scad`
- export mode: `part = "lid"`

### Part B: cold block base

- quantity: 1
- source geometry: `tec_cold_block_mockup.scad`
- export mode: `part = "base"`

### Part C: hose-fit coupon, main guess

- quantity: 1
- source geometry: `tec_cold_block_mockup.scad`
- export mode: `part = "coupon_main"`
- target OD: 16.0 mm

### Part D: hose-fit coupon, fallback 1

- quantity: 1
- source geometry: `tec_cold_block_mockup.scad`
- export mode: `part = "coupon_mid"`
- target OD: 15.4 mm

### Part E: hose-fit coupon, fallback 2

- quantity: 1
- source geometry: `tec_cold_block_mockup.scad`
- export mode: `part = "coupon_small"`
- target OD: 14.8 mm

### Part F: open prototype support frame

- quantity: 1
- source geometry: `tec_cold_block_mockup.scad`
- export mode: `part = "prototype_support"`
- intent: hold the block in a cradle, present the Round Display on the side, and provide a compact vertical PSU panel with fixed Mean Well side-mount holes plus a shallow upper shelf for the external driver
- release intent: include this in the first prototype order because fit and size validation now covers the full prototype assembly envelope

## Current geometry baseline

Cold block body excluding spigots:

- 140 x 92 x 24 mm

Split:

- lid: 8 mm
- base: 16 mm

Internal design intent:

- 6 straight channels
- each channel about 8.67 x 56 x 6 mm
- 5 internal fins at 2 mm, with no dedicated side walls
- cavity envelope 112 x 62 x 6 mm
- minimum bore target 14.5 mm
- smooth 28 mm inlet and outlet transitions
- 4 x Intel LGA1700 / LGA1851 hot-side mounting holes, 78 x 78 mm square, 4.3 mm clearance

Spigots:

- full block preview OD: 16.0 mm
- extra coupons: 15.4 mm and 14.8 mm
- block spigot length: 24 mm
- coupon spigot length: 30 mm

Prototype support frame:

- overall support footprint: about 248 x 190 mm
- open ladder-style cradle under the 140 x 92 block body
- cradle height: 8 mm
- side display mast: 62 mm wide, 126 mm tall, with a 34 mm screen window and universal mounting slots
- rear PSU support: compact vertical panel sized around the Mean Well LRS-350-24 standing envelope with the fixed two-hole Mean Well side-mount pattern from the official 3D outline
- upper driver shelf above the PSU position for the external TEC driver module
- low hose strain-relief tabs tucked close to both spigots and aligned with the shifted bead position

## Requested material and process

Preferred:

- PLA using the lowest-cost 3D printing process that keeps dimensions accurate enough for fit checks

Fallback:

- another rigid prototype plastic is acceptable for fit-only work if PLA quoting is awkward, but quote PLA first

Priority:

- dimensional fidelity over cosmetic appearance
- lowest practical price over cosmetic appearance or wet-service finish

## Critical RFQ notes

1. Do not resize or smooth the hose spigot geometry without approval.
2. Keep the coupon diameters accurate.
3. Preserve the overall body dimensions, current 6-screw assembly layout, and the smooth split-spigot outside profile.
4. Preserve the Intel LGA1700 / LGA1851 hot-side mounting-hole pattern.
5. This is a fit prototype only; cosmetic finish is secondary.
6. The parts do not need wet-service finish quality.
7. Preserve the open support-frame geometry and the fixed Mean Well side-mount hole pair plus upper driver shelf if Part F is quoted; do not add solid infill walls that trap water under the block or crowd the hose exits.
8. If the support frame materially increases price, quote it separately rather than silently deleting or simplifying it.

## Files available now

- `C:\Users\reice\tec_cold_block\tec_cold_block_mockup.scad`
- `C:\Users\reice\tec_cold_block\whole_block_preview.svg`
- `C:\Users\reice\tec_cold_block\cold_block_lid_preview.svg`
- `C:\Users\reice\tec_cold_block\cold_block_base_preview.svg`
- `C:\Users\reice\tec_cold_block\hose_fit_coupons_preview.svg`
- `C:\Users\reice\tec_cold_block\cold_block_combined_preview.svg`
- `C:\Users\reice\tec_cold_block\fabrication_notes.md`
- `C:\Users\reice\tec_cold_block\rfq\abs_prototype\stl\cold_block_lid.stl`
- `C:\Users\reice\tec_cold_block\rfq\abs_prototype\stl\cold_block_base.stl`
- `C:\Users\reice\tec_cold_block\rfq\abs_prototype\stl\coupon_main_16_0mm.stl`
- `C:\Users\reice\tec_cold_block\rfq\abs_prototype\stl\coupon_mid_15_4mm.stl`
- `C:\Users\reice\tec_cold_block\rfq\abs_prototype\stl\coupon_small_14_8mm.stl`
- `C:\Users\reice\tec_cold_block\rfq\abs_prototype\stl\prototype_support_frame.stl`
- `C:\Users\reice\tec_cold_block\rfq\abs_prototype\parts_manifest.csv`

## Export status

OpenSCAD export is now working from this repo.

What this means:

- the RFQ package text is ready
- the SCAD source is ready
- the STL set has been generated in `rfq/abs_prototype/stl`
- the STL set includes the required open prototype support frame
- VS Code has a reusable task named `Export OpenSCAD Prototype STL Set`
- the export task was run successfully on 2026-04-02 to regenerate the current STL set
- wrapper entrypoints exist in `rfq/abs_prototype/exports` so the exports do not rely on fragile `-D` string overrides

## Suggested upload plan

1. Upload the STL set, `parts_manifest.csv`, and `abs_quote_message.txt` from this folder.
2. Ask for the full six-part PLA set in the first quote so the entire fitting and size envelope is validated together.
3. Do not rely on the preview SVGs unless a PCBWay rep asks for them; the STL files and written notes are the primary quote package, and any shared SVG should be labeled as a reference-only, not-to-scale supplement.
4. If a fresh export is needed later, run the VS Code task `Export OpenSCAD Prototype STL Set`.

## Acceptance criteria for the received prototype parts

Must verify:

- hose-fit behavior on all three coupons
- insertion depth and clamp access
- block body fits intended space
- lid and base align correctly
- screw holes and general proportions are correct enough to freeze the stainless geometry later
- the cooler / PSU / screen support footprint is stable enough before any powered bench work
- the display mast is readable from the chosen side and clear of the cooler envelope
- the fixed Mean Well PSU side-mount holes and upper driver shelf are serviceable with real hardware

## Next release after this RFQ

After coupon testing of the PLA parts:

- freeze the final spigot OD
- freeze any envelope adjustment
- prepare the final 316L stainless machining package