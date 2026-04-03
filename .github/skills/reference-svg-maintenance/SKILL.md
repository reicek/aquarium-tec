---
name: reference-svg-maintenance
description: 'Maintain SCAD-aligned mechanical reference SVGs for this aquarium TEC project. Use for preview SVG fixes, section-view water-path corrections, split-spigot ownership, combined overview cleanup, palette consistency, and XML-safe diagram updates.'
user-invocable: true
---

# Reference SVG Maintenance

Use this skill when working on the cold-block SVG reference sheets rather than the underlying solid geometry.

## Procedure

1. Read `tec_cold_block_mockup.scad`.
2. Read `fabrication_notes.md` and `agent/mechanical_design.md`.
3. Read the shared standard in [professional-drawing-and-cad-standards.md](../../references/professional-drawing-and-cad-standards.md).
4. Read the rules in [svg-rules.md](./references/svg-rules.md).
5. Audit the current sheet for header metadata, left/right anchoring, vertical pair alignment, panel spacing, dimension gutters, title gutters, grayscale readability, callout discipline, and note-box capacity before moving labels.
6. Use [svg-review-checklist.md](./references/svg-review-checklist.md) before finalizing edits.
7. Validate edited SVG files as XML.

## Output

- corrected SVG reference sheets
- aligned notes when the diagram had implied the wrong geometry ownership
- reflowed layouts that stay readable at normal zoom and use consistent row anchoring
- professional reference-sheet metadata that makes the sheet status obvious
- updated file references if new preview sheets are added

## Rules

- prefer fixing the drawing to match the SCAD rather than redefining the geometry in prose
- keep section-view blue water overlays inside block-owned internal volumes unless a deliberate split-half comparison is being shown
- keep combined overview sheets derived from the dedicated lid/base/whole-block reference sheets, not looser sketches
- preserve the repo palette and do not mix unrelated colors between sheets
- every SVG reference sheet must declare units in mm, not-to-scale status unless controlled otherwise, the SCAD source of truth, and reference-only status
- do not rely on color alone; the sheet must still read correctly through outlines, labels, and captions
- use short leadered callouts for feature-specific notes instead of leaving descriptive prose floating near geometry
- keep explanatory sentences in note boxes or divider-separated note bands rather than inside the drawing field
- remove superseded or duplicate labels when a stricter formal callout replaces them
- anchor left-side diagrams or note panels to the left edge of their row and right-side diagrams or note panels to the right edge
- vertically center align horizontal pairs of diagrams and/or note panels instead of casually top-aligning mixed-height content
- keep a real title gutter above each diagram so subtitles stay clear of dimension lines and geometry
- enlarge the canvas or redistribute panels before allowing text, notes, dimensions, or guide lines to collide
- split long notes into multiple lines and size note boxes to the final text so nothing overflows