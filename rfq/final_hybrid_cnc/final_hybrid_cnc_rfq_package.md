# PCBWay Final Hybrid CNC RFQ Package

This folder is the quote package for the hybrid wet-part direction using a 316L lid, CNC POM base, and CNC POM hose plugs.

Status:

- preliminary hybrid CNC quote package
- all stated dimensions are in mm
- preview SVGs are reference-only and not to scale
- final release order remains gated on real-hose validation of the three hose-plug OD options

## Purpose

This package is for:

- preliminary CNC machining quote collection
- manufacturability review of the current lid and base geometry baseline before the final hose-plug OD and formal drawing are locked
- side-by-side pricing of the three alternate hose-plug OD pairs

This package is not yet the final production release because:

- the final hose-plug OD has not been frozen on the real hose
- the formal 2D manufacturing drawing is still pending

## Parts to quote

### Required fixed parts

### Part A: cold block lid

- quantity: 1
- material: 316L stainless steel
- source geometry: `tec_cold_block_mockup.scad`
- export wrapper: `rfq/final_hybrid_cnc/exports/export_lid.scad`

### Part B: cold block base

- quantity: 1
- material: CNC POM
- source geometry: `tec_cold_block_mockup.scad`
- export wrapper: `rfq/final_hybrid_cnc/exports/export_base.scad`

### Alternate hose-plug quote groups

### Part C: hose-plug pair, 16.0 mm OD

- quantity: 2
- material: CNC POM
- source geometry: `tec_cold_block_mockup.scad`
- export wrapper: `rfq/final_hybrid_cnc/exports/export_plug_main.scad`

### Part D: hose-plug pair, 15.4 mm OD

- quantity: 2
- material: CNC POM
- source geometry: `tec_cold_block_mockup.scad`
- export wrapper: `rfq/final_hybrid_cnc/exports/export_plug_mid.scad`

### Part E: hose-plug pair, 14.8 mm OD

- quantity: 2
- material: CNC POM
- source geometry: `tec_cold_block_mockup.scad`
- export wrapper: `rfq/final_hybrid_cnc/exports/export_plug_small.scad`

## Current geometry baseline

Cold block body excluding hose plugs:

- 140 x 92 x 24 mm

Split:

- lid: 8 mm
- base: 16 mm

Internal design intent:

- 6 straight channels in the lid
- each channel about 8.67 x 56 x 6 mm
- 5 internal fins at 2 mm
- cavity envelope 112 x 62 x 6 mm
- minimum bore target 14.5 mm end-to-end
- smooth 28 mm inlet and outlet transitions
- 4 x Intel LGA1700 / LGA1851 hot-side mounting holes on a 78 x 78 mm square

Hose-plug root geometry shared by all three OD options:

- hose-plug projection from block face: 24 mm
- flange: 22.0 OD x 2.0 thick
- neck: 16.8 OD x 4.0 long
- trapped head: 22 x 15 x 6 rounded profile
- throat: 17.0
- through bore: 14.5 minimum

## Requested material and process

Please quote:

- lid as CNC 316L stainless steel
- base as CNC POM machined from solid stock
- hose plugs as CNC POM machined from solid stock

## Critical RFQ notes

1. Preserve the 14.5 mm minimum bore through the hose plugs, throat, and block-owned passages.
2. Keep the 6 straight-channel geometry in the lid and preserve the 28 mm smooth transition sections.
3. Do not alter the trapped hose-plug root geometry or plug pockets without approval.
4. Do not introduce hidden flow restrictions, substitute fittings, or simplify the diffuser / converger without approval.
5. Deburr all wet surfaces.
6. Keep the TEC landing face in the lid flat and smooth.
7. Keep the O-ring groove in the base clean and burr-free.
8. Use through-bolts and compression control in the final stack; do not silently redesign the base for tapped-plastic-only clamp retention.
9. Leak test before shipment if available.
10. Any manufacturability-driven geometry change requires approval before cutting material.

## Files included or generated here

Primary quote files:

- `rfq/final_hybrid_cnc/parts_manifest.csv`
- `rfq/final_hybrid_cnc/cnc_quote_message.txt`
- `rfq/final_hybrid_cnc/step/cold_block_lid.step`
- `rfq/final_hybrid_cnc/step/cold_block_base.step`
- `rfq/final_hybrid_cnc/step/hose_plug_main_16_0mm.step`
- `rfq/final_hybrid_cnc/step/hose_plug_mid_15_4mm.step`
- `rfq/final_hybrid_cnc/step/hose_plug_small_14_8mm.step`

Supplemental support files:

- `rfq/final_hybrid_cnc/stl/*.stl`
- `rfq/final_hybrid_cnc/csg/*.csg`
- `whole_block_preview.svg`
- `cold_block_lid_preview.svg`
- `cold_block_base_preview.svg`
- `hose_fit_coupons_preview.svg`
- `cold_block_combined_preview.svg`

## Export status

- wrapper entrypoints exist in `rfq/final_hybrid_cnc/exports`
- `rfq/final_hybrid_cnc/export_hybrid_step_set.ps1` regenerates the STEP, CSG, and STL set
- `.vscode/tasks.json` includes a reusable task for the hybrid STEP export set

## Suggested upload plan

1. Upload the STEP files, `parts_manifest.csv`, and `cnc_quote_message.txt` for the first hybrid quote request.
2. Ask PCBWay to quote Part A and Part B as fixed parts and Parts C, D, and E as alternate hose-plug pair options.
3. Share the SVG reference sheets only if a PCBWay rep asks for additional visual clarification, and label them as reference-only supplements.
4. Do not place the final machining order until the real hose test selects one hose-plug OD.

## Next release after this RFQ

After the PLA hose-plug round selects the final OD:

- freeze the chosen hose-plug pair
- add the formal 2D manufacturing drawing
- release the final hybrid lid/base/plug machining package