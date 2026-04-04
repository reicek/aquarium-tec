# Mechanical Design

This file captures the current frozen geometry and the manufacturing intent for the inline cold block.

## Current geometry

Overall body, excluding hose plugs:

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

## Hose plugs and bore

Current SCAD / prototype baseline:

- the preview model now shows separate trapped hose plugs
- hose-plug projection on the full prototype preview: 24 mm
- installed main hose-plug OD: 16.0 mm
- extra hose-plug option ODs: 15.4 mm and 14.8 mm
- minimum internal bore: 14.5 mm
- port axis offset: about 1.25 mm below the lid/base split plane to preserve lid roof thickness

Final wet-part direction:

- use separate replaceable hose-plug pieces, one per port
- trap each hose plug between lid and base so it cannot move in or out while the block is clamped
- use a rounded-square or four-flat anti-rotation interface rather than a sharp square corner
- keep the full 14.5 mm minimum bore through each hose plug and blend smoothly into the diffuser / converger
- keep the hose-clamp bead close to the block face so hose bending load does not create a long moment arm at the plug root

Design intent:

- smooth outside for hose fit
- no barbed geometry that forces a hidden bore restriction
- use external clamp retention rather than aggressive barb teeth
- allow hose-plug OD changes later without remachining the lid

## Seal concept

Current groove baseline:

- groove centerline rectangle: 116 x 68 mm
- groove width: 2.4 mm
- groove depth: 1.5 mm
- intended seal cross section: 2 mm

Seal direction:

- prototype phase can use seal cord or gasket-equivalent for fit confirmation
- final hybrid phase should use EPDM or silicone compatible with aquarium use
- if the final rectangular O-ring is not easy to source, seal cord or custom gasket is acceptable as long as compression is controlled
- do not rely on tapped plastic alone for clamp load; use through-bolts, washers, and compression control across the POM base

## Material strategy

Prototype geometry validation:

- PLA is preferred for the first low-cost fit, size, clamp access, and general assembly checks
- if PCBWay process selection makes PLA awkward, ABS or another rigid prototype plastic is acceptable for fit-only work

Final wet-part baseline:

- lid: 316L stainless steel
- base: CNC POM
- separate hose plugs: CNC POM

Materials explicitly avoided in the water path:

- aluminum
- brass
- mixed unknown plated fittings
- coated 3D-printed wet parts as final-release hardware

## Surface finish and tolerance intent for the final hybrid part

Because this is a wet precision prototype, the surface requirements should be explicit.

Critical zones:

- TEC landing face in the lid: flat and smooth, target flatness 0.05 mm or better, target finish Ra 0.8 um or better
- bore transitions and diffuser surfaces: deburred and polished, no chatter ridges left in the flow path
- O-ring groove in the POM base: clean and burr-free, with no rolled edges that could damage the seal
- hose-plug outside surfaces and bead geometry: smooth and dimensionally stable for hose fit

Preferred wet-part post-process:

- deburr all edges
- hand polish the diffuser / converger surfaces in the metal lid if machining marks remain
- passivate the final 316L lid after machining
- machine the POM base and hose plugs from solid stock; do not rely on a coating over a printed part for the final water barrier

Optional premium finish:

- electropolish plus passivation if quote and schedule permit

## Why the geometry got larger than the early concept

The part was intentionally enlarged to 140 x 92 x 24 because the compact draft could not honestly support all of these at once:

- full 14.5 mm internal bore
- 2 mm roof over the wet cavity
- smooth transitions
- adequate wall thickness
- earlier integrated spigot concept

The larger block is not wasted size. It is the cost of making the hydraulic and mechanical goals coexist.

## Prototype support frame

The powered-prototype baseline now includes an interlocking support kit so the cooler, PSU, and local HMI can be packaged around the block without committing to a full enclosure.

Current support-frame intent:

- overall footprint: about 248 x 190 mm
- packed print bundle: current `prototype_support_frame.stl` validates at about 282.9 x 240 x 8 mm
- support height under block: 8 mm cradle beams
- block position: supported from below in a ladder-style cradle, not suspended from the cooler holes
- display side: one low-profile side mast with a 34 mm screen window, the XIAO retained below the display in the lower opening band, and a split relief that trims the mast to about 116 mm overall while preserving the exact 43 x 43 mm Round Display mount pattern
- PSU side: split rear structure rather than a full wall, using two fixed-hole Mean Well LRS-350-24 side-mount uprights aligned to the 150 mm long-axis hole pitch, a narrow center driver spine, and a rear-facing Double BTS7960 mount with the heatsink outboard, a lower ledge on the rear face, and a large pass-through window that leaves only screw-hole land plus a widened lower cable notch for the capacitor and cable exit
- support construction: interlocking flat-print kit rather than a single monolithic print, so the cradle, rear deck, mast, uprights, spine, shelf, and small locator parts can be replaced individually
- support joints: use hidden matching witness letters on the actual mating faces and light self-locating detents in the printed joints so alignment is obvious during assembly but the marks disappear once fully seated
- driver shelf joint: rely on the shelf-to-spine interlock only for rev 1; do not add separate shelf legs unless testing shows the shelf needs them
- serviceability: keep individual support sub-part wrappers available for one-piece reprints, and keep simple engraved part IDs on the printed pieces so the kit is easy to sort and reassemble
- hose handling: low strain-relief tabs tucked close to the block base and aligned to the shifted hose-plug bead position so hose spring force and clamp load stay near the block, not at the tube tip

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

## What must stay frozen until hose-plug testing

These are currently fixed:

- 6-channel core
- 14.5 mm minimum internal bore
- 28 mm transitions
- no threaded fittings in the first version
- straight parallel channel architecture

These are intentionally still variable:

- final hose-plug OD
- exact clamp type
- exact trapped hose-plug interlock geometry and whether the plug root needs a dedicated secondary seal
- exact Double BTS7960 hole-center map and final retention method if the flat-mounted board is later converted from a plain ledge support to a board-specific screw or strap pattern
- exact display mounting-hole pattern once the powered prototype hardware is in hand

## Manufacturing notes for PCBWay

For the final hybrid lid/base/plug set, ask for:

- CNC machining only
- no hidden bore reduction
- no media blasting inside the wet passages
- leak test before shipment
- sharp internal corners replaced with realistic CNC radii where necessary
- photographs of the finished lid landing face, base groove, and hose plugs before shipping if possible

## Related files

- parent SCAD model: `../tec_cold_block_mockup.scad`
- parent full-block preview: `../whole_block_preview.svg`
- parent lid preview: `../cold_block_lid_preview.svg`
- parent base preview: `../cold_block_base_preview.svg`
- parent hose-plug option preview: `../hose_fit_coupons_preview.svg`
- parent combined preview: `../cold_block_combined_preview.svg`
