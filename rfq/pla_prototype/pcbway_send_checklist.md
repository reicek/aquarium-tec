# PCBWay Prototype Send Checklist

Status date: 2026-04-03

Decision:

- ready to send for a PLA fit-only quote
- send the lid/base bundle STL, the hose bundle STL, and the support-frame STL in the first order
- include the support frame because full fit and size validation now covers the whole prototype envelope

## Scope and release gate

- [x] Fit-only purpose is stated clearly.
- [x] Final hybrid CNC release is still blocked until hose-plug testing is complete.
- [x] Prototype material is now documented as PLA-first for lowest cost.
- [x] Stated dimensions for the prototype package are treated as mm.

## Package completeness

- [x] Lid/base bundle is defined as a separate prototype STL.
- [x] Hose bundle is defined as a separate prototype STL with two copies of each hose-plug size.
- [x] Support frame is listed consistently as part of the required prototype set.
- [x] Parts manifest matches the three-file STL export set.
- [x] Quote message matches the package scope and material.
- [x] Quote message and package text require approval before geometry changes.
- [x] If supplemental SVGs are shared, they are documented as reference-only and not-to-scale.
- [x] Package wording is consistent with the current task/export naming and file set.

## Files checked

- [x] `rfq/pla_prototype/stl/prototype_lid_base_bundle.stl` is present.
- [x] `rfq/pla_prototype/stl/prototype_hose_bundle.stl` is present.
- [x] `rfq/pla_prototype/stl/prototype_support_frame.stl` is present.
- [x] Export wrapper SCAD files are present in `rfq/pla_prototype/exports`.
- [x] The `Export OpenSCAD Prototype STL Set` task completed successfully on 2026-04-03.

## Submission discipline

- [x] Critical no-change geometry is called out in writing.
- [x] The quote package tells PCBWay not to modify hose-plug or plug-pocket geometry without approval.
- [x] The quote package tells PCBWay not to make broader manufacturability-driven geometry changes without approval.
- [x] The quote package keeps dimensional fidelity ahead of cosmetic finish.
- [x] The package tells PCBWay not to use this as a wet-service or thermal-performance validation part.

## Practical send instructions

- [x] Upload the three prototype STL files.
- [x] Upload `parts_manifest.csv`.
- [x] Paste or attach `pla_quote_message.txt`.
- [x] Request PLA for the first quote and include the lid/base bundle, hose bundle, and support-frame STL in the same quote.
- [x] Skip the preview SVGs unless a PCBWay rep asks for extra reference images.
- [x] If a rep asks for preview SVGs, send them only as reference-only, not-to-scale supplements.

## Remaining caution

- [ ] Do not send the final hybrid wet-part RFQ until the real hose-fit test is complete on the received plastic parts.
