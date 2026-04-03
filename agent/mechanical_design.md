# Mechanical Design

This file captures the current frozen geometry and the manufacturing intent for the inline cold block.

## Current geometry

Overall body, excluding spigots:

- length: 140 mm
- width: 92 mm
- total thickness: 24 mm
- lid thickness: 8 mm
- base thickness: 16 mm

Thermal landing:

- landing area: 64 x 64 mm
- critical flat contact zone: at least 52 x 52 mm
- intended TEC size: 50 x 50 mm
- intended copper spreader size above TEC: 60 x 60 x 5 mm
- hot-side cooler mount pattern: Intel LGA1700 / LGA1851, 78 x 78 mm square, 4.3 mm clearance holes

Water cavity:

- cavity envelope: 112 x 62 x 6 mm
- roof thickness above cavity: 2 mm nominal
- internal side wall thickness: 0 mm dedicated side walls
- inlet diffuser length: 28 mm
- outlet converger length: 28 mm

Channel pack:

- 6 channels
- each channel: about 8.67 x 56 x 6 mm
- fin width between channels: 2 mm
- side walls removed so the outer channels run to the cavity edges
- total open area in channel pack: about 312 mm^2

Hydraulic comparison:

- target hose ID: 14.5 mm
- hose area at 14.5 mm ID: about 165 mm^2
- channel pack open area: about 312 mm^2

Conclusion:

- the channel pack is not supposed to be the hydraulic bottleneck
- the internal bore and transition quality matter more than adding more channels

## Spigots and bore

The spigots are intentionally split between lid and base.

Current prototype assumptions:

- spigot length: 24 mm on the full block
- full-block preview spigot OD: 16.0 mm
- extra coupon ODs: 15.4 mm and 14.8 mm
- minimum internal bore: 14.5 mm
- port axis offset: about 1.25 mm below the lid/base split plane to preserve lid roof thickness

Design intent:

- smooth outside for hose fit
- no barbed geometry that forces a hidden bore restriction
- use external clamp retention rather than aggressive barb teeth

## Seal concept

Current groove baseline:

- groove centerline rectangle: 116 x 68 mm
- groove width: 2.4 mm
- groove depth: 1.5 mm
- intended seal cross section: 2 mm

Seal direction:

- prototype phase can use seal cord or gasket-equivalent for fit confirmation
- final metal phase should use EPDM or silicone compatible with aquarium use
- if the final rectangular O-ring is not easy to source, seal cord or custom gasket is acceptable as long as compression is controlled

## Material strategy

Prototype geometry validation:

- PLA is preferred for the first low-cost fit, size, clamp access, and general assembly checks
- if PCBWay process selection makes PLA awkward, ABS or another rigid prototype plastic is acceptable for fit-only work

Final wet part default:

- 316L stainless steel

Final wet part premium option:

- Grade 2 titanium

Materials explicitly avoided in the water path:

- aluminum
- brass
- mixed unknown plated fittings

## Surface finish and tolerance intent for the final metal part

Because this is a wet precision prototype, the surface requirements should be explicit.

Critical zones:

- TEC landing face: flat and smooth, target flatness 0.05 mm or better, target finish Ra 0.8 um or better
- bore transitions and diffuser surfaces: deburred and polished, no chatter ridges left in the flow path
- O-ring groove: clean and burr-free, with no rolled edges that could damage the seal
- spigot outside surfaces: smooth and dimensionally stable for hose fit

Preferred wet-part post-process:

- deburr all edges
- hand polish the diffuser / converger surfaces if machining marks remain
- passivate the final 316L part after machining

Optional premium finish:

- electropolish plus passivation if quote and schedule permit

## Why the geometry got larger than the early concept

The part was intentionally enlarged to 140 x 92 x 24 because the compact draft could not honestly support all of these at once:

- full 14.5 mm internal bore
- 2 mm roof over the wet cavity
- smooth transitions
- adequate wall thickness
- split spigot concept

The larger block is not wasted size. It is the cost of making the hydraulic and mechanical goals coexist.

## Prototype support frame

The powered-prototype baseline now includes an open support frame so the cooler, PSU, and local HMI can be packaged around the block without committing to a full enclosure.

Current support-frame intent:

- overall footprint: about 248 x 190 mm
- support height under block: 8 mm cradle beams
- block position: supported from below in a ladder-style cradle, not suspended from the cooler holes
- display side: one low-profile side mast with a 34 mm screen window and universal mounting slots for the 43 x 43 mm class Round Display board
- PSU side: compact vertical rear panel sized around the Mean Well LRS-350-24 standing envelope, using the fixed two-hole Mean Well side-mount pattern from the official 3D outline, with a shallow shelf above it for the external BTS7960 / IBT-2 module
- hose handling: low strain-relief tabs tucked close to the block base and aligned to the shifted spigot bead position so hose spring force and clamp load stay near the block, not at the tube tip

Design stance:

- the 78 x 78 mm Intel LGA1700 / LGA1851 pattern stays the cooler clamp interface
- it should not become the main structural path for the support frame
- the block cradle should carry the static load and the hose side load instead

### Rev-1 sensor placement around the support frame

Temperature harness physical baseline:

- one shared DS18B20 splice point should sit on the inside face of the rear panel, centered laterally and below the driver shelf
- route the main temperature trunk from the controller side to that splice point along the sensor side of the frame, not through the TEC driver wiring bundle
- keep only the water probe as the long run; all other probe branches should terminate within the powered prototype envelope

Local mounting targets:

- cold-block probe: display-side outer wall of the block, centered on the straight-channel zone and below the split plane
- hot-side probe: exposed cooler-base shoulder or first accessible heat-pipe root near the copper spreader plane
- intake-air probe: in the gap ahead of the cooler fan on the display side, offset from the hub centerline
- outlet-air probe: in the narrow exhaust gap behind the cooler and ahead of the PSU side hardware, offset from the hub centerline and clear of metal contact

Lead-length targets from the splice point:

- cold-block: about 200 mm
- hot-side: about 180 mm
- intake-air: about 220 mm
- outlet-air: about 100 mm
- water probe: about 1200 mm from the splice point to the aquarium sensing location

## What must stay frozen until coupon testing

These are currently fixed:

- 6-channel core
- 14.5 mm minimum internal bore
- 28 mm transitions
- no threaded fittings in the first version
- straight parallel channel architecture

These are intentionally still variable:

- final spigot OD
- exact clamp type
- whether the final wet part is 316L or Grade 2 titanium
- exact PSU and display mounting-hole pattern once the powered prototype hardware is in hand

## Manufacturing notes for PCBWay

For the final stainless part, ask for:

- CNC machining only
- no hidden bore reduction
- no media blasting inside the wet passages
- leak test before shipment
- sharp internal corners replaced with realistic CNC radii where necessary
- photographs of the finished spigots, groove, and landing face before shipping if possible

## Related files

- parent SCAD model: `../tec_cold_block_mockup.scad`
- parent full-block preview: `../whole_block_preview.svg`
- parent lid preview: `../cold_block_lid_preview.svg`
- parent base preview: `../cold_block_base_preview.svg`
- parent coupon preview: `../hose_fit_coupons_preview.svg`
- parent combined preview: `../cold_block_combined_preview.svg`