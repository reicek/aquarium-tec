---
name: prototype-validation
description: 'Validate the aquarium TEC prototype through staged checks. Use for plastic fit validation, electrical bring-up gates, thermal test sequencing, and recording pass/fail results.'
user-invocable: true
---

# Prototype Validation

## When To Use

- reviewing whether the PLA-first plastic order is sufficient
- planning bench bring-up of the controller and driver
- tracking pass and fail criteria before changing geometry or electronics

## Procedure

1. Read `agent/validation_and_open_items.md`.
2. Use [validation-gates.md](./references/validation-gates.md) to stage the work.
3. Record results using [test-record-template.md](./references/test-record-template.md).
4. If the user is really asking whether the project is ready to send out, hand the review off to `manufacturing-readiness-review` instead of treating open gates as resolved.

## Rules

- do not treat plastic prototype parts as proof of sealing or thermal performance
- do not jump to full thermal testing before control and safety defaults are verified
- if reference SVGs are used for geometry review, verify them against the SCAD and keep water-fill overlays clipped to block-owned internal volumes