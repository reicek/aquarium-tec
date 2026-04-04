# System BOM

This is the working project BOM. It includes locked parts, recommended parts, and provisional placeholders that still need final selection.

Status legend:

- Locked: considered the current baseline
- Preferred: recommended but still replaceable
- Provisional: best current choice, not frozen
- TBD: exact part not yet frozen

## Thermal and mechanical

| Item                             |    Qty | Status      | Recommended part / spec                                                                       | Notes                                                                                                                                                                          |
| -------------------------------- | -----: | ----------- | --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| TEC module                       |      1 | Locked      | TEC126306 / TEC1-26306, 50 x 50 mm, 24 V, 6 A nominal                                         | Electrical input ceiling about 144 W                                                                                                                                           |
| Hot-side cooler                  |      1 | Locked      | Thermalright Assassin X 120 Refined SE                                                        | Current exact heatsink choice for Intel LGA1700 / LGA1851                                                                                                                      |
| Hot-side fan, prototype          |      1 | Preferred   | Noctua NF-F12 industrialPPC-24V-2000 IP67 PWM                                                 | Replaces the stock cooler fan in the current exact prototype order so the powered build stays on 24 V and 5 V rails only                                                       |
| Copper spreader                  |      1 | Locked      | C110 or OFHC copper, 60 x 60 x 5 mm                                                           | Between TEC and CPU cooler                                                                                                                                                     |
| Thermal paste                    |      1 | Preferred   | Noctua NT-H2, 10 g                                                                            | Use between all metal/TEC interfaces                                                                                                                                           |
| Cold block, fit mockup           |  1 set | Locked      | 3D printed PLA fit prototype; ABS or other rigid plastic acceptable if PLA quoting is awkward | Geometry validation only                                                                                                                                                       |
| Prototype support kit            |      1 | Preferred   | Interlocking plastic support kit, about 248 x 190 mm assembled overall                        | Cradles the block, carries side HMI, uses split PSU uprights plus a center driver spine and a spine-keyed shelf, and can be quoted separately to keep the core fit round cheap |
| Cold block lid, final            |      1 | Locked      | CNC 316L stainless steel                                                                      | Thermal landing, channel pack, and upper wet path                                                                                                                              |
| Cold block base, final           |      1 | Locked      | CNC POM                                                                                       | Lower wet path, O-ring groove, and hybrid base                                                                                                                                 |
| Hose plugs, final                |      2 | Locked      | CNC POM                                                                                       | Separate replaceable hose plugs; final OD follows prototype hose-plug fit result                                                                                               |
| O-ring or seal cord              |      1 | Provisional | EPDM 70A round cord, 2.0 mm cross section                                                     | Final cut length should follow the released groove dimension, not the nominal SCAD perimeter                                                                                   |
| Block assembly screws            |      6 | Preferred   | M3 x 30 mm A2-70 stainless socket-head cap screws                                             | Current exact prototype through-bolt choice; use with washers and locknuts                                                                                                     |
| Compression sleeves / hard stops |      6 | Preferred   | 316 stainless spacer, 3.2 mm ID x 4.0 mm OD x 24 mm long                                      | Current exact prototype hard-stop target; custom cut is acceptable                                                                                                             |
| Insulation foam                  |  1 lot | Preferred   | Armacell AP ArmaFlex self-adhesive sheet, 6 mm                                                | Current default insulation thickness for block and first tubing sections                                                                                                       |
| Tubing clamps                    | 4 to 6 | Preferred   | Oetiker 167-series 304 stainless ear clamps                                                   | Freeze exact size only after hose-plug validation on the real hose                                                                                                             |

## Power and drive

| Item                             |   Qty | Status      | Recommended part / spec                                | Notes                                                                                                                                        |
| -------------------------------- | ----: | ----------- | ------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------- |
| Main PSU                         |     1 | Locked      | Mean Well LRS-350-24, 24 V, 14.6 A, 350.4 W            | Approved baseline supply                                                                                                                     |
| TEC driver, prototype            |     1 | Locked      | IBT-2 Double BTS7960 43 A H-bridge module              | Approved first powered-prototype driver; keep the received board in the 50 x 50 mm class that matches the current support reference          |
| TEC driver, quality-upgrade path |     1 | Provisional | Qualified 24 V driver or custom MOSFET power stage     | Better long-term reliability path                                                                                                            |
| Logic DC-DC                      |     1 | Locked      | TOBSUN EA15-5V, 24 V to 5 V, 3 A, 15 W DC-DC converter | Mandatory powered-prototype 24 V to 5 V logic supply; current support preview places it below the BTS7960 on the lower support-spine landing |
| Fan DC-DC                        |     1 | Provisional | Pololu D24V10F12                                       | Fallback only if the stock 12 V cooler fan is retained; not needed in the current exact prototype order set                                  |
| TEC branch fuse                  |     1 | Preferred   | Bussmann ATM-10                                        | Put close to the PSU output branch point                                                                                                     |
| Logic branch fuse                |     1 | Preferred   | Bussmann ATM-2                                         | Protect the logic buck and controller auxiliaries                                                                                            |
| TEC wiring                       | 1 lot | Preferred   | BNTECHGO 16 AWG silicone wire, red and black           | Keep runs short                                                                                                                              |
| Logic wiring                     | 1 lot | Preferred   | Alpha Wire 3050, 24 AWG stranded hookup wire           | Sensor, alarm, and low-current control wiring                                                                                                |

## Controller and sensing

| Item                          | Qty | Status      | Recommended part / spec                                                                                            | Notes                                                                                          |
| ----------------------------- | --: | ----------- | ------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------------------- |
| Main controller               |   1 | Locked      | Seeed Studio XIAO nRF52840 Plus, SKU 102010672                                                                     | BLE-capable MCU module with 9 extra SMD GPIO                                                   |
| Local HMI                     |   1 | Locked      | Seeed Studio Round Display for XIAO, SKU 104030087                                                                 | 1.28 inch round touch display with RTC and TF slot                                             |
| RTC backup cell               |   1 | Provisional | CR927 coin cell                                                                                                    | Only needed if RTC retention is desired without network sync                                   |
| Controller interface board    |   1 | Preferred   | Custom interposer or interface PCB for XIAO Plus, Round Display, multi-point sensing, alarms, and driver interface | Recommended first PCBWay assembly target                                                       |
| Water temperature sensor      |   1 | Locked      | Adafruit Waterproof DS18B20, PID 381                                                                               | Main aquarium control input if the stock probe is not reused                                   |
| Cold block temperature sensor |   1 | Locked      | Analog Devices DS18B20+                                                                                            | Use TO-92 package on a custom short lead for cold-side monitoring                              |
| Hot-side temperature sensor   |   1 | Locked      | Analog Devices DS18B20+                                                                                            | Use TO-92 package on a custom short lead near the cooler base or heat-pipe root                |
| Air intake temperature sensor |   1 | Locked      | Analog Devices DS18B20+                                                                                            | Use TO-92 package on a light lead support upstream of the fan                                  |
| Air outlet temperature sensor |   1 | Locked      | Analog Devices DS18B20+                                                                                            | Use TO-92 package on a light lead support in the cooler exhaust stream                         |
| Ambient humidity sensor       |   1 | Preferred   | Adafruit SHT31-D breakout, PID 2857                                                                                | Current exact condensation-monitor choice                                                      |
| Leak sensor                   |   1 | Locked      | DFRobot Gravity Water Sensor, SEN0205                                                                              | Included in the current dry-fit and dry-wire prototype; use as the thresholded leak-input path |
| Status indicator              |   1 | Preferred   | Mallory Sonalert PS-580Q                                                                                           | Local alarm                                                                                    |
| Driver interface buffer       |   1 | Preferred   | Texas Instruments SN74AHCT125PW                                                                                    | Treat as standard with the generic BTS7960 module                                              |

## PCB and connectivity

| Item                                    |     Qty | Status    | Recommended part / spec                                                                      | Notes                                                                                                            |
| --------------------------------------- | ------: | --------- | -------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| Control PCB                             |       1 | Preferred | 4-layer FR-4, 1.6 mm, ENIG                                                                   | XIAO Plus interface board with Round Display mating geometry                                                     |
| 24 V auxiliary power connector          |       1 | Preferred | JST B2P-VH(LF)(SN) header, VHR-2N housing, SVH-21T-P1.1 contacts                             | Board-side J1 power entry family                                                                                 |
| Sensor connectors                       | several | Preferred | JST-PH family: B3B-PH-K-S(LF)(SN), B4B-PH-K-S(LF)(SN), PHR housings, SPH-002T-P0.5S contacts | Use 3-pin board-side connectors for temperature and leak, plus one 4-pin connector for humidity or auxiliary I2C |
| Temperature sensor harness              |       1 | Preferred | Belden 9533, 24 AWG 3-conductor trunk with five labeled DS18B20 drops                        | Powered mode only; branch off-board near the support frame or thermal assembly                                   |
| External driver interface connector     |       1 | Preferred | JST B5B-XH-A(LF)(SN) header, XHP-5 housing, SXH-001T-P0.6 contacts                           | Board-side J2 control connector; the XIAO board should not carry TEC current                                     |
| SWD pads                                |   1 set | Preferred | Tag-Connect TC2030-IDC-NL compatible footprint                                               | For recovery and debugging                                                                                       |
| USB access                              |       1 | Preferred | StarTech USB31CSAFM1M panel-mount USB-C extension                                            | Only needed if the XIAO USB-C cannot remain directly accessible                                                  |
| Round Display mating connector geometry |   1 set | Preferred | Exact XIAO-standard 2 x 7 footprint mapping on the custom interface board                    | Needed so the off-the-shelf Round Display can mate cleanly                                                       |

## Notes that matter

1. The current PSU is intentionally oversized relative to the TEC nameplate. That is deliberate margin, not a mistake.
2. The exact first powered-prototype driver is now locked to the approved IBT-2 Double BTS7960 43 A module, but a better-qualified upgrade path remains open if long-term reliability becomes the priority.
3. The XIAO Plus and Round Display should sit on a custom interface or interposer PCB, not float on wires.
4. High current for the TEC should stay off the first XIAO interface board.
5. The final hose-plug OD is not frozen until the three plastic hose-plug options are tested against the real Fluval hose.
6. The Round Display consumes most standard XIAO pins, so the additional Plus pads are now part of the control architecture, not just optional margin.
7. The current exact powered-prototype fan path uses a 24 V Noctua replacement fan on the Thermalright heatsink, so the prototype power tree stays on 24 V and 5 V rails only.
8. The current preview and wiring package assume the main 16.0 mm hose-plug option on both ports for the dry prototype.
