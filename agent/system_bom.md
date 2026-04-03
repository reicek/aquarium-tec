# System BOM

This is the working project BOM. It includes locked parts, recommended parts, and provisional placeholders that still need final selection.

Status legend:

- Locked: considered the current baseline
- Preferred: recommended but still replaceable
- Provisional: best current choice, not frozen
- TBD: exact part not yet frozen

## Thermal and mechanical

| Item | Qty | Status | Recommended part / spec | Notes |
| --- | ---: | --- | --- | --- |
| TEC module | 1 | Locked | TEC126306, 50 x 50 mm, 24 V, 6 A nominal | Electrical input ceiling about 144 W |
| Hot-side cooler | 1 | Locked | 230 W class CPU air cooler, 4 x 6 mm heat pipes, 120 mm fan | Choose an Intel LGA1700 / LGA1851 compatible model; verify actual fan voltage and current before wiring |
| Copper spreader | 1 | Locked | C110 or OFHC copper, 60 x 60 x 5 mm | Between TEC and CPU cooler |
| Thermal paste | 1 | Preferred | Non-conductive high-performance paste, 8 W/mK or better | Use between all metal/TEC interfaces |
| Cold block, fit mockup | 1 set | Locked | 3D printed PLA fit prototype; ABS or other rigid plastic acceptable if PLA quoting is awkward | Geometry validation only |
| Prototype support frame | 1 | Preferred | Open plastic support frame, about 248 x 190 mm overall | Cradles the block, carries side HMI, provides a compact vertical PSU stack with fixed Mean Well side-mount holes and an upper driver shelf, and can be quoted separately to keep the core fit round cheap |
| Cold block, final | 1 | Locked | CNC 316L stainless steel | Final wet part default material |
| Cold block, premium option | 1 | Provisional | CNC Grade 2 titanium | Use only if quote is acceptable |
| O-ring or seal cord | 1 | Provisional | EPDM 70A, 2 mm cross section | Final seal form still open |
| Block assembly screws | 6 | Preferred | M3 stainless socket head screws, likely 16 mm long | Final length to confirm against real countersink / thread depth |
| Insulation foam | 1 lot | Preferred | Closed-cell elastomer foam, 6 to 10 mm thick | Insulate block and first tubing sections |
| Tubing clamps | 4 to 6 | Preferred | Stainless worm-drive or constant-tension clamps sized after hose-fit result | Final size depends on spigot OD |

## Power and drive

| Item | Qty | Status | Recommended part / spec | Notes |
| --- | ---: | --- | --- | --- |
| Main PSU | 1 | Locked | Mean Well LRS-350-24, 24 V, 14.6 A, 350.4 W | Baseline supply |
| TEC driver, prototype | 1 | Provisional | BTS7960 / IBT-2 H-bridge module | Low-cost external driver option |
| TEC driver, quality-upgrade path | 1 | Provisional | Qualified 24 V driver or custom MOSFET power stage | Better long-term reliability path |
| Logic DC-DC | 1 | Preferred | 24 V to 5 V, 1 A minimum, industrial-grade DC-DC | Example class: Traco TSR 1-2450 or equivalent |
| Fan DC-DC | 1 | Provisional | 24 V to 12 V, 1 A minimum | Only needed if CPU cooler fan is 12 V |
| TEC branch fuse | 1 | Preferred | 10 A inline fuse | Put close to PSU output |
| Logic branch fuse | 1 | Preferred | 1 A to 2 A fuse | Protect controller and auxiliaries |
| TEC wiring | 1 lot | Preferred | 16 AWG stranded copper wire | Keep runs short |
| Logic wiring | 1 lot | Preferred | 22 to 24 AWG stranded copper wire | Sensor and control wiring |

## Controller and sensing

| Item | Qty | Status | Recommended part / spec | Notes |
| --- | ---: | --- | --- | --- |
| Main controller | 1 | Locked | Seeed Studio XIAO nRF52840 Plus, SKU 102010672 | BLE-capable MCU module with 9 extra SMD GPIO |
| Local HMI | 1 | Locked | Seeed Studio Round Display for XIAO, SKU 104030087 | 1.28 inch round touch display with RTC and TF slot |
| RTC backup cell | 1 | Provisional | CR927 coin cell | Only needed if RTC retention is desired without network sync |
| Controller interface board | 1 | Preferred | Custom interposer or interface PCB for XIAO Plus, Round Display, multi-point sensing, alarms, and driver interface | Recommended first PCBWay assembly target |
| Water temperature sensor | 1 | Locked | Waterproof DS18B20 probe | Main aquarium control input; user has stock on hand |
| Cold block temperature sensor | 1 | Locked | Bonded DS18B20 package or probe | Watch cold-side performance |
| Hot-side temperature sensor | 1 | Locked | Bonded DS18B20 package or probe | Watch heatsink safety margin near the cooler base or heat-pipe root |
| Air intake temperature sensor | 1 | Locked | DS18B20 digital temperature probe | Place upstream of the cooler fan; doubles as ambient intake reference |
| Air outlet temperature sensor | 1 | Locked | DS18B20 digital temperature probe | Place in the cooler exhaust stream for hot-side delta and airflow checks |
| Ambient humidity sensor | 1 | Preferred | SHT31 I2C breakout or equivalent | Condensation monitoring; keep out of the direct hot-air exhaust plume |
| Leak sensor | 1 | Provisional | Conductive leak strip or float-style leak sensor | Optional but recommended |
| Status indicator | 1 | Preferred | Buzzer or high-brightness LED | Local alarm |
| Driver interface buffer | 1 | Preferred | 3.3 V to 5 V unidirectional logic buffer, AHCT family or equivalent | Use if the TEC driver inputs are not guaranteed 3.3 V compatible |

## PCB and connectivity

| Item | Qty | Status | Recommended part / spec | Notes |
| --- | ---: | --- | --- | --- |
| Control PCB | 1 | Preferred | 4-layer FR-4, 1.6 mm, ENIG | XIAO Plus interface board with Round Display mating geometry |
| Sensor connectors | several | Preferred | Keyed JST-PH class or equivalent low-current locking connectors | Use one 3-pin board-side connector for the shared DS18B20 temperature bus plus separate humidity and leak connectors |
| Temperature sensor harness | 1 | Preferred | 3-wire 1-Wire DS18B20 harness, 24 to 26 AWG, one trunk with five labeled drops | Powered mode only; branch off-board near the support frame or thermal assembly |
| External driver interface connector | 1 | Preferred | Locking header or pluggable terminal | XIAO board should not carry TEC current |
| SWD pads | 1 set | Preferred | Tag-Connect style or simple test pads | For recovery and debugging |
| USB access | 1 | Preferred | Keep XIAO USB-C physically accessible or provide an extension strategy | Required for development |
| Round Display mating connector geometry | 1 set | Preferred | Exact XIAO-standard 2 x 7 footprint mapping on custom interface board | Needed so the off-the-shelf Round Display can mate cleanly |

## Notes that matter

1. The current PSU is intentionally oversized relative to the TEC nameplate. That is deliberate margin, not a mistake.
2. The current external driver recommendation is acceptable for prototype bring-up, but it is not treated as the final reliability answer.
3. The XIAO Plus and Round Display should sit on a custom interface or interposer PCB, not float on wires.
4. High current for the TEC should stay off the first XIAO interface board.
5. The final spigot OD is not frozen until the three plastic hose-fit coupons are tested against the real Fluval hose.
6. The Round Display consumes most standard XIAO pins, so the additional Plus pads are now part of the control architecture, not just optional margin.