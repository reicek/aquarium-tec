# Release Readiness Checklist

Use this checklist to judge whether the project is ready to send for prototype quote, manufacturing quote, or final release.

## 1. Review Scope

- Define the package under review: PLA fit prototype, hybrid CNC wet part, controller PCB/PCBA, or full repo coherence pass.
- State whether the target is quote-ready, prototype-ready, or final-release ready.

## 2. Source-Of-Truth Alignment

- Confirm the source-of-truth model or schematic package is identified clearly.
- Confirm wrapper export files exist for the parts being quoted.
- Confirm the generated outputs in the package match the parts named in the manifest and RFQ text.
- Confirm part names, quantities, materials, and dimensional claims agree across manifests, package notes, and quote messages.
- Confirm the package does not imply a newer release status than the actual validation state supports.

## 3. Industrial Design Coherence

- The part family reads as one intentional system rather than a pile of disconnected exports.
- Assembly order is understandable from the package without hidden tribal knowledge.
- Hose routing, clamp reach, screw access, display placement, PSU access, and service clearances are either validated or clearly marked as open.
- Multi-part prototype hardware includes enough identification, orientation cues, or notes to avoid assembly confusion.
- Human-facing visuals explain ownership, split lines, and reference-only status without relying on color alone.

## 4. Manufacturing Communication Quality

- Units are in mm.
- Materials are explicit.
- Finish and post-process expectations are stated where they matter.
- Critical-to-function geometry is called out clearly.
- Approval is required before any manufacturability-driven geometry change.
- Reference SVGs are labeled as reference-only and not-to-scale when used.
- If a vendor could misread orientation or assembly order, the package includes a marked image, assembly drawing, or direct note.

## 5. Stage-Gate Integrity

- PLA prototype package is judged only for fit, envelope, and assembly validation, not wet-service or thermal proof.
- Hybrid wet-part package is not treated as final-release ready before the real-hose plug test freezes the OD.
- Final wet-part release is blocked until a formal 2D manufacturing drawing or PDF exists.
- Open decisions and measurements that affect manufacturability remain visible in the verdict.

## 6. Verdict Rules

- `Ready to send`: package matches its claimed scope and no blockers remain inside that scope.
- `Quote-ready, not final-release ready`: package is acceptable for a quote or prototype order, but stage-gate or release-document blockers still exist.
- `Not ready`: file drift, missing deliverables, or unresolved blockers make supplier handoff premature.