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
4. Build a complete folder with a summary, manifest, message text, and any exported CAD or board files.
5. Use the checklists in [manufacturing-checklist.md](./references/manufacturing-checklist.md).
6. Use or adapt the templates in [rfq-message-templates.md](./references/rfq-message-templates.md).

## Rules

- PCBWay ambiguity-reduction guidance outranks convenience; if they ask for assembly drawings, special instructions, or marked images, treat them as required deliverables
- call out critical no-change geometry explicitly
- separate fit-prototype requirements from final wet-service requirements
- avoid silent assumptions about sourcing or assembly responsibility
- request PLA first when minimizing prototype cost unless the task says otherwise
- if supplemental SVGs are included, make sure they match the current SCAD geometry, carry reference-only metadata, and never substitute for a formal release drawing
- for mechanical release packages, require clear units, material, finish, release status, and critical dimensions in the 2D drawing or PDF
- require explicit approval before any manufacturability-driven geometry change