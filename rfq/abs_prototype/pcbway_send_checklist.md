# PCBWay Prototype Send Checklist

Status date: 2026-04-02

Decision:

- ready to send for a PLA fit-only quote
- send the full six-part prototype set in the first order
- include the support frame because full fit and size validation now covers the whole prototype envelope

## Scope and release gate

- [x] Fit-only purpose is stated clearly.
- [x] Final 316L stainless release is still blocked until coupon testing is complete.
- [x] Prototype material is now documented as PLA-first for lowest cost.
- [x] Stated dimensions for the prototype package are treated as mm.

## Package completeness

- [x] Core part list is defined: lid, base, and three hose-fit coupons.
- [x] Support frame is listed consistently as part of the required prototype set.
- [x] Parts manifest matches the STL export set and labels core versus optional.
- [x] Quote message matches the package scope and material.
- [x] Quote message and package text require approval before geometry changes.
- [x] If supplemental SVGs are shared, they are documented as reference-only and not-to-scale.
- [x] Package wording is consistent with the current task/export naming and file set.

## Files checked

- [x] `rfq/abs_prototype/stl/cold_block_lid.stl` is present.
- [x] `rfq/abs_prototype/stl/cold_block_base.stl` is present.
- [x] `rfq/abs_prototype/stl/coupon_main_16_0mm.stl` is present.
- [x] `rfq/abs_prototype/stl/coupon_mid_15_4mm.stl` is present.
- [x] `rfq/abs_prototype/stl/coupon_small_14_8mm.stl` is present.
- [x] `rfq/abs_prototype/stl/prototype_support_frame.stl` is present.
- [x] Export wrapper SCAD files are present in `rfq/abs_prototype/exports`.
- [x] The `Export OpenSCAD Prototype STL Set` task completed successfully on 2026-04-02.

## Submission discipline

- [x] Critical no-change geometry is called out in writing.
- [x] The quote package tells PCBWay not to modify spigot geometry without approval.
- [x] The quote package tells PCBWay not to make broader manufacturability-driven geometry changes without approval.
- [x] The quote package keeps dimensional fidelity ahead of cosmetic finish.
- [x] The package tells PCBWay not to use this as a wet-service or thermal-performance validation part.

## Practical send instructions

- [x] Upload the STL files.
- [x] Upload `parts_manifest.csv`.
- [x] Paste or attach `abs_quote_message.txt`.
- [x] Request PLA for the first quote and include all six printed parts in the same quote.
- [x] Skip the preview SVGs unless a PCBWay rep asks for extra reference images.
- [x] If a rep asks for preview SVGs, send them only as reference-only, not-to-scale supplements.

## Remaining caution

- [ ] Do not send the final stainless wet-part RFQ until the real hose-fit test is complete on the received plastic parts.