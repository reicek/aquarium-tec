# SVG Review Checklist

## Geometry checks

- Confirm the sheet matches the current SCAD geometry.
- Confirm the channel count shown is six, not five or seven.
- Confirm lid/base ownership and separate hose-plug ownership are shown correctly.
- Confirm the base sheet does not imply straight-channel water volume in the base.
- Confirm the seal groove appears only on the base-oriented sheet.

## Overlay checks

- Confirm blue water fills stay inside the intended internal volume.
- Confirm left and right side overlays follow the same rule within a section.
- Confirm combined sheets reuse the dedicated sheet geometry rather than approximate sketches.

## Annotation checks

- Confirm the sheet header declares units in mm, not-to-scale status or a controlled scale, the source-of-truth model, and reference-only status.
- Confirm screw-hole sizes and counts match the part shown.
- Confirm labels do not contradict the geometry.
- Confirm color is not the only way to understand hidden geometry, water volume, or ownership.
- Confirm feature-specific notes use short leadered callouts where that is clearer than floating prose.
- Confirm explanatory sentences live in note boxes or divider-separated note bands rather than in the drawing field.
- Confirm stricter callouts did not leave duplicate legacy labels behind.
- Confirm view names and section names remain consistent with the rest of the SVG set.
- Confirm left items are left-anchored and right items are right-anchored within each horizontal row.
- Confirm horizontal pairs are vertically center aligned rather than loosely top-aligned.
- Confirm text remains readable and does not collide with dimensions.
- Confirm subtitles stay inside a dedicated header gutter and do not touch dimension lines or geometry.
- Confirm section cuts do not carry long ownership prose when an adjacent note box already covers it.
- Confirm note boxes are tall and wide enough for the final text with no overflow.
- Confirm captions, headers, and dimension labels keep clear gutters and remain readable at normal zoom.
- Confirm the canvas or panel size was increased before allowing guide lines or dimensions to cross text or part geometry.
- Confirm reference dimensions do not create a conflicting manufacturing interpretation.

## Validation

- Parse the edited SVG files as XML.
- If the palette changed, confirm all SVGs still share the same semantic colors.
