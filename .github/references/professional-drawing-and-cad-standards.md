# Professional Drawing And CAD Standards

This repo uses a practical global engineering-document baseline drawn from common ISO and ASME practice.

- ISO-style drawing discipline: representation, dimension clarity, sheet layout, projection awareness, scale discipline, and title-block metadata
- ASME Y14-style product-definition discipline: engineering drawing practice, tolerancing discipline, and digital-product-definition separation between reference graphics and release drawings

## Priority Order

1. Explicit PCBWay requirements or ambiguity-reduction recommendations
2. Functional manufacturability and inspection needs
3. Repo-specific SCAD ownership, layout, and palette conventions

## Reference Diagram Baseline

- Every reference SVG must declare its title, units in mm, scale status as not to scale unless a controlled scale is intentional, source-of-truth model, and reference-only status.
- Named views and section cuts must be explicit and consistent across related sheets.
- Line hierarchy must stay consistent: outlines, hidden geometry, centerlines, dimensions, and overlays must remain visually distinct.
- Color may support meaning, but meaning must still be readable without color through geometry, labels, captions, and line style.
- Prefer short feature callouts with leader lines over free-floating prose near geometry.
- Reserve full-sentence explanation for note boxes or note bands, and visually separate those note areas from geometry with a divider or clear gutter.
- Remove duplicate or repeated labels once a formal callout is present.
- Notes belong beside the geometry, not on top of the geometry.
- Dimensions on reference SVGs should aid interpretation and must not create conflicting or duplicate manufacturing intent.
- If a sheet starts needing full release metadata, inspection dimensions, or tolerance control, move that content into a proper manufacturing drawing instead of overloading the preview SVG.

## Manufacturing Drawing And CAD Release Baseline

- Keep one geometry source of truth and export from that source consistently.
- For mechanical release, provide source CAD, a neutral interchange format such as STEP, and a 2D drawing or PDF.
- Use a clear release identity: part or assembly name, revision or status, units, scale or not-to-scale statement, and material.
- State finish, post-process, and any critical special requirements explicitly.
- Use general tolerances or explicit critical tolerances deliberately; do not scatter ambiguous precision across the drawing.
- Use datums and GD&T only where they materially improve manufacturability or inspection clarity.
- Avoid duplicate, chained, or conflicting dimensions that obscure inspection intent.
- Call out holes, grooves, sealing features, and critical interfaces explicitly.
- Highlight dimensions that are critical to fit, flow, sealing, or assembly.
- Make it explicit that manufacturability-driven changes require approval before the supplier alters geometry.
- If orientation, assembly order, or customer-supplied content could be misread, add assembly drawings, marked images, or photos.

## PCBWay Priority Rules

- Treat PCBWay requests for assembly drawings, special instructions, images, or photos as required deliverables, not optional extras.
- For fit-only prints, prioritize dimensional fidelity over cosmetic finish.
- For production mechanical work, do not rely on STL or informal reference graphics when a STEP model and formal 2D drawing are warranted.
- Keep units in mm across the package unless a supplier explicitly requires otherwise.
- Ask for confirmation that no manufacturability changes, geometry simplifications, or substituted assumptions will be made without approval.

## Repo Interpretation

- The SVG preview sheets in this repo are reference diagrams, not release drawings.
- The final stainless wet-part release still requires a formal mechanical drawing package once the geometry is frozen.
- Supplemental SVGs may accompany a quote or review package, but they must be labeled as reference-only and must not replace the release drawing.