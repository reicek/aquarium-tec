---
name: pcbway-rfq
description: 'Prepare PCBWay-ready RFQ packages for PLA-first plastic fit prototypes, CNC wet parts, and controller PCBs. Use for quote notes, part manifests, manufacturing checklists, and customer-to-fab messages.'
user-invocable: true
---

# PCBWay RFQ

## When To Use

- building a quote package for the PLA-first plastic fit prototype
- preparing the later stainless or titanium machining release
- assembling a rev-1 controller board quote package

## Procedure

1. Read `agent/pcbway_handoff.md`.
2. Read the shared standard in [professional-drawing-and-cad-standards.md](../../references/professional-drawing-and-cad-standards.md).
3. Decide which track is being quoted: plastic fit prototype, CNC wet part, or PCB/PCBA.
4. If the scope includes multi-part print STLs, run `prototype-print-layout` before treating the bundle as quote-ready.
5. Build a complete folder with a summary, manifest, message text, and any exported CAD or board files.
6. Use the checklists in [manufacturing-checklist.md](./references/manufacturing-checklist.md).
7. Use or adapt the templates in [rfq-message-templates.md](./references/rfq-message-templates.md).
8. If the ask includes final-check, ready-to-send, file-alignment, or best-practice review language, run `manufacturing-readiness-review` before treating the package as ready.

## Rules

- PCBWay ambiguity-reduction guidance outranks convenience; if they ask for assembly drawings, special instructions, or marked images, treat them as required deliverables
- call out critical no-change geometry explicitly
- separate fit-prototype requirements from final wet-service requirements
- avoid silent assumptions about sourcing or assembly responsibility
- request PLA first when minimizing prototype cost unless the task says otherwise
- for any multi-part FDM prototype export, keep the parts in one compact bundle, minimize the XY footprint, put broad flat exterior faces down, keep open cavities and grooves up, and keep hose-plug bores vertical with the hose ends up when practical
- if supplemental SVGs are included, make sure they match the current SCAD geometry, carry reference-only metadata, and never substitute for a formal release drawing
- for mechanical release packages, require clear units, material, finish, release status, and critical dimensions in the 2D drawing or PDF
- require explicit approval before any manufacturability-driven geometry change