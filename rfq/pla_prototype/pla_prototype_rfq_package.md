# PCBWay PLA Fit Prototype RFQ Package

This package is for the first low-cost PLA fit and geometry prototype of the inline cold block, its interchangeable hose-plug options, and its open prototype support frame.

Status:

- current prototype print-quote package
- all stated dimensions are in mm
- any preview SVG sent with this package is reference-only and not to scale

## Directory note

- the prototype package now lives in `rfq/pla_prototype`
- this quote round should be sent as PLA

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

### Part A: bundled lid-and-base print set

- quantity: 1 STL file containing the cold block lid and base
- source geometry: `tec_cold_block_mockup.scad`
- export mode: `part = "prototype_lid_base_bundle"`
- included contents: 1 cold block base and 1 cold block lid
- print layout: parts packed side-by-side with the broad flat outer faces on the build plane
- release intent: keep the two block halves together in one uploadable STL for the first quote round

### Part B: bundled hose-plug print set

- quantity: 1 STL file containing all six prototype hose plugs
- source geometry: `tec_cold_block_mockup.scad`
- export mode: `part = "prototype_hose_bundle"`
- included contents: 2 hose plugs at 16.0 mm OD, 2 hose plugs at 15.4 mm OD, and 2 hose plugs at 14.8 mm OD
- release intent: keep all hose-fit options together in one uploadable STL for the first quote round

### Optional convenience export: combined hose-lid-base print set

- quantity: 1 STL file containing Part A plus Part B in one tightly packed print layout
- source geometry: `tec_cold_block_mockup.scad`
- export mode: `part = "prototype_hose_lid_base_bundle"`
- included contents: 1 cold block base with the flat outer face down, 1 cold block lid with the flat outer face down, and all six prototype hose plugs standing upright with the hose ends up
- release intent: keep a single-print or single-upload convenience bundle available without changing the default RFQ split

### Part C: open prototype support frame

- quantity: 1
- source geometry: `tec_cold_block_mockup.scad`
- export mode: `part = "prototype_support"`
- intent: hold the block in a cradle, present the Round Display on the side with the XIAO mounted below the display, and provide an interlocking support kit with split rear PSU uprights, a center driver spine, a shallow upper shelf for the external driver keyed only into the spine, and a lower tie-slot landing on that spine for the external 24 V to 5 V logic buck
- assembly aids: hidden matching interface letters and light snap detents are built into the printed joints so the support kit can be dry-fit and glued without leaving visible assembly marks on the finished prototype
- release intent: include this in the first prototype order because fit and size validation now covers the full prototype assembly envelope

## Current geometry baseline

Cold block body excluding hose plugs:

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

Hose-plug options:

- installed main hose-plug OD: 16.0 mm
- extra hose-plug options: 15.4 mm and 14.8 mm
- hose-plug projection from block face: 24 mm
- trapped plug root is shared by all three ODs so the outside hose size can change without changing the lid or base

Prototype support frame:

- overall support footprint: about 248 x 190 mm
- packed support export footprint: about 282.9 x 240 x 8 mm
- open ladder-style cradle panel under the 140 x 92 block body
- cradle height: 8 mm
- side display mast: 62 mm wide, 116 mm tall overall, with a 34 mm screen window, controller slots relocated below the display, and universal Round Display mounting slots
- rear PSU support: full-width rear deck with two fixed-hole PSU uprights instead of a full solid wall
- upper driver shelf above the PSU position for the external TEC driver module, keyed into a narrow center spine without separate rear-deck brace legs, plus a lower tie-slot landing on the same spine for a compact external 24 V to 5 V logic buck below the driver
- low hose strain-relief tabs tucked close to both hose-plug positions and aligned with the bead position

## Requested material and process

Preferred:

- PLA using the lowest-cost 3D printing process that keeps dimensions accurate enough for fit checks

Fallback:

- another rigid prototype plastic is acceptable for fit-only work if PLA quoting is awkward, but quote PLA first

Priority:

- dimensional fidelity over cosmetic appearance
- lowest practical price over cosmetic appearance or wet-service finish

## Critical RFQ notes

1. Do not resize or smooth the hose-plug geometry or plug pockets without approval.
2. Keep the three hose-plug ODs accurate across both copies of each plug size in the hose bundle.
3. Preserve the overall body dimensions, current 6-screw assembly layout, and the trapped plug-pocket geometry.
4. Preserve the Intel LGA1700 / LGA1851 hot-side mounting-hole pattern.
5. This is a fit prototype only; cosmetic finish is secondary.
6. The parts do not need wet-service finish quality.
7. Keep the lid/base bundle and the hose bundle as separate multi-part uploads unless you first ask for approval to split them differently.
8. Preserve the interlocking support-kit geometry, the fixed Mean Well side-mount hole pair, the center driver spine, and the spine-keyed driver shelf if Part C is quoted; do not merge the rear structure back into a solid wall or crowd the hose exits.
9. If the support kit materially increases price, quote it separately rather than silently deleting or simplifying it.

## Files available now

- `C:\Users\reice\tec_cold_block\tec_cold_block_mockup.scad`
- `C:\Users\reice\tec_cold_block\whole_block_preview.svg`
- `C:\Users\reice\tec_cold_block\cold_block_lid_preview.svg`
- `C:\Users\reice\tec_cold_block\cold_block_base_preview.svg`
- `C:\Users\reice\tec_cold_block\hose_fit_coupons_preview.svg`
- `C:\Users\reice\tec_cold_block\cold_block_combined_preview.svg`
- `C:\Users\reice\tec_cold_block\fabrication_notes.md`
- `C:\Users\reice\tec_cold_block\rfq\pla_prototype\stl\prototype_lid_base_bundle.stl`
- `C:\Users\reice\tec_cold_block\rfq\pla_prototype\stl\prototype_hose_bundle.stl`
- `C:\Users\reice\tec_cold_block\rfq\pla_prototype\stl\prototype_hose_lid_base_bundle.stl`
- `C:\Users\reice\tec_cold_block\rfq\pla_prototype\stl\prototype_support_frame.stl`
- `C:\Users\reice\tec_cold_block\rfq\pla_prototype\parts_manifest.csv`

## Export status

OpenSCAD export is now working from this repo.

What this means:

- the RFQ package text is ready
- the SCAD source is ready
- the primary upload STL set is generated in `rfq/pla_prototype/stl`
- the top-level STL folder now contains the three core RFQ files plus `prototype_hose_lid_base_bundle.stl` as an additional convenience bundle
- VS Code has a reusable task named `Export OpenSCAD Prototype STL Set`
- the export task was run successfully on 2026-04-04 to regenerate the current STL set
- wrapper entrypoints exist in `rfq/pla_prototype/exports` so the exports do not rely on fragile `-D` string overrides

## Suggested upload plan

1. Upload `prototype_lid_base_bundle.stl`, `prototype_hose_bundle.stl`, `prototype_support_frame.stl`, `parts_manifest.csv`, and `pla_quote_message.txt` from this folder.
2. Ask for the lid/base bundle, the hose bundle, and the support-frame file in the first quote so the entire fitting and size envelope is validated together.
3. Do not rely on the preview SVGs unless a PCBWay rep asks for them; the STL files and written notes are the primary quote package, and any shared SVG should be labeled as a reference-only, not-to-scale supplement.
4. If a fresh export is needed later, run the VS Code task `Export OpenSCAD Prototype STL Set`.

## Acceptance criteria for the received prototype parts

Must verify:

- hose-fit behavior on all three hose-plug options
- plug-root seating and lid/base pocket alignment
- insertion depth and clamp access
- block body fits intended space
- lid and base align correctly
- screw holes and general proportions are correct enough to freeze the final hybrid geometry later
- the cooler / PSU / screen support footprint is stable enough before any powered bench work
- the display mast is readable from the chosen side and clear of the cooler envelope
- the fixed Mean Well PSU side-mount holes and upper driver shelf are serviceable with real hardware

## Next release after this RFQ

After testing of the PLA hose-plug parts:

- freeze the final hose-plug OD
- freeze any envelope adjustment
- prepare the final hybrid CNC machining package
