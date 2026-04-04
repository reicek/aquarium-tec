# Manufacturing Checklist

## PCBWay Priority

- if PCBWay asks for assembly drawings, special instructions, or images to remove ambiguity, treat them as required deliverables
- keep units in mm across the package unless the fab explicitly requests otherwise
- if reference SVGs are attached, mark them as reference-only and not-to-scale supplements
- state that manufacturability-driven geometry changes require approval
- keep file names, part names, and package status consistent across CAD, manifest, message text, and drawings

## Plastic Fit Prototype

- include source geometry or exported STL files
- include a fit-only summary
- list every part in the order
- call out hose-plug outer diameters as critical
- state that finish is secondary to dimensional fidelity
- request PLA first when the goal is the lowest-cost fit check
- if reference SVGs are attached, make sure they match the current SCAD geometry and are clearly labeled as reference-only, NTS sheets

## Final Wet Part

- include 3D CAD and 2D drawing
- include clear release metadata: units, material, scale or NTS status, and drawing status or revision
- call out 14.5 mm minimum bore target
- preserve the 6-channel geometry and smooth transitions
- highlight critical-to-function dimensions for bore, transitions, landing face, groove, and hose interface
- specify finish, deburring, sealing, and any leak-test requirement explicitly
- avoid conflicting or duplicate dimensions in the release drawing
- specify wet-surface deburring and landing-face flatness
- state leak-test expectation before shipment

## Controller PCB

- include BOM, Gerbers, centroid file, assembly drawing, and assembly notes
- include special instructions and marked images if orientation or customer-supplied content could be ambiguous
- clarify whether XIAO and Round Display are customer-supplied or fab-sourced
- keep the rev-1 board scoped to logic and interface functions
