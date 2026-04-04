# TEC Cold Block Prototype Notes

This folder contains the first-pass OpenSCAD source for the low-restriction 6-channel inline cold block, the interchangeable hose-plug size options, and the open prototype support frame.

## Files

- `tec_cold_block_mockup.scad`: Parametric model for the two-piece block, three hose-plug size options, the interlocking support kit, and preview views.
- `whole_block_preview.svg`: Assembled block reference sheet.
- `cold_block_lid_preview.svg`: Lid-half reference sheet for the thermal face, underside channels, and lid depth control.
- `cold_block_base_preview.svg`: Base-half reference sheet for the split-plane face, seal groove, and lower water-path role.
- `hose_fit_coupons_preview.svg`: Hose-plug sizing option reference sheet.
- `cold_block_combined_preview.svg`: One-sheet combined overview of the block, lid, base, and hose-plug option set.

All preview SVGs are reference diagrams in mm. Treat them as not-to-scale communication sheets, not as the sole manufacturing drawing for release.

## Current geometry

- Body excluding hose plugs: 140 x 92 x 24 mm
- Lid thickness: 8 mm
- Base thickness: 16 mm
- Hose bore target: 14.5 mm minimum through path
- Main installed hose-plug OD: 16.0 mm
- Extra hose-plug options: 15.4 mm and 14.8 mm
- Hose-plug projection from block face: 24 mm
- Hot-side cooler mount: 4 x Intel LGA1700 / LGA1851 clearance holes on a 78 x 78 mm square
- Cavity envelope: 112 x 62 x 6 mm
- Channel set: 6 channels, each about 8.67 x 56 x 6 mm
- Fin thickness: 2 mm
- Side wall thickness inside cavity: 0 mm dedicated side walls, so the outer channels run to the cavity edge
- Inlet and outlet transition length: 28 mm each
- Prototype support frame: interlocking flat-part support kit, about 248 x 190 mm assembled footprint
- Support frame structure: 8 mm cradle panel plus rear deck, separate side display mast, split rear PSU uprights with fixed Mean Well LRS-350-24 side-mount holes on the 150 mm long-axis pitch, a narrow center driver spine, a rear-facing Double BTS7960 mount with the heatsink outboard plus a large pass-through window and widened lower cable notch behind the board, and low hose strain-relief tabs aligned with the block base and spigot bead position
- Support kit identification: major support parts now carry simple engraved A-G / K / T IDs, with matching mating marks on the main interlock panels for faster sorting and reassembly
- O-ring groove centerline rectangle: 116 x 68 mm
- O-ring groove width/depth: 2.4 x 1.5 mm

## Intent of this revision

- Keep the minimum internal flow area at or above the Fluval hose area.
- Use 6 wider channels that fill the full cavity width without extra side-wall ribs.
- Keep the ports smooth and full-bore, with the transition split across lid and base.
- Use the low-cost PLA round only to verify fit, clearance, hose engagement, and overall geometry.
- Keep the thermal stack structurally supported by the block cradle, not by the LGA1700 / LGA1851 clamp holes.
- Keep the controller and display on the open side mast so the XIAO antenna is not buried behind the PSU or cooler fins.
- Keep the final wet-part material decision separate from the plastic fit round.

## OpenSCAD usage

Change the `part` variable at the top of the file:

- `preview`: Assembled block, hose-plug options, and TEC/copper references
- `prototype_preview`: Block mounted on the interlocking support kit with cooler, PSU, driver, and side-HMI references
- `lid`: Lid half only
- `base`: Base half only
- `plug_main`: 16.0 mm OD hose plug
- `plug_mid`: 15.4 mm OD hose plug
- `plug_small`: 14.8 mm OD hose plug
- `coupon_main`, `coupon_mid`, `coupon_small`: legacy aliases for the same three hose-plug exports
- `print_layout`: Bed layout with base, lid, and the three hose-plug options
- `prototype_lid_base_bundle`: Upload bundle with 1 base and 1 lid in one STL
- `prototype_hose_bundle`: Upload bundle with 2 copies each of the 16.0 mm, 15.4 mm, and 14.8 mm hose plugs in one STL
- `prototype_support`: Flat interlocking support-part layout for printing

Support service reprints:

- `rfq/pla_prototype/exports/export_support_*.scad`: wrapper exports for individual cradle, deck, mast, upright, spine, shelf, keeper, and hose-tab parts
- VS Code task `Export OpenSCAD Prototype Support Service STL Set`: writes single-part replacement STLs to `rfq/pla_prototype/stl/support_service`

## What to validate on the plastic prototype print

- Hose grip on all three hose-plug diameters
- How far the Fluval hose can be pushed over the bead without damage
- Clearance around the canister, tubing bends, and insulation volume
- Screw access and whether the body size is still comfortable in the install space
- Whether the chosen LGA1700 / LGA1851 cooler bracket sits cleanly on the new hot-side mount holes
- Whether the 6-screw layout still clamps the lid evenly enough around the long sides
- Whether the 16.0 mm OD best-guess hose plug should stay, reduce to 15.4 mm, or reduce to 14.8 mm
- Whether the trapped plug pockets seat the plug roots cleanly when the lid and base are clamped
- Whether the support frame clears the real cooler fan clips, the vertical PSU terminal side, and the rear wiring exits
- Whether the low hose strain-relief tabs and shifted spigot bead position land in the right place for the real hose clamp and bend radius

## What not to validate on the plastic prototype print

- Final leak performance
- Final thermal performance
- Final surface finish of the diffusers or channel entries
- Long-term clamp load or thread durability

## Final hybrid revision notes

- Materials: 316L stainless steel lid, CNC POM base, and separate CNC POM hose plugs for the wet assembly
- Keep the 14.5 mm minimum bore all the way through the final part
- Hand polish the inlet and outlet diffusers after machining
- Deburr every channel entry and every bore intersection
- Do not introduce barbed features that neck the bore down below the hose ID
- Final hose-plug OD should follow the prototype hose-plug fit result
- Do not rely on a food-safe coating over a printed part as the final water barrier

## Suggested next iteration after fit test

- Lock the hose-plug OD from the prototype plug round
- Decide whether to keep the 24 mm spigot length or extend it by 3 to 5 mm
- Add any external flats, reliefs, or mounting features needed for the actual install
- Lock the real display hole pattern and confirm the fixed Mean Well side-mount pair with real hardware if the interlocking support kit is kept for the powered prototype
- Freeze the hybrid lid/base/plug set and then produce a machining drawing from the same geometry

## Related files

- `whole_block_preview.svg`: Assembled block reference sheet.
- `cold_block_lid_preview.svg`: Lid-half reference sheet.
- `cold_block_base_preview.svg`: Base-half reference sheet.
- `hose_fit_coupons_preview.svg`: Hose-plug sizing option reference sheet.
- `cold_block_combined_preview.svg`: Combined overview sheet.

All preview SVGs remain reference-only support sheets. The final hybrid release still needs formal CAD plus a manufacturing drawing generated from the frozen geometry.