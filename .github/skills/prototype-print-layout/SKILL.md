---
name: prototype-print-layout
description: 'Design and review multi-part 3D-print export layouts for the aquarium TEC prototype. Use for STL bundle packing, print orientation, support avoidance, bed-footprint reduction, and keeping bundled prototype parts tightly packed in one print-ready layout.'
user-invocable: true
---

# Prototype Print Layout

## When To Use

- creating or revising any SCAD export mode that contains more than one printed part
- tightening PLA-first STL bundles for PCBWay or local FDM printing
- checking whether a print bundle is support-light, compact, and easy to identify after printing
- deciding how to orient lids, bases, hose plugs, and support pieces so print cost stays low without hiding geometry problems

## Procedure

1. Read `agent/mechanical_design.md` and `agent/pcbway_handoff.md`.
2. Read `tec_cold_block_mockup.scad` and the relevant wrapper exports under `rfq/`.
3. Identify every part in the bundle and choose its print orientation before moving anything for packing.
4. Pack the parts into the smallest coherent XY footprint that still leaves enough clearance for reliable printing and cleanup.
5. Regenerate the STL and verify that every part sits on the same build plane with no accidental upside-down placement.
6. If the RFQ notes or package docs mention the bundle, update them so the written instructions match the exported layout.

## Rules

- do not leave multi-part print exports scattered around the bed when a tighter layout is possible
- do not choose a visually neat orientation if it creates avoidable supports, trapped internal support, or a larger footprint than necessary
- do not place open channels, grooves, plug pockets, or other cavity faces down unless there is no better stable orientation
- do not lay hose plugs horizontally when a vertical bore-up orientation is practical
- do not use arbitrary large gaps between parts; keep spacing small and justified
- if two parts cannot both be packed tightly and printed cleanly in one bundle, split the export intentionally instead of shipping a support-heavy compromise

## Best Practices

### Orientation First

- Put the broadest flat, low-risk exterior face on the bed whenever that avoids supports.
- For split cold-block halves, prefer the smooth external face down and keep the split-face features up.
- Keep open cavities, channels, seal grooves, and plug-capture geometry facing up whenever possible so the slicer does not fill them with support.
- Keep long internal bores vertical when practical. For the aquarium hose plugs, the default should be hose axis vertical with the hose end up and the trapped-head side on the bed.
- If a part has one face that is flat but functionally delicate, decide whether a support-free orientation still wins for the prototype phase. For this project's PLA-first fit parts, support avoidance and footprint reduction usually outrank cosmetic surface quality.

### Packing Strategy

- Treat the bundle like one manufactured print job, not a loose collection of unrelated parts.
- Start with the largest two-dimensional footprints first, then fit the smaller parts into the remaining envelope.
- Prefer layouts that minimize the final bounding rectangle rather than layouts that merely look symmetric.
- Keep all parts on the same bed plane at `z = 0`; never leave floating geometry in an export bundle.
- Keep the origin simple and positive so regenerated STLs are predictable and easy to compare.
- Use one consistent gap for the bundle unless a specific part needs more. For this project's PLA bundles, `4 mm` is the default starting point and should only increase when geometry truly needs it.

### Project-Specific Defaults

- Cold-block base: print with the broad flat outer base face down. Do not flip the O-ring groove or split face onto the bed.
- Cold-block lid: print with the broad flat top face down. Do not place the channel face or split face on the bed.
- Hose plugs: stand them upright so the 14.5 mm bore stays vertical and the hose side points up.
- Repeated hose plugs: keep like parts in a simple row-and-column arrangement with identical orientation.
- Mixed bundles: keep the large body parts tightly packed first, then place the hose plugs in the smallest leftover band that does not increase the bounding box more than necessary.

### Release Checks

- Confirm every part is resting on the intended bed face after any mirror or rotation step.
- Confirm no part requires hidden internal support in a bore or cavity that should have printed open.
- Confirm the packed export really reduced the footprint; do not assume the new layout is better just because the parts are closer together.
- When a print-layout convention changes materially, update the RFQ docs and the relevant agent guidance in the same pass.