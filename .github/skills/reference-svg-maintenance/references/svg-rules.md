# SVG Rules

## Professional metadata

- Every reference SVG must show units in mm.
- Every reference SVG must show scale status as not to scale unless a controlled scale is intentionally being maintained.
- Every reference SVG must identify `tec_cold_block_mockup.scad` as the source of truth unless a different source is explicitly stated.
- Every reference SVG must say that it is a reference diagram and not the sole manufacturing drawing.

## Geometry ownership

- The final baseline uses separate trapped hose plugs as distinct parts at both ports.
- The lid owns the six straight channels, the thermal landing, and the upper transition roof.
- The base owns the rectangular seal groove and the lower transition floor.
- The hose plugs are separate parts trapped between lid and base through plug pockets.
- The six straight 56 mm channels are cut into the lid half, not the base.
- The base carries the rectangular seal groove.
- Section views must not imply a continuous cavity in the base under the straight-channel region.

## Water overlays

- Use blue water overlays only for block-owned internal water volume shown by that sheet.
- If a section shows only the base-owned geometry, the water fill must stay inside the base-owned lower volume.
- If a section shows only the lid-owned geometry, the water fill must stay inside the lid-owned upper volume.
- Do not let water overlays float over plug-capture pockets unless the plug or the wetted throat is deliberately being shown.

## Palette

- Outlines and text: charcoal `#1f2933`
- Hidden geometry: blue-gray `#7b90b8`
- Centerlines: muted gray `#98a1af`
- Water: fill `#d9ecff`, stroke `#2563eb`
- Metal faces: light grays `#f7f8fa` and `#e6e9ef`
- Seal features: green `#2f7d4a`
- Thermal / heat zones: fill `#fde1c4`, stroke `#c56a1b`
- Note boxes: near-white `#fcfdff`

## Presentation

- Keep dimension arrows and extension lines in charcoal.
- Keep labels short and tied to actual ownership, not guessed behavior.
- Keep view names and section names explicit and consistent between related sheets.
- Do not rely on color alone; outlines, labels, and line styles must still explain the view in grayscale.
- For a strict formal pass, convert feature-specific prose into short callouts with leader lines where practical.
- Keep sentences and multi-line explanation in adjacent note boxes or divider-separated note bands rather than letting them float through the drawing field.
- Remove duplicate labels after the stricter callout structure is in place.
- If a combined sheet duplicates a lid or base panel, reuse the same proportions and hole layout.
- In a left/right row, anchor the left item to the left working edge and the right item to the right working edge.
- Vertically center align horizontal pairs of diagrams or note panels; do not default to top alignment when the paired items have different heights.
- Give each diagram a dedicated title gutter so subtitles do not touch dimension lines, outlines, or section geometry.
- Keep long ownership explanations out of the section cut itself; put them in the adjacent note box.
- Inside a section view, use labels only for the geometry being pointed at or dimensioned.
- Keep reference-SVG dimensions interpretive and non-conflicting; if release-grade tolerancing is needed, move it into a formal manufacturing drawing.
- Plan gutters for dimensions, captions, and headers before adding more notes.
- Enlarge the sheet or panel footprints before accepting text collisions, note overflow, or lines crossing labels or part geometry.
- Split long prose into multiple lines and size note boxes to the final text; no note text should overflow its box.
