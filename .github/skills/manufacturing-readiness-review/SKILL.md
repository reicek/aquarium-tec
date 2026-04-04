---
name: manufacturing-readiness-review
description: "Validate whether the aquarium TEC project is ready to send for prototype or manufacture. Use for industrial-design review, best-practice checks, file alignment, export/package completeness, and release blocker identification."
user-invocable: true
---

# Manufacturing Readiness Review

## When To Use

- checking whether the PLA prototype package is ready to send for quote
- checking whether the hybrid CNC package is ready for quote or final release
- reviewing whether files, manifests, exports, and RFQ notes are aligned before supplier handoff
- asking for a best-practice pass that thinks like an industrial designer, not just a geometry exporter

## Procedure

1. Read `agent/agent.md`, `agent/pcbway_handoff.md`, and `agent/validation_and_open_items.md`.
2. Read [release-readiness-checklist.md](./references/release-readiness-checklist.md).
3. Read `.github/references/professional-drawing-and-cad-standards.md` and the RFQ package files in scope.
4. Compare source geometry, wrapper exports, generated STLs/STEPs/CSGs, manifests, quote messages, fabrication notes, reference SVGs, multi-part print orientations and packing efficiency, and open stage-gate items.
5. Fix small in-repo drift directly when it is safe to do so.
6. Keep any physical-test dependency or missing-release-document issue as an explicit blocker instead of pretending it is closed.
7. Use [verdict-template.md](./references/verdict-template.md) to report the outcome.

## Rules

- think like an industrial designer: prioritize assembly clarity, service access, hose and clamp usability, intentional placement of user-facing parts, and a package that is easy for a vendor to understand without guesswork
- for interlocking prototype kits, prefer hidden mirrored witness letters and light PLA detents over exposed face labels or glue-only plain joints
- require consistent part naming, quantities, materials, dimensions, and status statements across package docs and exported files
- treat scattered multi-part prototype print exports or support-heavy orientations as package drift when a tighter support-light layout is available
- treat preview SVGs as reference-only support sheets unless a formal drawing package exists separately
- do not call a final hybrid wet-part package release-ready until the real-hose plug test freezes the OD and a formal 2D manufacturing drawing or PDF exists
- keep PCBWay ambiguity-reduction guidance above convenience; if orientation, ownership, or assembly order could be misread, add explicit notes, drawings, or marked images
- prefer the smallest coherent set of file edits needed to restore package alignment
